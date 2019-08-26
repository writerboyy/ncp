package com.ig.dao;

import javax.sql.rowset.CachedRowSet;
import java.sql.SQLException;
import java.util.List;

/**
 * 数据库操作接口
 * 
 * @author wb
 *
 */
public interface BaseDao<T> {
	/** 查询一个 */
	T getOne(T t);

	/** 查询所有 */
	List<T> getAll();

	/** 根据属性查询 */
	List<T> getAll(T t);
	
	/** 增加 */
	int add(T t);

	/** 删除 */
	int delete(Object id);

	/** 修改 */
	int update(T t);

	/**处理查询结果*/
	T crsGet(CachedRowSet crs) throws SQLException;
}
