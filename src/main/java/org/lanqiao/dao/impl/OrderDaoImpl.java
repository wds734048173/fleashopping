package org.lanqiao.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.lanqiao.dao.IOrderDao;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Order;
import org.lanqiao.domain.OrderInfo;
import org.lanqiao.utils.jdbcUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:15
 * @Description:
 */
public class OrderDaoImpl implements IOrderDao {
    private QueryRunner qr = new QueryRunner(jdbcUtils.getDataSource());

    @Override
    public void insertOrder(Order order,List<OrderInfo> orderInfoList) {
        Connection conn = null;
        try {
            conn = jdbcUtils.getConnection();
            conn.setAutoCommit(false);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql1 = "insert into tb_order(no,state,type,price,sid,freight,bid,realname,telphone,address,ctime) values(?,?,?,?,?,?,?,?,?,?,now())";
        String sql2 = "select max(id) from tb_order";
        String sql3 = "insert into tb_order_info (oid,gid,gname,yprice,sprice,num,gpic) values (?,?,?,?,?,?,?)";
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        try {
            qr.execute(sql1,order.getNo(),order.getState(),order.getType(),order.getMoney(),order.getSid(),order.getFreight(),order.getBid(),order.getRealname(),order.getTelphone(),order.getAddress());
            int oId = qr.query(sql2,new ScalarHandler<>(1));
            for (int i = 0; i < orderInfoList.size(); i++) {
                qr.execute(sql3,oId,orderInfoList.get(i).getOId(),orderInfoList.get(i).getGId(),orderInfoList.get(i).getGname(),orderInfoList.get(i).getYprice(),orderInfoList.get(i).getSprice(),orderInfoList.get(i).getNum(),orderInfoList.get(i).getGpic());
            }
            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /*@Override
    public void updateOrderState(Order order) {
        String sql = "UPDATE tb_order SET name = ?,rtime = now() WHERE id = ?";
        try {
            qr.execute(sql,goodsClass.getName(),goodsClass.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }*/

    @Override
    public List<Order> selectOwnerOrderList(int uId) {
        List<Order> orderList = null;
        StringBuffer sql = new StringBuffer("SELECT * from tb_order where 1 = 1 ");
        List<Object> search = new ArrayList<>();
        try {
            orderList = qr.query(sql.toString(),new BeanListHandler<>(Order.class),search.toArray());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }

    @Override
    public int selectOwnerOrderCount(int uId) {
        StringBuffer sql = new StringBuffer("SELECT count(1) from tb_order where 1 = 1 ");
        List<Object> search = new ArrayList<>();
        /*if(condition.getName() != null && !"".equals(condition.getName())){
            sql.append(" and name like ? ");
            search.add("%" + condition.getName() + "%");
        }*/
        Long count = 0L;
        try {
            count = qr.query(sql.toString(),new ScalarHandler<>(1),search.toArray());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Integer.valueOf(count.toString());
    }

    @Override
    public List<Order> selectOrderList(Condition condition) {
        List<Order> orderList = null;
        StringBuffer sql = new StringBuffer("SELECT * from tb_order where 1 = 1 ");
        List<Object> search = new ArrayList<>();
        if(condition.getOrderNo() != null && !"".equals(condition.getOrderNo())){
            sql.append(" and no like ? ");
            search.add("%" + condition.getOrderNo() + "%");
        }
        if(condition.getState() != null && !"".equals(condition.getState())){
            sql.append(" and state = ? ");
            search.add(condition.getState());
        }
        try {
            orderList = qr.query(sql.toString(),new BeanListHandler<>(Order.class),search.toArray());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }

    @Override
    public int selectOrderCount(Condition condition) {
        StringBuffer sql = new StringBuffer("SELECT count(1) from tb_order where 1 = 1 ");
        List<Object> search = new ArrayList<>();
        if(condition.getOrderNo() != null && !"".equals(condition.getOrderNo())){
            sql.append(" and no like ? ");
            search.add("%" + condition.getOrderNo() + "%");
        }
        if(condition.getState() != null && !"".equals(condition.getState())){
            sql.append(" and state = ? ");
            search.add(condition.getState());
        }
        Long count = 0L;
        try {
            count = qr.query(sql.toString(),new ScalarHandler<>(1),search.toArray());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Integer.valueOf(count.toString());
    }

    @Override
    public Order selectOrderById(int orderId) {
        String sql = "SELECT * FROM tb_order WHERE id = ?";
        Order order = null;
        try {
            order = qr.query(sql,new BeanHandler<>(Order.class),orderId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    @Override
    public List<OrderInfo> selectOrderInfoListById(int orderId) {
        List<OrderInfo> orderInfoList = null;
        StringBuffer sql = new StringBuffer("SELECT * from tb_order_info where 1 = 1 ");
        List<Object> search = new ArrayList<>();
        try {
            orderInfoList = qr.query(sql.toString(),new BeanListHandler<>(OrderInfo.class),search.toArray());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderInfoList;
    }
}
