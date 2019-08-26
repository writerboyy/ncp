package com.ig.entity;

/**
 * 订单明细表实体
 *
 * @author W
 */
public class OrderDetail {
    private String orderId;// 订单编号
    private int userId;// 用户编号
    private int goodsId;// 商品编号
    private int orderNumber;// 商品数量
    private double price;// 商品单价
    private String goodsName;//商品名称
    private String pic;//商品图片

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getGoodsName() {
        return goodsName;
    }
    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
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

    public int getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(int orderNumber) {
        this.orderNumber = orderNumber;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public OrderDetail(String orderId, int userId, int goodsId, int orderNumber, double price) {
        super();
        this.orderId = orderId;
        this.userId = userId;
        this.goodsId = goodsId;
        this.orderNumber = orderNumber;
        this.price = price;
    }

    public OrderDetail() {
        super();
    }

    @Override
    public String toString() {
        return "OrderDetail [订单编号=" + orderId + ", 用户编号=" + userId + ", 商品编号=" + goodsId + ", 商品数量="
                + orderNumber + ", 商品单价=" + price + "]";
    }

}
