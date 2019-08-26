package com.ig.entity;

/**
 * 用户实体类
 *
 * @author Q
 */
public class Cart {
    private int userId;// 用户编号
    private int goodsId;// 商品编号
    private int cartNumber;// 数量
    private double price;// 价格(单价)
    private String goodsName;//商品名称

    public Cart(int userId, int goodsId, int cartNumber, double price) {
        this.userId = userId;
        this.goodsId = goodsId;
        this.cartNumber = cartNumber;
        this.price = price;
    }

    public Cart() {
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public int getCartNumber() {
        return cartNumber;
    }

    public void setCartNumber(int cartNumber) {
        this.cartNumber = cartNumber;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Cart [用户名=" + userId + ", 商品编号=" + goodsId + ", 商品数量=" + cartNumber + ", 单价=" + price
                + "]";
    }

}
