package com.ig.service;

import java.util.List;

import com.ig.entity.Type;

public interface TypeService {
	/** 查询所有类别 */
	List<Type> getAll();

	/** 通过 ID查询单个类别 */
	Type getOne(Type type);

	/** 根据属性查询所有相关类别 */
	List<Type> getAll(Type type);

	/** 增加类别 */
	int add(Type type);

	/** 通过id删除类别 */
	int delete(int type_id);

	/** 修改类别 */
	int update(Type type);

}
