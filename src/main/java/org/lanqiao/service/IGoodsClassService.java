package org.lanqiao.service;

import org.lanqiao.domain.Condition;
import org.lanqiao.domain.GoodsClass;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/5 19:49
 * @Description:
 */
public interface IGoodsClassService {
    //获取分类列表（分页，查询条件）（后台）
    public List<GoodsClass> getGoodsClassListByCondition(Condition condition);
    //获取分类数量（分页，查询条件）（后台）
    public int getGoodsClassCountByCondition(Condition condition);
    //获取分类列表（全部，无查询条件）
    public List<GoodsClass> getGoodsClassList();
    //新增分类
    public void addGoodsClass(GoodsClass goodsClass);
    //修改分类
    public void modifyGoodsClass(GoodsClass goodsClass);
    //删除分类（假删，因为可能有商品已经在这个分类下）
    public void deleteGoodsClassById(int id);
    //通过id获取商品分类信息
    public GoodsClass getGoodsClassById(int id);
}
