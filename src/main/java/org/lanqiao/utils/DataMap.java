package org.lanqiao.utils;

import org.lanqiao.dao.IGoodsClassDao;
import org.lanqiao.dao.impl.GoodsClassDaoImpl;
import org.lanqiao.domain.GoodsClass;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: WDS
 * @Date: 2018/12/9 15:01
 * @Description:
 */
public class DataMap {
    //把图书分类id和图书分类名称制作为键值对
    /*public static Map<Integer,String> getBookTypeIdNameMap(){
        IBookTypeDao bookTypeDao = new BookTypeDaoImpl();
        List<BookType> bookTypeList = bookTypeDao.getBookTypeList(null);
        Map<Integer,String> map = new HashMap<>();
        for (int i = 0; i < bookTypeList.size(); i++) {
            map.put(bookTypeList.get(i).getBookTypeId(),bookTypeList.get(i).getBookTypeName());
        }
        return map;
    }
    //通过客户id查询客户名
    public static Map<Integer,String> getCustomerIdNameMap(){
        ICustomerDao customerDao = new CustomerDaoImpl();
        List<Customer> customerList = customerDao.getCustomerList(null);
        Map<Integer,String> map = new HashMap<>();
        for (int i = 0; i < customerList.size(); i++) {
            map.put(customerList.get(i).getCustomerId(),customerList.get(i).getCustomerName());
        }
        return map;
    }*/

    //订单状态
    public static Map<Integer,String> getOrderStateIdNameMap(){
        Map<Integer,String> map = new HashMap<>();
        map.put(1,"未付款");
        map.put(2,"已付款");
        map.put(3,"已发货");
        map.put(4,"已收货");
        map.put(5,"已评价");
        map.put(6,"已作废");
        return map;
    }

    //商品状态
    public static Map<Integer,String> getGoodsStateIdNameMap(){
        Map<Integer,String> map = new HashMap<>();
        map.put(0,"上架");
        map.put(1,"下架");
        map.put(2,"卖出");
        map.put(3,"删除");
        return map;
    }

    //把商品分类id和商品分类名称制作为键值对
    public static Map<Integer,String> getGoodsClassIdNameMap(){
        IGoodsClassDao goodsClassDao = new GoodsClassDaoImpl();
        List<GoodsClass> goodsClassList = goodsClassDao.selectGoodsClassList();
        Map<Integer,String> map = new HashMap<>();
        for (int i = 0; i < goodsClassList.size(); i++) {
            map.put(goodsClassList.get(i).getId(),goodsClassList.get(i).getName());
        }
        return map;
    }
}
