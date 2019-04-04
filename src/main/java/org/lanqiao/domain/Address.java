package org.lanqiao.domain;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 21:53
 * @Description:收货地址
 */
public class Address {
    private int id;
    //用户id
    private int uid;
    //地址
    private String address;
    //地址状态，0表示默认地址，1表示其他地址
    private int state;

    public Address() {
    }

    public Address(int id, int uid, String address, int state) {
        this.id = id;
        this.uid = uid;
        this.address = address;
        this.state = state;
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

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", uid=" + uid +
                ", address='" + address + '\'' +
                ", state=" + state +
                '}';
    }
}
