package org.lanqiao.domain;

import lombok.*;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 21:53
 * @Description:收货地址
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class Address {
    private int id;
    //用户id
    private int uid;
    //地址
    private String address;
    //地址状态，0表示默认地址，1表示其他地址
    private int state;
    private String realname;
    private String telphone;

}
