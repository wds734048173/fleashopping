package org.lanqiao.domain;

import lombok.*;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 21:54
 * @Description:商品分类
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class GoodsClass {
    //商品分类id
    private int id;
    //商品分类名称
    private String name;
    //商品分类状态
    private int state;
    private String stateStr;

}
