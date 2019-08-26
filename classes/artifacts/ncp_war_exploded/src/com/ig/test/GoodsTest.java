package com.ig.test;

import com.ig.dao.impl.GoodsDaoImpl;
import com.ig.entity.Goods;

public class GoodsTest {

	public static void main(String[] args) {
		GoodsDaoImpl goodsDaoImpl=new GoodsDaoImpl();
		Goods good = new Goods();
		//修改商品销量
//		good.setSalesNumber(20);
//		good.setGoodsId(2);
//		goodsDaoImpl.updateSalas(good);
		//添加
//		Goods goods=new Goods(5,"香蕉",6.8,"我就是苹果","",99,1,1);
//		goodsDaoImpl.add(goods);
		//修改
//		Goods goods=new Goods(2,"香蕉",5.8,"我就是苹果","","99",1,1);
//		goodsDaoImpl.modifyGoods(goods);
		//删除
		//goodsDaoImpl.delete(17);
		//根据id查询商品
//		good.setGoods_id(1);
//		Goods goods = goodsDaoImpl.getOne(good);
//		System.out.println(goods);	
		//根据商品名查询商品
//		good.setGoods_name("香蕉");
//		Goods goods = goodsDaoImpl.getOne(good);
//		System.out.println(goods);	
		//查询所有
//		List<Goods> listGoods = goodsDaoImpl.getAll();
//		for(Goods g:listGoods){
//			System.out.println(g);
//		}		
		//根据类别查询
//		good.setType_id(1);
//		List<Goods> listGoods = goodsDaoImpl.getAll(good);
//		for(Goods g:listGoods){
//			System.out.println(g);
//		}
		//根据商品名
//		good.setGoods_name("蕉");
//		List<Goods> listGoods = goodsDaoImpl.getAll(good);
//		for(Goods g:listGoods){
//			System.out.println(g);
//		}
		//查询热度前10
//		List<Goods> listGoods = goodsDaoImpl.getAll(good);
//		for(Goods g:listGoods){
//			System.out.println(g);
//		}

	}

}
