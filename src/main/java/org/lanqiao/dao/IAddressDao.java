package org.lanqiao.dao;

import org.lanqiao.domain.Address;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:13
 * @Description:
 */
public interface IAddressDao {
    //新增收货地址
    public void insertAddress(Address address);
    //修改收货地址
    public void updateAddress(Address address);
    //删除收货地址
    public void delectAddressById(int id);
    //获取收货地址列表
    public List<Address> selectAddressList(int uId);
    //获取收货地址数量
    public Long selectAddressCount(int uId);
    //设置默认收货地址
    public void updateAddressStateById(int id,int uId);
}
