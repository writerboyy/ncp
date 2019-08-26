package com.ig.test;

import com.ig.entity.Cart;
import com.ig.service.impl.CartServiceImpl;

public class CartTest {
	public static void main(String[] args) {
		Cart cart = new Cart();
		cart.setUserId(2);
		CartServiceImpl cartService = new CartServiceImpl();
		System.out.println(cartService.listUserCart(2).size());
	}
}
