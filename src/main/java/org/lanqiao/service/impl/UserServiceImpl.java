package org.lanqiao.service.impl;

import org.lanqiao.dao.IUserDao;
import org.lanqiao.dao.impl.UserDaoImpl;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.User;
import org.lanqiao.service.IUserService;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 23:06
 * @Description:用户管理
 */
public class UserServiceImpl implements IUserService {
    IUserDao userDao = new UserDaoImpl();
    @Override
    public int addUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    public int addManager(User user) {
        return userDao.insertManager(user);
    }

    @Override
    public void modifyUser(User user) {

    }

    @Override
    public User getUserById(int userId) {
        return null;
    }

    @Override
    public List<User> getUserList(Condition condition) {
        return null;
    }

    @Override
    public Long getUserCount(Condition condition) {
        return null;
    }

    @Override
    public User getUserByUserNameAndPassword(String username, String password) {
        return userDao.selectUserByUserNameAndPassword(username,password);
    }

    @Override
    public User selectUserByUserName(String username) {
        return null;
    }

    @Override
    public void deleteUserById(int id) {

    }

    @Override
    public int modifyUserPassword(User user) {
        return 0;
    }
}
