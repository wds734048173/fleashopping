package org.lanqiao.service.impl;

import org.lanqiao.dao.ICollectionDao;
import org.lanqiao.dao.impl.CollectionDaoImpl;
import org.lanqiao.domain.Collection;
import org.lanqiao.service.ICollectionService;

import java.util.List;

public class CollectionServiceImpl implements ICollectionService {

    ICollectionDao collectionDao = new CollectionDaoImpl();
    @Override
    public void addCollection(Collection collection) {
        collectionDao.insertCollection(collection);
    }

    @Override
    public void modifyCollection(Collection collection) {
        collectionDao.updateCollection(collection);
    }

    @Override
    public Collection getCollection(Collection collection) {
        return collectionDao.selectCollection(collection);
    }

    @Override
    public void removeCollection(int id) {
        collectionDao.deleteCollection(id);
    }

    @Override
    public List<Collection> getCollectionList(int uId) {
        return collectionDao.selectCollectionList(uId);
    }
}
