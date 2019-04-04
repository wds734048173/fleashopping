package org.lanqiao.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.lanqiao.dao.IOrderDao;
import org.lanqiao.domain.Order;
import org.lanqiao.utils.jdbcUtils;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:15
 * @Description:
 */
public class OrderDaoImpl implements IOrderDao {
    private QueryRunner qr = new QueryRunner(jdbcUtils.getDataSource());

    @Override
    public void insertOrder(Order order) {

    }
}
