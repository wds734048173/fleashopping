package org.lanqiao.service.impl;

import org.lanqiao.dao.IOrderDao;
import org.lanqiao.dao.impl.OrderDaoImpl;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Order;
import org.lanqiao.service.IOrderService;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:19
 * @Description:
 */
public class OrderServiceImpl implements IOrderService {

    IOrderDao orderDao = new OrderDaoImpl();
    @Override
    public List<Order> getOrderList(Condition condition) {
        return orderDao.selectOrderList(condition);
    }

    @Override
    public int getOrderCount(Condition condition) {
        return orderDao.selectOrderCount(condition);
    }
}
