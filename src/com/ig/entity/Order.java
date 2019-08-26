package com.ig.entity;
/**
 * 订单实体类
 * @author jiangxiaoyao
 *
 */

import java.util.Date;

public class Order {
	private String orderId;//订单表编号
	private int userId;//用户编号
	private Double orderTotal;//商品总价
	private Date orderDate;//创建时间
	private int status;//订单状态
	private Date payDate;//支付时间

	private String userName;//用户名
	private String tell;// 电话
	private String address;// 地址

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Double getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(Double orderTotal) {
		this.orderTotal = orderTotal;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Order(String orderId, int userId, Double orderTotal, Date orderDate, int status) {
		this.orderId = orderId;
		this.userId = userId;
		this.orderTotal = orderTotal;
		this.orderDate = orderDate;
		this.status = status;
	}

	public Order(String orderId, int userId, Double orderTotal, Date orderDate, int status, Date payDate) {
		this.orderId = orderId;
		this.userId = userId;
		this.orderTotal = orderTotal;
		this.orderDate = orderDate;
		this.status = status;
		this.payDate = payDate;
	}

	public Order() {
	}

	@Override
	public String toString() {
		return "Order{" +
				"orderId='" + orderId + '\'' +
				", userId=" + userId +
				", orderTotal=" + orderTotal +
				", orderDate=" + orderDate +
				", status=" + status +
				", payDate=" + payDate +
				'}';
	}
}
