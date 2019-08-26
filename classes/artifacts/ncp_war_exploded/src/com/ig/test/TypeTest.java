package com.ig.test;

import com.ig.dao.BaseDao;
import com.ig.dao.impl.TypeDaoImpl;
import com.ig.entity.Type;

import java.util.List;

public class TypeTest {

	public static void main(String[] args) {
		TypeDaoImpl TDI = new TypeDaoImpl();
		//Type type = new Type(0, "大米");
		// TDI.add(type);
		// TDI.delete(22);
		// Type type2=new Type(3,"牛肉");
		// TDI.update(type2);
		Type type3 = new Type();
		//type3.setTypeId(4);
		type3.setTypeName("果");
		//BaseDao<Type> typeDao = new TypeDaoImpl();
		List<Type> list=TDI.getAll(type3);
		for (Type t : list)
			System.out.println(t);
	}

}
