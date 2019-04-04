package org.lanqiao.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.lanqiao.dao.IGoodsDao;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Goods;
import org.lanqiao.utils.jdbcUtils;

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
}
