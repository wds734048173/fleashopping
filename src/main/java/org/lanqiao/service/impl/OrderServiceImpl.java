package org.lanqiao.service.impl;

import org.lanqiao.dao.IOrderDao;
import org.lanqiao.dao.impl.OrderDaoImpl;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Order;
import org.lanqiao.domain.OrderInfo;
import org.lanqiao.service.IOrderService;
import org.lanqiao.utils.DataMap;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:19
 * @Description:
 */
public class OrderServiceImpl implements IOrderService {

    IOrderDao orderDao = new OrderDaoImpl();
    DecimalFormat df=new DecimalFormat("0.00");
    @Override
    public List<Order> getOrderList(Condition condition) {
        List<Order> orderList = orderDao.selectOrderList(condition);
        Map<Integer,String> orderStateIdNameMap = DataMap.getOrderStateIdNameMap();
        //对订单进行处理
        for(Order order : orderList){
            //对订单金额进行处理
            order.setPricereal(df.format((double)order.getPrice()/100));
            order.setMoneyreal(df.format((double)order.getMoney()/100));
            order.setFreightreal(df.format((double)order.getFreight()/100));
            //对订单状态进行处理
            int state = order.getState();
            if(orderStateIdNameMap.containsKey(state)){
                order.setStateStr(orderStateIdNameMap.get(state));
            }
        }
        return orderList;
    }

    @Override
    public int getOrderCount(Condition condition) {
        return orderDao.selectOrderCount(condition);
    }

    @Override
    public void updateOrderState(int orderId, int state) {
        orderDao.updateOrderState(orderId,state);
    }

    @Override
    public Order getOrderById(int orderId) {
        Order order = orderDao.selectOrderById(orderId);
        Map<Integer,String> stateMap = DataMap.getOrderStateIdNameMap();
        //对订单状态进行转换
        if(stateMap.containsKey(order.getState())){
            order.setStateStr(stateMap.get(order.getState()));
        }
        //对价格进行转换
        order.setPricereal(df.format((double)order.getPrice()/100));
        order.setMoneyreal(df.format((double)order.getMoney()/100));
        order.setFreightreal(df.format((double)order.getFreight()/100));
        return order;
    }

    @Override
    public List<OrderInfo> getOrderInfoList(int orderId) {
        List<OrderInfo> orderInfoList = orderDao.selectOrderInfoListById(orderId);
        for(OrderInfo orderInfo : orderInfoList){
            //对价格进行处理
            orderInfo.setSpricereal(df.format((double)orderInfo.getSprice()/100));
            orderInfo.setYpricereal(df.format((double)orderInfo.getYprice()/100));
        }
        return orderInfoList;
    }
}
