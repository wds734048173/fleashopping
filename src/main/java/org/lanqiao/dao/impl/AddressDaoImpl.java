package org.lanqiao.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.lanqiao.dao.IAddressDao;
import org.lanqiao.domain.Address;
import org.lanqiao.utils.jdbcUtils;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:13
 * @Description:
 */
public class AddressDaoImpl implements IAddressDao {
    private QueryRunner qr = new QueryRunner(jdbcUtils.getDataSource());
    @Override
    public void insertAddress(Address address) {

    }

    @Override
    public void updateAddress(Address address) {

    }

    @Override
    public void delectAddressById(int id) {

    }

    @Override
    public List<Address> selectAddressList(int uId) {
        return null;
    }

    @Override
    public Long selectAddressCount(int uId) {
        return null;
    }

    @Override
    public void updateAddressStateById(int id, int uId) {

    }
}
