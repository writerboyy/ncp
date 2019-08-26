package com.ig.service;

import com.ig.entity.Goods;

import java.util.List;

public interface GoodsService {

	/** 根据Id查询单个商品 */
	Goods getOne(Goods goods);
	
	/** 查询所有商品 */
	List<Goods> getAll();

	/** 根据属性查询所有相关商品 */
	List<Goods> getAll(Goods goods);
	
	/** 增加商品 */
	int add(Goods goods);
	
	/** 通过商品id删除商品 */
	int delete(int goods_id);
	
	/** 通过一个新的商品，利用原先的id，替换原先的商品 更新商品 */
	int update(Goods goods);

	/**修改商品销量*/
	int updateSalas(Goods goods);
}
