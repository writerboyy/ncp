package com.ig.test;

import com.ig.dao.BaseDao;
import com.ig.dao.impl.UserDaoImpl;
import com.ig.entity.User;

public class UserTest {

	public static void main(String[] args) {
		BaseDao<User> userDao = new UserDaoImpl();
		User user = new User(0, "wb", "wb", "18179038028", "湖北省", 1);
		userDao.add(user);
//		 User user = new User(2, "wb", "123", "18179038028", "湖北省", 1);
//		 userDao.update(user);
		userDao.delete(2);
		for (User u : userDao.getAll())
			System.out.println(u);
	}

}
