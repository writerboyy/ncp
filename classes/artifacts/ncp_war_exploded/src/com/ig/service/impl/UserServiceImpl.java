package com.ig.service.impl;

import com.ig.dao.impl.UserDaoImpl;
import com.ig.entity.User;
import com.ig.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {

    UserDaoImpl dao = new UserDaoImpl();

    /**
     * 登录
     */
    @Override
    public User login(User user) {
        return dao.getOne(user);
    }

    /**
     * 查询全部用户
     */
    @Override
    public List<User> listUser() {
        return dao.getAll();
    }

    /**
     * 分页查询用户
     */
    @Override
    public List<User> listUser(int pageNo, int pageSize) {
        return dao.getAll(pageNo, pageSize);
    }

    /**
     * 注册用户
     */
    @Override
    public int regUser(User user) {
        return dao.add(user);
    }

    /**
     * 删除用户
     */
    @Override
    public int deleteUser(int uid) {
        return dao.delete(uid);
    }

    /**
     * 修改用户信息
     */
    @Override
    public int modifyUser(User user) {
        return dao.update(user);
    }

    /**
     * 查询用户
     */
    @Override
    public User getUser(User user) {
        return dao.getOne(user);
    }

    /**
     * 根据属性查询
     */
    @Override
    public List<User> getUserAll(User user) {
        return dao.getAll(user);
    }

    @Override
    public List<User> getUserAll(User user, int pageNo, int pageSize) {
        return dao.getAll(user,pageNo,pageSize);
    }

}
