package org.lanqiao.service.impl;

import org.lanqiao.dao.IGoodsDao;
import org.lanqiao.dao.impl.GoodsDaoImpl;
import org.lanqiao.domain.Condition;

import org.lanqiao.domain.Goods;
import org.lanqiao.service.IGoodsService;
import org.lanqiao.utils.DataMap;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:18
 * @Description:
 */
public class GoodsServiceImpl implements IGoodsService {
    IGoodsDao goodsDao = new GoodsDaoImpl();
    DecimalFormat df=new DecimalFormat("0.00");
    @Override
    public List<Goods> getGoodsListByCondition(Condition condition) {
        List<Goods> goodsList = goodsDao.selectGoodsListByCondition(condition);
        Map<Integer,String> goodsClassIdNameMap = DataMap.getGoodsClassIdNameMap();
        Map<Integer,String> goodsStateIdNameMap = DataMap.getGoodsStateIdNameMap();
        for(Goods goods : goodsList){
            //对价格进行处理
            goods.setSpricereal(df.format((double)goods.getSprice()/100));
            goods.setYpricereal(df.format((double)goods.getYprice()/100));
            //对商品分类进行处理
            int goodsClassId = goods.getClassId();
            if(goodsClassIdNameMap.containsKey(goodsClassId)){
                goods.setClassStr(goodsClassIdNameMap.get(goodsClassId));
            }
            //对商品状态进行处理
            int state = goods.getState();
            if(goodsStateIdNameMap.containsKey(state)){
                goods.setStateStr(goodsStateIdNameMap.get(state));
            }
        }
        return goodsList;
    }

    @Override
    public int getGoodsCountByCondition(Condition condition) {
        return goodsDao.selectGoodsCountByCondition(condition);
    }

    @Override
    public void downGoodsById(int id) {
        goodsDao.updateGoodsState(id,1);
    }

    @Override
    public void upGoodsById(int id) {
        goodsDao.updateGoodsState(id,0);
    }

    @Override
    public void removeGoodsById(int id) {
        goodsDao.updateGoodsState(id,3);
    }

    @Override
    public Goods getGoodsById(int id) {
        Goods goods = goodsDao.selectGoodsById(id);
        Map<Integer,String> goodsClassIdNameMap = DataMap.getGoodsClassIdNameMap();
        Map<Integer,String> goodsStateIdNameMap = DataMap.getGoodsStateIdNameMap();
        //对价格进行处理
        goods.setSpricereal(df.format((double)goods.getSprice()/100));
        goods.setYpricereal(df.format((double)goods.getYprice()/100));
        //对商品分类进行处理
        int goodsClassId = goods.getClassId();
        if(goodsClassIdNameMap.containsKey(goodsClassId)){
            goods.setClassStr(goodsClassIdNameMap.get(goodsClassId));
        }
        //对商品状态进行处理
        int state = goods.getState();
        if(goodsStateIdNameMap.containsKey(state)){
            goods.setStateStr(goodsStateIdNameMap.get(state));
        }
        return goods;
    }

    @Override
    public List<Goods> getGoodsListAll(Condition condition) {
        List<Goods> goodsList = goodsDao.selectGoodsListAll(condition);
        for(Goods goods : goodsList){
            //对价格进行处理
            goods.setSpricereal(df.format((double)goods.getSprice()/100));
            goods.setYpricereal(df.format((double)goods.getYprice()/100));
        }
        return goodsList;
    }

    @Override
    public void addGoods(Goods goods) {
        goodsDao.insertGoods(goods);
    }

    @Override
    public void modifyGoods(Goods goods) {
        goodsDao.updateGoods(goods);
    }
}
