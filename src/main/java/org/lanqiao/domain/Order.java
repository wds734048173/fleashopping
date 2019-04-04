package org.lanqiao.domain;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 21:53
 * @Description:销售订单
 */
public class Order {
    private int id;
    //销售单状态(0未付款1已付款2已发货3已收货4已评论5已取消)
    private int state;
    private String stateStr;
    //销售单类型(0网上订单1线下订单)
    private int type;
    //销售单价格（包含运费）
    private int price;
    //销售单运费
    private int freight;
    //销售人id
    private int sid;
    //购买人id
    private int bid;
    //订单详情列表
    private List<OrderInfo> orderInfoList;

    public Order() {
    }

    public Order(int id, int state, String stateStr, int type, int price, int freight, int sid, int bid, List<OrderInfo> orderInfoList) {
        this.id = id;
        this.state = state;
        this.stateStr = stateStr;
        this.type = type;
        this.price = price;
        this.freight = freight;
        this.sid = sid;
        this.bid = bid;
        this.orderInfoList = orderInfoList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateStr() {
        return stateStr;
    }

    public void setStateStr(String stateStr) {
        this.stateStr = stateStr;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getFreight() {
        return freight;
    }

    public void setFreight(int freight) {
        this.freight = freight;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public List<OrderInfo> getOrderInfoList() {
        return orderInfoList;
    }

    public void setOrderInfoList(List<OrderInfo> orderInfoList) {
        this.orderInfoList = orderInfoList;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", state=" + state +
                ", stateStr='" + stateStr + '\'' +
                ", type=" + type +
                ", price=" + price +
                ", freight=" + freight +
                ", sid=" + sid +
                ", bid=" + bid +
                ", orderInfoList=" + orderInfoList +
                '}';
    }
}
