package org.lanqiao.dao;


import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Order;
import org.lanqiao.domain.OrderInfo;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:15
 * @Description:
 */
public interface IOrderDao {
    //新增订单
    public void insertOrder(Order order,List<OrderInfo> orderInfoList);
    //修改订单状态
    public void updateOrderState(int orderId,int state);
    //获取个人订单列表
    public List<Order> selectOwnerOrderList(int uId);
    //获取个人订单数量
    public int selectOwnerOrderCount(int uId);
    //获取全部订单
    public List<Order> selectOrderList(Condition condition);
    //获取全部订单数量
    public int selectOrderCount(Condition condition);
    //通过订单id获取订单详情
    public Order selectOrderById(int orderId);
    //通过订单id获取订单详情列表
    public List<OrderInfo> selectOrderInfoListById(int orderId);
    //通过用户id获取最新订单
    public Order selectOrderByUId(int uid);
    //获取自己下单列表
    public List<Order> selectOwnBuyerOrderList(int uid);
}
