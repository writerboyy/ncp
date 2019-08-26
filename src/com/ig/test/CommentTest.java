package com.ig.test;


import com.ig.dao.impl.CommentDaoImpl;
import com.ig.entity.Comment;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class CommentTest {

	public static void main(String[] args) {
		CommentDaoImpl commentDao=new CommentDaoImpl();
		Comment comment = new Comment();
		//添加
//		Comment comment=new Comment(0,1,1,"这是条评论",0);
//		commentDao.add(comment);
		//修改
//		Comment comment=new Comment(1,1,1,"这是条评论",2);
//		commentDao.update(comment);
		//删除
		//commentDao.delete(1);
		//根据id查询评论
//		comment.setComId(2);
//		Comment c = commentDao.getOne(comment);
//		System.out.println(c);
//		System.out.println(goods);	
		//根据用户id查询评论
//		comment.setUserId(2);
//		List<Comment> c = commentDao.getAll(comment);
//		System.out.println(c);
		//查询所有
//		List<Comment> c = commentDao.getAll();
//		for(Comment g:c){
//			System.out.println(g);
//		}
		//根据商品id查询评论
//		comment.setGoodsId(2);
//		List<Comment> c = commentDao.getAll(comment);
//		System.out.println(c);
//		}
		//根据用户id查询商品评论
//		comment.setUserId(2);
//		comment.setGoodsId(2);
//		List<Comment> c = commentDao.getAll(comment);
//		System.out.println(c);

	}

}
