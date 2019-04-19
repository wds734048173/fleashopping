package org.lanqiao.service;

import org.lanqiao.domain.Collection;

import java.util.List;

public interface ICollectionService {
    //新增收藏
    public void addCollection(Collection collection);
    //修改收藏时间
    public void modifyCollection(Collection collection);
    //通过用户id和商品id获取收藏信息
    public Collection getCollection(Collection collection);
    //通过删除收藏
    public void removeCollection(int id);
    //通过用户id获取收藏列表（时间倒排）
    public List<Collection> getCollectionList(int uId);
}
