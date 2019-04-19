package org.lanqiao.dao;

import org.lanqiao.domain.Collection;

import java.util.List;

public interface ICollectionDao {
    //新增收藏
    public void insertCollection(Collection collection);
    //修改收藏时间
    public void updateCollection(Collection collection);
    //通过用户id和商品id获取收藏信息
    public Collection selectCollection(Collection collection);
    //通过删除收藏
    public void deleteCollection(int id);
    //通过用户id获取收藏列表（时间倒排）
    public List<Collection> selectCollectionList(int uId);
}
