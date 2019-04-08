package org.lanqiao.service.impl;

import org.lanqiao.dao.IGoodsDao;
import org.lanqiao.dao.impl.GoodsDaoImpl;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Goods;
import org.lanqiao.service.IGoodsService;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:18
 * @Description:
 */
public class GoodsServiceImpl implements IGoodsService {
    IGoodsDao goodsDao = new GoodsDaoImpl();
    @Override
    public List<Goods> getGoodsListByCondition(Condition condition) {
        return goodsDao.selectGoodsListByCondition(condition);
    }

    @Override
    public int getGoodsCountByCondition(Condition condition) {
        return goodsDao.selectGoodsCountByCondition(condition);
    }
}
