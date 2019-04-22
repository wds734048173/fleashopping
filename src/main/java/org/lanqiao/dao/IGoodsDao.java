package org.lanqiao.dao;

import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Goods;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:14
 * @Description:
 */
public interface IGoodsDao {
    //新增商品信息
    public void insertGoods(Goods goods);
    //修改商品信息
    public void updateGoods(Goods goods);
    //删除商品
    public void deleteGoodsById(int id);
    //通过商品id获取商品信息
    public Goods selectGoodsById(int id);
    //获取其他人商品信息（全部）
    public List<Goods> selectGoodsListAll(Condition condition);
    //修改商品状态
    public void updateGoodsState(int id,int state);
    //通过模糊查询获取商品列表（后台）
    public List<Goods> selectGoodsListByCondition(Condition condition);
    //通过模糊查询获取商品数量（后台）
    public int selectGoodsCountByCondition(Condition condition);
    //通过ids获取商品列表
    public List<Goods> selectGoodsListByIds(List<String> idList);
}
