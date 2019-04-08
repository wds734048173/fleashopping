package org.lanqiao.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.lanqiao.dao.IGoodsDao;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Goods;
import org.lanqiao.domain.GoodsClass;
import org.lanqiao.utils.jdbcUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:14
 * @Description:
 */
public class GoodsDaoImpl implements IGoodsDao {
    private QueryRunner qr = new QueryRunner(jdbcUtils.getDataSource());

    @Override
    public void insertGoods(Goods goods) {

    }

    @Override
    public void updateGoods(Goods goods) {

    }

    @Override
    public void deleteGoodsById(int id) {

    }

    @Override
    public List<Goods> selectGoodsList(Condition condition) {
        return null;
    }

    @Override
    public Long selectGoodsCount(Condition condition) {
        return null;
    }

    @Override
    public List<Goods> selectGoodsOtherList(Condition condition) {
        return null;
    }

    @Override
    public Long selectGoodsOtherCount(Condition condition) {
        return null;
    }

    @Override
    public void updateGoodsState(int id) {

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
            sql.append(" limit ?,?");
            search.add(condition.getCurrentPage());
            search.add(condition.getPageSize());
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
}
