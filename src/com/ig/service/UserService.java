package com.ig.service;

import com.ig.entity.User;

import java.util.List;

/**
 * 用户业务逻辑接口
 *
 * @author W
 */
public interface UserService {
    /**
     * 登录
     */
    User login(User user);

    /**
     * 查询全部用户
     */
    List<User> listUser();

    /**
     * 分页查询用户
     */
    List<User> listUser(int pageNo, int pageSize);

    /**
     * 注册用户
     */
    int regUser(User user);

    /**
     * 删除用户
     */
    int deleteUser(int uid);

    /**
     * 修改用户信息
     */
    int modifyUser(User user);

    /**
     * 查询用户
     */
    User getUser(User user);

    /**
     * 根据属性查询
     */
    List<User> getUserAll(User user);

    /**
     * 根据属性查询分页
     */
    List<User> getUserAll(User user, int pageNo, int pageSize);
}
