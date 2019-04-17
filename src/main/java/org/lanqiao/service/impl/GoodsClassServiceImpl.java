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
    public void addGoodsClass(GoodsClass goodsClass) {
        goodsClassDao.insertGoodsClass(goodsClass);
    }

    @Override
    public void modifyGoodsClass(GoodsClass goodsClass) {
        goodsClassDao.updateGoodsClass(goodsClass);
    }

    @Override
    public void deleteGoodsClassById(int id) {
        goodsClassDao.deleteGoodsClassById(id);
    }

    @Override
    public GoodsClass getGoodsClassById(int id) {
        return goodsClassDao.selectGoodsClassById(id);
    }

    @Override
    public List<GoodsClass> getGoodsClassListForSelect() {
        return goodsClassDao.selectGoodsClassListForSelect();
    }
}
