package org.lanqiao.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.lanqiao.dao.ICollectionDao;
import org.lanqiao.domain.Collection;
import org.lanqiao.utils.jdbcUtils;

import java.sql.SQLException;
import java.util.List;

public class CollectionDaoImpl implements ICollectionDao {
    private QueryRunner qr = new QueryRunner(jdbcUtils.getDataSource());
    @Override
    public void insertCollection(Collection collection) {
        String sql = "INSERT INTO tb_collection (uid,gid,ctime) VALUES (?,?,now())";
        try {
            qr.execute(sql,collection.getUId(),collection.getGId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateCollection(Collection collection) {
        String sql = "UPDATE tb_collection SET ctime = now() WHERE uid = ? and gid = ?";
        try {
            qr.execute(sql,collection.getUId(),collection.getGId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Collection selectCollection(Collection collection) {
        Collection collection1 = null;
        String sql = "SELECT * from tb_collection where uid = ? and gid = ?";
        try {
            collection1 = qr.query(sql,new BeanHandler<>(Collection.class),collection.getUId(),collection.getGId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return collection1;
    }

    @Override
    public void deleteCollection(int id) {
        String sql = "DELETE FROM tb_collection WHERE id = ?";
        try {
            qr.execute(sql,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Collection> selectCollectionList(int uId) {
        List<Collection> collectionList = null;
        String sql = "SELECT * from tb_collection where uid = ? ";
        try {
            collectionList = qr.query(sql,new BeanListHandler<>(Collection.class),uId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return collectionList;
    }
}
