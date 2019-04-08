package org.lanqiao.domain;

import lombok.*;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 21:53
 * @Description:销售订单详情
 */

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class OrderInfo {
    private int id;
    //销售单id
    private int sId;
    //商品id
    private int gId;
    //商品数量
    private int num;
    //商品原价
    private int yprice;
    //商品销售价
    private int sprice;
    //商品名称
    private String gname;
    //商品图片
    private String gpic;
}
