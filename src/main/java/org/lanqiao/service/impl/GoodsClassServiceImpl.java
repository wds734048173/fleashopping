package org.lanqiao.service.impl;

import org.lanqiao.dao.IGoodsClassDao;
import org.lanqiao.dao.impl.GoodsClassDaoImpl;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.GoodsClass;
import org.lanqiao.service.IGoodsClassService;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/5 19:50
 * @Description:
 */
public class GoodsClassServiceImpl implements IGoodsClassService {

    IGoodsClassDao goodsClassDao = new GoodsClassDaoImpl();

    @Override
    public List<GoodsClass> getGoodsClassListByCondition(Condition condition) {
        return goodsClassDao.selectGoodsClassListByCondition(condition);
    }

    @Override
    public int getGoodsClassCountByCondition(Condition condition) {
        return goodsClassDao.selectGoodsClassCountByCondition(condition);
    }

    @Override
    public List<GoodsClass> getGoodsClassList() {
        return goodsClassDao.selectGoodsClassList();
    }

    @Override
    public int addGoodsClass(GoodsClass goodsClass) {
        return goodsClassDao.insertGoodsClass(goodsClass);
    }

    @Override
    public int modifyGoodsClass(GoodsClass goodsClass) {
        return goodsClassDao.updateGoodsClass(goodsClass);
    }

    @Override
    public int deleteGoodsClassById(int id) {
        return goodsClassDao.deleteGoodsClassById(id);
    }
}
