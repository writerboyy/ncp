package com.ig.entity;

import java.util.Date;

public class Comment {
    private int comId;//表id
    private int goodsId;// 商品编号
    private String userName;//评论
    private int userId;//用户编号
    private String comment;//评论
    private Date date;//评论时间
    private int praise;//好评
    private String pic;//商品图片
    private String goodsName;//商品名

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

    public int getComId() {
        return comId;
    }

    public void setComId(int comId) {
        this.comId = comId;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getPraise() {
        return praise;
    }

    public void setPraise(int praise) {
        this.praise = praise;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "comId=" + comId +
                ", goodsId=" + goodsId +
                ", userName='" + userName + '\'' +
                ", userId=" + userId +
                ", comment='" + comment + '\'' +
                ", date=" + date +
                ", praise=" + praise +
                ", pic='" + pic + '\'' +
                ", goodsName='" + goodsName + '\'' +
                '}';
    }

    public Comment(int goodsId, String userName, int userId, String comment, Date date, int praise) {
        this.goodsId = goodsId;
        this.userName = userName;
        this.userId = userId;
        this.comment = comment;
        this.date = date;
        this.praise = praise;
    }

    public Comment() {
    }


}
