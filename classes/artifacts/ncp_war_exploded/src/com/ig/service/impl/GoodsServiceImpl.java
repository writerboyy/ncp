package com.ig.service.impl;

import com.ig.dao.impl.GoodsDaoImpl;
import com.ig.entity.Goods;
import com.ig.service.GoodsService;

import java.util.List;

public class GoodsServiceImpl implements GoodsService {

    GoodsDaoImpl dao = new GoodsDaoImpl();

	/** 根据Id查询单个商品 */
	@Override
	public Goods getOne(Goods goods) {
		return dao.getOne(goods);
	}

	/** 查询所有商品 */
	@Override
	public List<Goods> getAll() {
		return dao.getAll();
	}

	@Override
	public List<Goods> getAll(Goods goods) {
		return dao.getAll(goods);
	}

	/** 增加商品 */
	@Override
	public int add(Goods goods) {
		return dao.add(goods);
	}

	/** 通过商品id删除商品 */
	@Override
	public int delete(int goods_id) {
		return dao.delete(goods_id);
	}

	/** 通过一个新的商品，利用原先的id，替换原先的商品 更新商品 */
	@Override
	public int update(Goods goods) {
		return dao.update(goods);
	}

	/**修改商品销量*/
	@Override
	public int updateSalas(Goods goods) {
		return dao.updateSalas(goods);
	}
}
