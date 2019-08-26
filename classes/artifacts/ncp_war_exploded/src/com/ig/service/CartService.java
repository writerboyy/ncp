package com.ig.service;

import com.ig.entity.Cart;

import java.util.List;

/**
 * 购物车业务逻辑接口
 * 
 * @author Q
 *
 */
public interface CartService {

	/** 查询指定用户指定商品 */
	public Cart getCartOne(Cart cart);

	/** 往购物车添加商品 */
	public int addCart(Cart cart);

	/** 删除购物车中的商品 */
	public int deleteCart(int goodsid, int userid);

	/** 修改商品数量 */
	public int updateCart(Cart cart);

	/** 查看购物车所有数据 */
	public List<Cart> getCartAll();

	/** 删除用户购物车 */
	public int deleteCart(int userid);

	/** 指定用户查看购物车 */
	List<Cart> listUserCart(int userid);

	/** 根据属性查询所有 */
	List<Cart> getCartAll(Cart cart);
}
