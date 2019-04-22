package org.lanqiao.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.lanqiao.dao.IUserDao;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.User;
import org.lanqiao.utils.jdbcUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 22:44
 * @Description:
 */
public class UserDaoImpl implements IUserDao {
    private QueryRunner qr = new QueryRunner(jdbcUtils.getDataSource());
    @Override
    public int insertManager(User user) {
        int result = -1;
        String sql = "INSERT INTO tb_user (username,password,role,ctime) VALUES (?,?,0,now())";
        try {
            result = qr.execute(sql,user.getUsername(),user.getPassword());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    @Override
    public int insertUser(User user) {
        int result = -1;
        String sql = "INSERT INTO tb_user (username,password,role,sex,collage,realname,telphone,email,address,ctime) VALUES (?,?,?,?,?,?,?,?,?,now())";
        try {
            result = qr.execute(sql,user.getUsername(),user.getPassword(),user.getRole(),user.getSex(),user.getCollage(),user.getRealname(),user.getTelphone(),user.getEmail(),user.getAddress());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public void updateUser(User user) {
        String sql = "UPDATE tb_user SET rtime = now(),realname = ?,email = ?,telphone = ?,address = ? WHERE id = ?";
        try {
            qr.execute(sql,user.getRealname(),user.getEmail(),user.getTelphone(),user.getAddress(),user.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User selectUserById(int userId) {
        User user = null;
        String sql = "SELECT * from tb_user where id = ?";
        try {
            user = qr.query(sql,new BeanHandler<>(User.class),userId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectUserList(Condition condition) {
        List<User> userList = null;
        StringBuffer sql = new StringBuffer("SELECT * from tb_user where role = 1 ");
        List<Object> search = new ArrayList<>();
        if(condition != null){
            if(condition.getName() != null && !"".equals(condition.getName())){
                sql.append(" and username like ? ");
                search.add("%" + condition.getName() + "%");
            }
            if(condition.getState() != null && !"-1".equals(condition.getState())){
                sql.append(" and state = ? ");
                search.add(condition.getState());
            }
            sql.append(" limit ?,?");
            search.add(condition.getCurrentPage());
            search.add(condition.getPageSize());
        }
        try {
            userList = qr.query(sql.toString(),new BeanListHandler<>(User.class),search.toArray());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public int selectUserCount(Condition condition) {
        StringBuffer sql = new StringBuffer("SELECT count(1) from tb_user where role = 1 ");
        List<Object> search = new ArrayList<>();
        if(condition.getName() != null && !"".equals(condition.getName())){
            sql.append(" and username like ? ");
            search.add("%" + condition.getName() + "%");
        }
        if(condition.getState() != null && !"-1".equals(condition.getState())){
            sql.append(" and state = ? ");
            search.add(condition.getState());
        }
        Long count = 0L;
        try {
            count = qr.query(sql.toString(),new ScalarHandler<>(1),search.toArray());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Integer.valueOf(count.toString());
    }

    @Override
    public User selectUserByUserNameAndPassword(String username, String password) {
        String sql = "SELECT * FROM tb_user WHERE username = ? AND password = ?";
        User user = null;
        try {
            user = qr.query(sql,new BeanHandler<>(User.class),username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    /*@Override
    public User selectManagerByUserNameAndPassword(String username, String password) {
        String sql = "SELECT * FROM tb_user WHERE role = 0 and username = ? AND password = ?";
        User user = null;
        try {
            user = qr.query(sql,new BeanHandler<>(User.class),username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }*/

    @Override
    public User selectUserByUserName(String username) {
        return null;
    }

    @Override
    public void deleteUserById(int id) {

    }

    @Override
    public void updateUserState(int userId, int state) {
        String sql = "UPDATE tb_user SET rtime = now(),state = ? WHERE id = ?";
        try {
            qr.execute(sql,state,userId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public int updateUserPassword(User user){
        String sql = "UPDATE tb_user SET password = ?,rtime = now() WHERE username = ?";
        int result = -1;
        try {
            result = qr.execute(sql,user.getPassword(),user.getUsername());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
