package com.ig.service.impl;

import com.ig.dao.impl.CartDaoImpl;
import com.ig.entity.Cart;
import com.ig.service.CartService;

import java.util.List;

public class CartServiceImpl implements CartService {

	CartDaoImpl dao = new CartDaoImpl();
	/** 查询指定用户指定商品 */
	@Override
	public Cart getCartOne(Cart cart) {
		return null;
	}

	/** 往购物车添加商品已存在返回update修改商品数量，没有返回add增加商品 */
	@Override
	public int addCart(Cart cart) {
		return dao.add(cart);
	}
	/** 删除购物车中的商品 */
	@Override
	public int deleteCart(int goodsId, int userId) {
		return dao.delete(goodsId,userId);
	}
	/** 修改商品数量 */
	@Override
	public int updateCart(Cart cart) {
		return dao.update(cart);
	}
	/** 查看购物车所有数据 */
	@Override
	public List<Cart> getCartAll() {
		return dao.getAll();
	}
	/** 删除用户购物车 */
	@Override
	public int deleteCart(int userId) {
		return dao.delete(userId);
	}
	/** 指定用户查看购物车 */
	@Override
	public List<Cart> listUserCart(int userId) {
		return dao.listUserCart(userId);
	}
	/** 根据属性查询所有 */
	@Override
	public List<Cart> getCartAll(Cart cart) {
		return dao.getAll(cart);
	}


}
