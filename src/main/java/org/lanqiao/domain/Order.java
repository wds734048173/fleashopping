package org.lanqiao.domain;

import lombok.*;

import java.util.Date;
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
    private String no;
    //销售单状态(0未付款1已付款2已发货3已收货4已评论5已取消)
    private int state;
    private String stateStr;
    //销售单类型(0网上订单1线下订单)
    private int type;
    //销售单价格（包含运费）
    private int price;
    private String pricereal;
    //实际支付金额
    private int money;
    private String moneyreal;
    //销售单运费
    private int freight;
    private String freightreal;
    //销售人id
    private int sid;
    private String sStr;
    //购买人id
    private int bid;
    private String bStr;
    //收货信息
    private String realname;
    private String telphone;
    private String address;

    private Date ctime;
    private Date paytime;
    private Date sendtime;
    private Date receivetime;
    private Date canceltime;
    private Date commenttime;
    //订单详情列表
    private List<OrderInfo> orderInfoList;

}
