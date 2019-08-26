package com.ig.service;

import com.ig.entity.Order;
import com.ig.entity.User;

import java.util.List;

/**
 * 订单业务逻辑接口
 * 
 * @author jiangxiaoyao
 */
public interface OrderService {
	/** 用户查询自身订单*/
	List<Order> getAll(Order order);
	
	/** 查询所有订单*/
	List<Order> getAll();

	/** 根据用户id查询所有订单*/
	List<Order> getAll(User user);

	/** 添加订单*/
	int add(Order order);
	
	/** 删除订单*/
	int delete(Object orderId);
	
	/** 根据订单号查询*/
	Order getOne(Order order);

	/** 根据用户名模糊查询*/
	List<Order> getAllUsername(Order order);

	/** 根据用户名模糊查询*/
	List<Order> getAllUsernameAndStatus(Order order);

	/** 支付*/
	 int update(Order order);

	/** 修改状态（到以评价）*/
	int assess(Order order);
}
