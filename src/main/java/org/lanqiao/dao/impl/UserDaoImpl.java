package org.lanqiao.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.lanqiao.dao.IUserDao;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.User;
import org.lanqiao.utils.jdbcUtils;

import java.sql.SQLException;
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
        String sql = "INSERT INTO tb_user (username,password,role,ctime) VALUES (?,?,1,now())";
        try {
            result = qr.execute(sql,user.getUsername(),user.getPassword());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public void updateUser(User user) {

    }

    @Override
    public User selectUserById(int userId) {
        return null;
    }

    @Override
    public List<User> selectUserList(Condition condition) {
        return null;
    }

    @Override
    public Long selectUserCount(Condition condition) {
        return null;
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

    @Override
    public User selectUserByUserName(String username) {
        return null;
    }

    @Override
    public void deleteUserById(int id) {

    }
}
