package org.lanqiao.domain;

import lombok.*;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 21:53
 * @Description:销售订单
 */

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
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
}
