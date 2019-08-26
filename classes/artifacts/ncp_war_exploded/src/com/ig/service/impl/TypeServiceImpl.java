package com.ig.service.impl;

import java.util.List;

import com.ig.dao.BaseDao;
import com.ig.dao.impl.TypeDaoImpl;
import com.ig.entity.Type;
import com.ig.service.TypeService;

public class TypeServiceImpl implements TypeService {
	BaseDao<Type> dao = new TypeDaoImpl();

	/** 查询所有 类别 */
	@Override
	public List<Type> getAll() {
		return dao.getAll();
	}

	/** 通过 ID查询单个类别 */
	@Override
	public Type getOne(Type type) {
		return dao.getOne(type);
	}

	@Override
	public List<Type> getAll(Type type) {
		List<Type> list =dao.getAll(type);
		return  list;
	}

	/** 增加类别 */
	@Override
	public int add(Type type) {
		return dao.add(type);
	}

	/** 通过id删除类别 */
	@Override
	public int delete(int type_id) {
		return dao.delete(type_id);
	}

	/** 修改类别 */
	@Override
	public int update(Type type) {
		return dao.update(type);
	}

}
