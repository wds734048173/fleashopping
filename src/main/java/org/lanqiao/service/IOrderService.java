package org.lanqiao.service;

import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Order;
import org.lanqiao.domain.OrderInfo;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:19
 * @Description:
 */
public interface IOrderService {
    //管理员获取所有的订单列表
    public List<Order> getOrderList(Condition condition);
    //管理员获取所有的订单列表
    public int getOrderCount(Condition condition);
    //修改订单状态
    public void updateOrderState(int orderId,int state);
    //通过订单id获取订单详细信息
    public Order getOrderById(int orderId);
    //通过订单id获取订单子表信息
    public List<OrderInfo> getOrderInfoList(int orderId);
    //创建订单
    public void addOrder(Order order,List<OrderInfo> orderInfoList);
    //订单生成后，通过用户id拿最新的订单
    public Order getOrderByUId(int uid);
    //获取自己下单订单列表
    public List<Order> getOwnBuyerOrderList(int uid);
}
