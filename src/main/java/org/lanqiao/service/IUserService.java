package org.lanqiao.service;

import org.lanqiao.domain.Condition;
import org.lanqiao.domain.User;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 23:05
 * @Description:
 */
public interface IUserService {
    //注册用户
    public int addUser(User user);
    //注册管理员
    public int addManager(User user);
    //修改用户
    public void modifyUser(User user);
    //通过id查询用户信息
    public User getUserById(int userId);
    //获取用户列表
    public List<User> getUserList(Condition condition);
    //获取用户列表数量
    public int getUserCount(Condition condition);
    //通过用户名密码查询普通用户
    public User getUserByUserNameAndPassword(String username,String password);
    //通过用户名密码查询管理员用户
//    public User getManagerByUserNameAndPassword(String username,String password);
    //通过用户名查询用户信息
    public User selectUserByUserName(String username);
    //删除用户
    public void deleteUserById(int id);
    //修改密码
    public int modifyUserPassword(User user);
    //修改用户状态
    public void modifyUserState(int userId,int state);
}
