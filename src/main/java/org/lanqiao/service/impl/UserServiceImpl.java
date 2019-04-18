package org.lanqiao.service.impl;

import org.lanqiao.dao.IUserDao;
import org.lanqiao.dao.impl.UserDaoImpl;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.User;
import org.lanqiao.service.IUserService;
import org.lanqiao.utils.DataMap;

import java.util.List;
import java.util.Map;

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
        List<User> userList = userDao.selectUserList(condition);
        Map<Integer,String> sexIdNameMap = DataMap.getSexIdNameMap();
        Map<Integer,String> userStateIdNameMap = DataMap.getUserStateIdNameMap();
        for(User user : userList){
            //对性别进行处理
            int sex = user.getSex();
            if(sexIdNameMap.containsKey(sex)){
                user.setSexStr(sexIdNameMap.get(sex));
            }
            //对状态进行处理
            int state = user.getState();
            if(userStateIdNameMap.containsKey(state)){
                user.setStateStr(userStateIdNameMap.get(state));
            }
        }
        return userList;
    }

    @Override
    public int getUserCount(Condition condition) {
        return userDao.selectUserCount(condition);
    }

    @Override
    public User getUserByUserNameAndPassword(String username, String password) {
        return userDao.selectUserByUserNameAndPassword(username,password);
    }

    /*@Override
    public User getManagerByUserNameAndPassword(String username, String password) {
        return userDao.selectManagerByUserNameAndPassword(username,password);
    }*/

    @Override
    public User selectUserByUserName(String username) {
        return null;
    }

    @Override
    public void deleteUserById(int id) {

    }

    @Override
    public int modifyUserPassword(User user) {
        return userDao.updateUserPassword(user);
    }

    @Override
    public void modifyUserState(int userId, int state) {
        userDao.updateUserState(userId,state);
    }
}
