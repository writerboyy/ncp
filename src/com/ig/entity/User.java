package com.ig.entity;

/**
 * 用户实体类
 * 
 * @author W
 *
 */
public class User {
	private int userId;// 用户编号
	private String userName;// 用户名
	private String password;// 密码
	private String tell;// 电话
	private String address;// 地址
	private int grade;// 等级权限

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public User(int userId, String userName, String password, String tell, String address, int grade) {
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.tell = tell;
		this.address = address;
		this.grade = grade;
	}

	public User() {
	}

	@Override
	public String toString() {
		return "User [用户编号=" + userId + ", 用户名=" + userName + ", 密码=" + password + ", 电话=" + tell
				+ ", 地址=" + address + ", 权限=" + grade + "]";
	}
}
