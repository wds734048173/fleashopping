package org.lanqiao.dao;

import org.lanqiao.domain.Condition;
import org.lanqiao.domain.GoodsClass;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/5 20:04
 * @Description:
 */
public interface IGoodsClassDao {
    //获取分类列表（分页，查询条件）
    public List<GoodsClass> selectGoodsClassListByCondition(Condition condition);
    //获取分类数量（分页，查询条件）
    public int selectGoodsClassCountByCondition(Condition condition);
    //获取分类列表（全部，无查询条件）
    public List<GoodsClass> selectGoodsClassList();
    //新增分类
    public int insertGoodsClass(GoodsClass goodsClass);
    //修改分类
    public int updateGoodsClass(GoodsClass goodsClass);
    //删除分类（假删，因为可能有商品已经在这个分类下）
    public int deleteGoodsClassById(int id);
}
