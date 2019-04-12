package org.lanqiao.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.lanqiao.dao.IAddressDao;
import org.lanqiao.domain.Address;
import org.lanqiao.utils.jdbcUtils;

import java.sql.SQLException;
import java.util.ArrayList;
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
        String sql = "INSERT INTO tb_address (uid,address,realname,telphone,state,ctime) VALUES (?,?,?,?,0,now())";
        try {
            qr.execute(sql,address.getUid(),address.getAddress());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateAddress(Address address) {
        String sql = "UPDATE tb_address SET address = ?,rtime = now() WHERE id = ?";
        try {
            qr.execute(sql,address.getAddress(),address.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delectAddressById(int id) {
        String sql = "DELETE FROM tb_address WHERE id = ?";
        try {
            qr.execute(sql,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Address> selectAddressList(int uId) {
        List<Address> addressList = null;
        StringBuffer sql = new StringBuffer("SELECT * from tb_address where 1 = 1 ");
        List<Object> search = new ArrayList<>();
        try {
            addressList = qr.query(sql.toString(),new BeanListHandler<>(Address.class),search.toArray());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return addressList;
    }

    @Override
    public int selectAddressCount(int uId) {
        StringBuffer sql = new StringBuffer("SELECT count(1) from tb_address where 1 = 1 ");
        List<Object> search = new ArrayList<>();
        Long count = 0L;
        try {
            count = qr.query(sql.toString(),new ScalarHandler<>(1),search.toArray());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Integer.valueOf(count.toString());
    }

    /*@Override
    public void updateAddressStateById(int id, int uId) {
        String sql = "UPDATE tb_address SET name = ?,rtime = now() WHERE id = ?";
        try {
            qr.execute(sql,goodsClass.getName(),goodsClass.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }*/
}
