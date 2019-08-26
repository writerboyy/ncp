package com.ig.test;

import java.io.File;

public class OrderDetailTest {

	public static void main(String[] args) {
//		BaseDao<OrderDetail> odDaoImpl = new OrderDetailDaoImpl();
////		OrderDetail od = new OrderDetail(1,1,1,50,5.3);
////		odDaoImpl.add(od);
//		//odDaoImpl.delete(1);
//		for(OrderDetail o :odDaoImpl.getAll())
//			System.out.println(o);
		File file = new File("config");
		for (File f:file.listFiles()){
			System.out.println(f.getName());
		}
	}

}
