package org.lanqiao.dao;

import org.lanqiao.domain.Condition;
import org.lanqiao.domain.User;

import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 22:44
 * @Description:
 */
public interface IUserDao {
    //注册用户
    public int insertUser(User user);
    //注册管理员
    public int insertManager(User user);
    //修改用户
    public void updateUser(User user);
    //通过id查询用户信息
    public User selectUserById(int userId);
    //获取用户列表
    public List<User> selectUserList(Condition condition);
    //获取用户列表数量
    public int selectUserCount(Condition condition);
    //通过用户名密码查询普通用户
    public User selectUserByUserNameAndPassword(String username,String password);
    //修改用户状态
    public void updateUserState(int userId,int state);

    public int updateUserPassword(User user);
}
