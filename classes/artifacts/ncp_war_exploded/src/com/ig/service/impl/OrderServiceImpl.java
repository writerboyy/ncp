package com.ig.service.impl;

import com.ig.dao.impl.OrderDaolmpl;
import com.ig.entity.Order;
import com.ig.entity.User;
import com.ig.service.OrderService;

import java.util.List;

public class OrderServiceImpl implements OrderService {

	@Override
	public List<Order> getAll(Order order) {
		return new OrderDaolmpl().getAll(order);
	}

	@Override
	public List<Order> getAll() {
		return new OrderDaolmpl().getAll();
	}

	@Override
	public List<Order> getAll(User user) {
		return new OrderDaolmpl().getAll(user);
	}

	@Override
	public int add(Order order) {
		return new OrderDaolmpl().add(order);
	}

	@Override
	public int delete(Object orderid) {
		return new OrderDaolmpl().delete(orderid);
	}

	@Override
	public Order getOne(Order order) {
		return new OrderDaolmpl().getOne(order);
	}

	@Override
	public List<Order> getAllUsername(Order order) {
		return new OrderDaolmpl().getAllUsername(order);
	}

	@Override
	public List<Order> getAllUsernameAndStatus(Order order) {
		return new OrderDaolmpl().getAllUsernameAndStatus(order);
	}

	@Override
	public int update(Order order) {
		return new OrderDaolmpl().update(order);
	}

	@Override
	public int assess(Order order) {
		return new OrderDaolmpl().assess(order);
	}

}
