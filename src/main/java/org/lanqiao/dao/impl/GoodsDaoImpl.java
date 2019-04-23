package org.lanqiao.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.lanqiao.dao.IGoodsDao;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Goods;
import org.lanqiao.utils.jdbcUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:14
 * @Description:
 */
public class GoodsDaoImpl implements IGoodsDao {
    private QueryRunner qr = new QueryRunner(jdbcUtils.getDataSource());

    @Override
    public void insertGoods(Goods goods) {
        String sql = "INSERT INTO tb_goods (name,pic,classId,yprice,sprice,remark,ctime,uid) VALUES (?,?,?,?,?,?,now(),?)";
        try {
            qr.execute(sql,goods.getName(),goods.getPic(),goods.getClassId(),goods.getYprice(),goods.getSprice(),goods.getRemark(),goods.getUId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateGoods(Goods goods) {
        String sql = "UPDATE tb_goods SET name = ?,classId = ?, yprice = ?, sprice = ?, remark = ?,rtime = now() WHERE id = ?";
        try {
            qr.execute(sql,goods.getName(),goods.getClassId(),goods.getYprice(),goods.getSprice(),goods.getRemark(),goods.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Goods selectGoodsById(int id) {
        Goods goods = null;
        String sql = "SELECT * from tb_goods where id = ?";
        try {
            goods = qr.query(sql,new BeanHandler<>(Goods.class),id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return goods;
    }

    @Override
    public List<Goods> selectGoodsListAll(Condition condition) {
        List<Goods> goodsList = null;
        StringBuffer sql = new StringBuffer("SELECT * from tb_goods where state = 0 ");
        List<Object> search = new ArrayList<>();
        if(condition != null){
            if(condition.getName() != null && !"".equals(condition.getName())){
                sql.append(" and name like ? ");
                search.add("%" + condition.getName() + "%");
            }
            if(condition.getGoodsClassId() != null && !"-1".equals(condition.getGoodsClassId())){
                sql.append(" and classId = ? ");
                search.add(condition.getGoodsClassId());
            }
        }
        try {
            goodsList = qr.query(sql.toString(),new BeanListHandler<>(Goods.class),search.toArray());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return goodsList;
    }

    @Override
    public void updateGoodsState(int id,int state) {
        String sql = "UPDATE tb_goods SET state = ?,rtime = now() WHERE id = ?";
        try {
            qr.execute(sql,state,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Goods> selectGoodsListByCondition(Condition condition) {
        List<Goods> goodsList = null;
        StringBuffer sql = new StringBuffer("SELECT * from tb_goods where 1 = 1 ");
        List<Object> search = new ArrayList<>();
        if(condition != null){
            if(condition.getName() != null && !"".equals(condition.getName())){
                sql.append(" and name like ? ");
                search.add("%" + condition.getName() + "%");
            }
            if(condition.getGoodsClassId() != null && !"-1".equals(condition.getGoodsClassId())){
                sql.append(" and classId = ? ");
                search.add(condition.getGoodsClassId());
            }
            if(condition.getState() != null && !"-1".equals(condition.getState())){
                sql.append(" and state = ? ");
                search.add(condition.getState());
            }else{
                sql.append(" and state != ? ");
                search.add(3);
            }
            if(condition.getSId() != null && !"".equals(condition.getSId())){
                sql.append(" and uid = ? ");
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
            goodsList = qr.query(sql.toString(),new BeanListHandler<>(Goods.class),search.toArray());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return goodsList;
    }

    @Override
    public int selectGoodsCountByCondition(Condition condition) {
        StringBuffer sql = new StringBuffer("SELECT count(1) from tb_goods where 1 = 1 ");
        List<Object> search = new ArrayList<>();
        if(condition != null){
            if(condition.getName() != null && !"".equals(condition.getName())){
                sql.append(" and name like ? ");
                search.add("%" + condition.getName() + "%");
            }
            if(condition.getGoodsClassId() != null && !"-1".equals(condition.getGoodsClassId())){
                sql.append(" and classId = ? ");
                search.add(condition.getGoodsClassId());
            }
            if(condition.getState() != null && !"-1".equals(condition.getState())){
                sql.append(" and state = ? ");
                search.add(condition.getState());
            }else{
                sql.append(" and state != ? ");
                search.add(3);
            }
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
    public List<Goods> selectGoodsListByIds(List<String> idList) {
        List<Goods> goodsList = null;
        StringBuffer sql = new StringBuffer("SELECT * from tb_goods where id in ");
        if(idList.size() == 1){
            sql.append( "(" + idList.get(0) + ")");
        }else{
            for (int i = 0; i < idList.size(); i++) {
                if(i == 0){
                    sql.append( "(" + idList.get(i) + ",");
                }else if(i == idList.size() - 1){
                    sql.append(idList.get(i) + ")");
                }else{
                    sql.append(idList.get(i) + ",");
                }
            }
        }
        try {
            goodsList = qr.query(sql.toString(),new BeanListHandler<>(Goods.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return goodsList;
    }
}
