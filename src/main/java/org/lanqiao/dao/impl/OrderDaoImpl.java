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
        String sql1 = "insert into tb_order(no,state,type,price,sid,freight,bid,realname,telphone,address,ctime,money) values(?,?,?,?,?,?,?,?,?,?,now(),?)";
        String sql2 = "select max(id) from tb_order";
        String sql3 = "insert into tb_order_info (oid,gid,gname,yprice,sprice,num,gpic) values (?,?,?,?,?,?,?)";
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        try {
            qr.execute(sql1,order.getNo(),order.getState(),order.getType(),order.getMoney(),order.getSid(),order.getFreight(),order.getBid(),order.getRealname(),order.getTelphone(),order.getAddress(),order.getMoney());
            int oId = qr.query(sql2,new ScalarHandler<>(1));
            for (int i = 0; i < orderInfoList.size(); i++) {
                qr.execute(sql3,oId,orderInfoList.get(i).getGId(),orderInfoList.get(i).getGname(),orderInfoList.get(i).getYprice(),orderInfoList.get(i).getSprice(),orderInfoList.get(i).getNum(),orderInfoList.get(i).getGpic());
            }
            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateOrderState(int orderId, int state) {
        String sql = "";
        if(state == 6){
            sql = "UPDATE tb_order SET canceltime = now(),state = ? WHERE id = ?";
        }else if(state == 2){
            sql = "UPDATE tb_order SET paytime = now(),state = ? WHERE id = ?";
        }else if(state == 3){
            sql = "UPDATE tb_order SET sendtime = now(),state = ? WHERE id = ?";
        }else if(state == 4){
            sql = "UPDATE tb_order SET receivetime = now(),state = ? WHERE id = ?";
        }else if(state == 5){
            sql = "UPDATE tb_order SET commenttime = now(),state = ? WHERE id = ?";
        }
        try {
            qr.execute(sql,state,orderId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

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
        if(condition != null){
            if(condition.getOrderNo() != null && !"".equals(condition.getOrderNo())){
                sql.append(" and no like ? ");
                search.add("%" + condition.getOrderNo() + "%");
            }
            if(condition.getState() != null && !"".equals(condition.getState())){
                sql.append(" and state = ? ");
                search.add(condition.getState());
            }
            if(condition.getBId() != null && !"".equals(condition.getBId())){
                sql.append(" and bid = ? ");
                search.add(condition.getBId());
            }
            if(condition.getSId() != null && !"".equals(condition.getSId())){
                sql.append(" and sid = ? ");
                search.add(condition.getSId());
            }
            sql.append(" order by ctime desc ");
            if(condition.getCurrentPage() != 0){
                sql.append( " limit ?,?");
                search.add(condition.getCurrentPage());
                search.add(condition.getPageSize());
            }
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
        if(condition.getBId() != null && !"".equals(condition.getBId())){
            sql.append(" and bid = ? ");
            search.add(condition.getBId());
        }
        if(condition.getSId() != null && !"".equals(condition.getSId())){
            sql.append(" and sid = ? ");
            search.add(condition.getSId());
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
        String sql = "SELECT * from tb_order_info where oid = ? ";
        try {
            orderInfoList = qr.query(sql,new BeanListHandler<>(OrderInfo.class),orderId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderInfoList;
    }

    @Override
    public Order selectOrderByUId(int uid) {
        String sql = "SELECT * FROM tb_order WHERE bid = ? order by ctime desc limit 1";
        Order order = null;
        try {
            order = qr.query(sql,new BeanHandler<>(Order.class),uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    @Override
    public List<Order> selectOwnBuyerOrderList(int uid) {
        List<Order> orderList = null;
        String sql = "SELECT * from tb_order where bid = ? order by ctime desc ";
        try {
            orderList = qr.query(sql,new BeanListHandler<>(Order.class),uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }
}
