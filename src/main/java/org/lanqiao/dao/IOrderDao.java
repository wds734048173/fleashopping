package org.lanqiao.dao;


import org.lanqiao.domain.Order;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:15
 * @Description:
 */
public interface IOrderDao {
    //新增订单
    public void insertOrder(Order order);
    //修改订单状态
    //删除订单
    //获取个人订单列表
    //获取个人订单数量
    //获取全部订单
    //获取全部订单数量
}
