package com.ig.dao.impl;

import com.ig.dao.BaseDao;
import com.ig.entity.Cart;
import com.ig.util.DBUtil;

import javax.sql.rowset.CachedRowSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDaoImpl extends DBUtil implements BaseDao<Cart> {

    /**
     * 查询指定用户指定商品
     */
    @Override
    public Cart getOne(Cart cart) {
        Cart cart2 = null;
        String sql = "select * from t_cart where goods_id=? and user_id=?";
        Object[] args = {cart.getGoodsId(), cart.getUserId()};
        CachedRowSet crs = this.execQuery(sql, args);
        try {
            while (crs.next()) {
                cart2 = crsGet(crs);
            }
            crs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cart2;
    }

    /**
     * 往购物车添加商品
     */
    @Override
    public int add(Cart cart) {
        if (getOne(cart) != null) {// 有记录
            cart.setCartNumber(cart.getCartNumber() + getOne(cart).getCartNumber());
            return update(cart);
        } else {
            String sql = "insert into t_cart (user_id,goods_id,cart_number,price) values (?,?,?,?)";
            Object[] args2 = {cart.getUserId(), cart.getGoodsId(), cart.getCartNumber(), cart.getPrice()};
            return this.execUpdate(sql, args2);
        }
    }

    /**
     * 删除购物车中的商品
     */
    public int delete(int goodsId, int userId) {
        String sql = "delete from t_cart where goods_id=? and user_id=?";
        Object[] args = {goodsId, userId};
        return this.execUpdate(sql, args);
    }

    /**
     * 修改商品数量
     */
    @Override
    public int update(Cart cart) {
        String sql = "update t_cart set cart_number =? where goods_id=? and user_id=?";
        Object[] args = {cart.getCartNumber(), cart.getGoodsId(), cart.getUserId()};
        return this.execUpdate(sql, args);
    }

    /**
     * 查看购物车所有数据
     */
    @Override
    public List<Cart> getAll() {
        String sql = "select * from t_cart";
        CachedRowSet crs = this.execQuery(sql);
        List<Cart> list = new ArrayList<>();
        try {
            while (crs.next()) {
                list.add(crsGet(crs));
            }
            crs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 删除用户购物车
     */
    @Override
    public int delete(Object userid) {
        String sql = "delete from t_cart where user_id=?";
        Object[] args = {userid};
        return this.execUpdate(sql, args);
    }

    /**
     * 指定用户查看购物车
     */
    public List<Cart> listUserCart(int userId) {
        String sql = "select c.goods_id,g.goods_name,c.cart_number,c.price from t_cart c,t_user u,t_goods g where u.user_id=c.user_id and c.goods_id=g.goods_id and u.user_id=?";
        Object[] args = {userId};
        CachedRowSet crs = this.execQuery(sql, args);
        List<Cart> list = new ArrayList<>();
        try {
            while (crs.next()) {
                Cart cart = new Cart();
                cart.setGoodsId(crs.getInt("goods_id"));
                cart.setGoodsName(crs.getString("goods_name"));
                cart.setCartNumber(crs.getInt("cart_number"));
                cart.setPrice(crs.getDouble("price"));
                list.add(cart);
            }
            crs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 根据属性查询所有
     */
    @Override
    public List<Cart> getAll(Cart cart) {
        List<Cart> list = new ArrayList<>();
        String sql = "select * from t_cart where goods_id=?";
        Object[] args = {cart.getGoodsId()};
        CachedRowSet crs = this.execQuery(sql, args);
        try {
            while (crs.next()) {
                list.add(crsGet(crs));
            }
            crs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 查询返回对象
     */
    @Override
    public Cart crsGet(CachedRowSet crs) throws SQLException {
        Cart cart = new Cart();
        cart.setUserId(crs.getInt("user_id"));
        cart.setGoodsId(crs.getInt("goods_id"));
        cart.setCartNumber(crs.getInt("cart_number"));
        cart.setPrice(crs.getDouble("price"));
        return cart;
    }

}
