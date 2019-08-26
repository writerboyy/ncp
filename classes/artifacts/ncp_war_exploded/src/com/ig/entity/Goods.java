package com.ig.entity;

public class Goods {

	private int goodsId;// 商品编号
	private String goodsName;//商品名称
	private Double price;//价格
	private String text;//介绍
	private String pic;//图片
	private int salesNumber;//销量
	private int stock;//库存
	private int typeId;//类型名
	
	public Goods() {
		super();
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public int getSalesNumber() {
		return salesNumber;
	}
	public void setSalesNumber(int salesNumber) {
		this.salesNumber = salesNumber;
	}
	@Override
	public String toString() {
		return "Goods [goods_id=" + goodsId + ", goods_name=" + goodsName + ", price=" + price + ", text=" + text
				+ ", pic=" + pic + ", stock=" + stock + ", sales_number=" + salesNumber + ", type_id=" + typeId + "]";
	}
	public Goods(int goodsId, String goodsName, Double price, String text, String pic, int salesNumber, int stock,
			int typeId) {
		super();
		this.goodsId = goodsId;
		this.goodsName = goodsName;
		this.price = price;
		this.text = text;
		this.pic = pic;
		this.salesNumber = salesNumber;
		this.stock = stock;
		this.typeId = typeId;
	}
	
	
}
