package org.lanqiao.service;

import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Order;

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
}
