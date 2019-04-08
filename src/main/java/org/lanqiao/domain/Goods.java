package org.lanqiao.domain;

import lombok.*;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 21:53
 * @Description:商品
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class Goods {
    private int id;
    //商品名称
    private String name;
    //商品图片
    private String pic;
    //商品分类id
    private int classId;
    //商品原价
    private int yprice;
    //商品销售价
    private int sprice;
    //商品描述
    private String remark;
    //商品所属用户id
    private int uId;
}
