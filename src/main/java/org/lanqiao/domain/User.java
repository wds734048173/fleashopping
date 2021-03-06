package org.lanqiao.domain;

import lombok.*;

import java.util.Date;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 21:52
 * @Description:用户
 */

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class User {
    private int id;
    //用户名
    private String username;
    //密码
    private String password;
    //性别0男1女
    private int sex;
    private String sexStr;
    //大学名称
    private String collage;
    //真实名称
    private String realname;
    //角色（0管理员，1普通用户）
    private int role;
    private String roleStr;
    //用户状态（0正常1停用2删除）
    private int state;
    private String stateStr;

    private String telphone;
    private String email;
    private String address;

    private Date ctime;
    private Date rtime;

}
