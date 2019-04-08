package org.lanqiao.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.lanqiao.dao.IGoodsClassDao;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.GoodsClass;
import org.lanqiao.utils.jdbcUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/5 20:05
 * @Description:
 */
public class GoodsClassDaoImpl implements IGoodsClassDao {
    private QueryRunner qr = new QueryRunner(jdbcUtils.getDataSource());
    @Override
    public List<GoodsClass> selectGoodsClassListByCondition(Condition condition) {
        List<GoodsClass> goodsClassList = null;
        StringBuffer sql = new StringBuffer("SELECT * from tb_class where 1 = 1 ");
        List<Object> search = new ArrayList<>();
        if(condition != null){
            if(condition.getName() != null && !"".equals(condition.getName())){
                sql.append(" and name like ? ");
                search.add("%" + condition.getName() + "%");
            }
            sql.append(" limit ?,?");
            search.add(condition.getCurrentPage());
            search.add(condition.getPageSize());
        }
        try {
            goodsClassList = qr.query(sql.toString(),new BeanListHandler<>(GoodsClass.class),search.toArray());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return goodsClassList;
    }

    @Override
    public int selectGoodsClassCountByCondition(Condition condition) {
        StringBuffer sql = new StringBuffer("SELECT count(1) from tb_class where 1 = 1 ");
        List<Object> search = new ArrayList<>();
        if(condition.getName() != null && !"".equals(condition.getName())){
            sql.append(" and name like ? ");
            search.add("%" + condition.getName() + "%");
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
    public List<GoodsClass> selectGoodsClassList() {
        List<GoodsClass> goodsClassList = null;
        StringBuffer sql = new StringBuffer("SELECT * from tb_class where 1 = 1 ");
        List<Object> search = new ArrayList<>();
        try {
            goodsClassList = qr.query(sql.toString(),new BeanListHandler<>(GoodsClass.class),search.toArray());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return goodsClassList;
    }

    @Override
    public int insertGoodsClass(GoodsClass goodsClass) {
        return 0;
    }

    @Override
    public int updateGoodsClass(GoodsClass goodsClass) {
        return 0;
    }

    @Override
    public int deleteGoodsClassById(int id) {
        return 0;
    }
}
