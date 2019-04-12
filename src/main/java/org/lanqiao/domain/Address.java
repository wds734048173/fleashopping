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

    public Address() {
    }

    public Address(int id, int uid, String address, int state, String realname, String telphone) {
        this.id = id;
        this.uid = uid;
        this.address = address;
        this.state = state;
        this.realname = realname;
        this.telphone = telphone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", uid=" + uid +
                ", address='" + address + '\'' +
                ", state=" + state +
                ", realname='" + realname + '\'' +
                ", telphone='" + telphone + '\'' +
                '}';
    }
}
