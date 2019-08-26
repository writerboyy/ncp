package com.ig.dao.impl;

import com.ig.dao.BaseDao;
import com.ig.entity.Comment;
import com.ig.util.DBUtil;

import javax.sql.rowset.CachedRowSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDaoImpl extends DBUtil implements BaseDao<Comment> {
    @Override
    public Comment getOne(Comment comment) {
        Comment com = new Comment();
        /**
         * 根据评论Id查询评论
         */
        if (comment.getComId() != 0) {
            CachedRowSet crs = this.execQuery(
                    "select c.com_id,c.goods_id,u.user_id,u.user_name,c.com_text,c.date,c.praise from t_comment c , t_user u where u.user_id=c.user_id and c.com_id=?",
                    comment.getComId());
            if (crs.size() != 0) {
                try {
                    while (crs.next()) {
                        com = crsGet(crs);
                    }
                    crs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return com;
            }
        }
        return null;
    }

    /**
     * 查询所有评论
     */
    @Override
    public List<Comment> getAll() {
        List<Comment> commList = new ArrayList<>();
        CachedRowSet crs = this.execQuery(
                "select c.com_id,c.goods_id,u.user_id,u.user_name,c.com_text,c.date,c.praise,g.goods_name,g.pic from t_comment c , t_user u,t_goods g where u.user_id=c.user_id and c.goods_id=g.goods_id ");
        if (crs.size() != 0) {
            try {
                while (crs.next()) {
                    commList.add(crsGet2(crs));
                }
                crs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return commList;
    }


    @Override
    public List<Comment> getAll(Comment comment) {
        List<Comment> commList = new ArrayList<>();
        /**
         * 根据商品Id查询评论
         */
        if (comment.getGoodsId() != 0) {
            CachedRowSet crs = this.execQuery(
                    "select c.com_id,c.goods_id,u.user_id,u.user_name,c.com_text,c.date,c.praise from t_comment c , t_user u where u.user_id=c.user_id and c.goods_id =?",
                    comment.getGoodsId());
            if (crs.size() != 0) {
                try {
                    while (crs.next()) {
                        commList.add(crsGet(crs));
                    }
                    crs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return commList;
            }
        }
        /**
         * 根据用户Id查询当前用户所有评论
         */
        if (comment.getUserId() != 0) {
            CachedRowSet crs = this.execQuery(
                    "select c.com_id,c.goods_id,u.user_id,u.user_name,c.com_text,c.date,c.praise,g.goods_name,g.pic from t_comment c , t_user u,t_goods g where u.user_id=c.user_id and c.goods_id=g.goods_id and c.user_id =?",
                    comment.getUserId());
            if (crs.size() != 0) {
                try {
                    while (crs.next()) {
                        commList.add(crsGet2(crs));
                    }
                    crs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return commList;
            }
        }
        /**
         * 根据用户Id和商品Id查询当前用户对此商品的所有评论
         */
        if (comment.getUserId() != 0 && comment.getGoodsId() != 0) {
            CachedRowSet crs = this.execQuery(
                    "select c.com_id,c.goods_id,u.user_id,u.user_name,c.com_text,c.date,c.praise from t_comment c , t_user u where u.user_id=c.user_id and c.user_id =? and c.goods_id =? ",
                    comment.getUserId(), comment.getGoodsId());
            if (crs.size() != 0) {
                try {
                    while (crs.next()) {
                        commList.add(crsGet(crs));
                    }
                    crs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return commList;
            }
        }
        return null;
    }

    /**
     * 增加商品
     */
    @Override
    public int add(Comment comment) {
        System.out.println(comment);
        String sql = "insert into t_comment (goods_id,user_id,com_text,date,praise) values (?,?,?,now(),?)";
        Object[] args = {comment.getGoodsId(), comment.getUserId(), comment.getComment(), comment.getPraise()};
        return this.execUpdate(sql, args);
    }

    /**
     * 通过商品id删除商品
     */
    @Override
    public int delete(Object comId) {
        String sql = "delete from t_comment where com_id=?";
        Object[] args = {comId};
        return this.execUpdate(sql, args);
    }

    /**
     * 通过一个新的商品，利用原先的id，替换原先的商品 更新商品
     */
    @Override
    public int update(Comment comment) {
        String sql = "update t_comment set goods_id=?,user_id=?,com_text=?,praise=? where com_id=?";
        Object[] args = {comment.getGoodsId(), comment.getUserId(), comment.getComment(), comment.getPraise(), comment.getComId()};
        return this.execUpdate(sql, args);
    }

    @Override
    public Comment crsGet(CachedRowSet crs) throws SQLException {
        Comment comment = new Comment();
        comment.setComId(crs.getInt("com_id"));
        comment.setGoodsId(crs.getInt("goods_id"));
        comment.setUserName(crs.getString("user_name"));
        comment.setUserId(crs.getInt("user_id"));
        comment.setComment(crs.getString("com_text"));
        comment.setDate(crs.getDate("date"));
        comment.setPraise(crs.getInt("praise"));
        return comment;
    }

    public Comment crsGet2(CachedRowSet crs) throws SQLException {
        Comment comment = new Comment();
        comment.setComId(crs.getInt("com_id"));
        comment.setGoodsId(crs.getInt("goods_id"));
        comment.setUserId(crs.getInt("user_id"));
        comment.setUserName(crs.getString("user_name"));
        comment.setComment(crs.getString("com_text"));
        comment.setDate(crs.getDate("date"));
        comment.setPraise(crs.getInt("praise"));
        comment.setGoodsName(crs.getString("goods_name"));
        comment.setPic(crs.getString("pic"));
        return comment;
    }
}
