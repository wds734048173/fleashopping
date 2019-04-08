package org.lanqiao.service;

import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Goods;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:17
 * @Description:
 */
public interface IGoodsService {
    //通过模糊查询获取商品列表（后台）
    public List<Goods> getGoodsListByCondition(Condition condition);
    //通过模糊查询获取商品数量（后台）
    public int getGoodsCountByCondition(Condition condition);
}
