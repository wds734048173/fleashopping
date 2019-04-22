package org.lanqiao.service.impl;

import org.lanqiao.dao.ICollectionDao;
import org.lanqiao.dao.IGoodsDao;
import org.lanqiao.dao.impl.CollectionDaoImpl;
import org.lanqiao.dao.impl.GoodsDaoImpl;
import org.lanqiao.domain.Collection;
import org.lanqiao.domain.Goods;
import org.lanqiao.service.ICollectionService;
import org.lanqiao.utils.DataMap;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CollectionServiceImpl implements ICollectionService {

    ICollectionDao collectionDao = new CollectionDaoImpl();
    IGoodsDao goodsDao = new GoodsDaoImpl();
    DecimalFormat df=new DecimalFormat("0.00");
    @Override
    public void addCollection(Collection collection) {
        collectionDao.insertCollection(collection);
    }

    @Override
    public void modifyCollection(Collection collection) {
        collectionDao.updateCollection(collection);
    }

    @Override
    public Collection getCollection(Collection collection) {
        return collectionDao.selectCollection(collection);
    }

    @Override
    public void removeCollection(int id) {
        collectionDao.deleteCollection(id);
    }

    @Override
    public List<Collection> getCollectionList(int uId) {
        //对收藏商品进行处理
        List<Collection> collectionList = collectionDao.selectCollectionList(uId);
        Map<Integer,String> goodsStateIdNameMap = DataMap.getGoodsStateIdNameMap();
        //获取商品id列表
        /*StringBuffer goodsIds = new StringBuffer("(");
        for(int i = 0; i < collectionList.size(); i++){
            if(i == collectionList.size()-1){
                goodsIds.append(collectionList.get(i).getGId() + ")");
            }else{
                goodsIds.append(collectionList.get(i).getGId() + ",");
            }
        }*/
        List<String> goodsIds = new ArrayList<>();
        for(Collection collection : collectionList){
            goodsIds.add(collection.getGId() + "");
        }
        //通过ids获取商品详细详细列表
        List<Goods> goodsList = goodsDao.selectGoodsListByIds(goodsIds);
        for(Collection collection : collectionList){
            int goodsId = collection.getGId();
            for(Goods goods : goodsList){
                int id = goods.getId();
                if(goodsId == id){
                    //完善收藏的信息
                    collection.setGName(goods.getName());
                    collection.setGPic(goods.getPic());
                    collection.setSprice(goods.getSprice());
                    collection.setYprice(goods.getYprice());
                    collection.setGState(goods.getState());
                    //对价格进行处理
                    collection.setSpricereal(df.format((double)goods.getSprice()/100));
                    collection.setYpricereal(df.format((double)goods.getYprice()/100));
                    //对商品状态进行转换
                    if(goodsStateIdNameMap.containsKey(goods.getState())){
                        collection.setGStateStr(goodsStateIdNameMap.get(goods.getState()));
                    }
                }
            }
        }
        return collectionList;
    }
}
