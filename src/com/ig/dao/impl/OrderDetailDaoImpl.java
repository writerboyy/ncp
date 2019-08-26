package com.ig.dao.impl;

import com.ig.dao.BaseDao;
import com.ig.entity.OrderDetail;
import com.ig.util.DBUtil;

import javax.sql.rowset.CachedRowSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDaoImpl extends DBUtil implements BaseDao<OrderDetail> {

    @Override
    public OrderDetail getOne(OrderDetail orderDetail) {
        return null;
    }

    /**
     * 查询所有数据
     *
     * @return
     */
    @Override
    public List<OrderDetail> getAll() {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "select od.order_id,od.user_id,od.goods_id,od.order_number,od.price,g.goods_name,g.pic from t_order_detail od,t_goods g where od.goods_id=g.goods_id";
        CachedRowSet crs = this.execQuery(sql);
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
     * 查询一个用户或者一个订单的所有记录
     *
     * @param orderDetail
     * @return
     */
    @Override
    public List<OrderDetail> getAll(OrderDetail orderDetail) {
        List<OrderDetail> list = new ArrayList<>();
        CachedRowSet crs = null;
        if (orderDetail.getUserId() != 0) {
            String sql = "select od.order_id,od.user_id,od.goods_id,od.order_number,od.price,g.goods_name,g.pic from t_order_detail od,t_goods g where od.goods_id=g.goods_id and user_id=?  ";
            Object[] args = {orderDetail.getUserId()};
            crs = this.execQuery(sql, args);
        }
        if (orderDetail.getOrderId() != null) {
            String sql = "select od.order_id,od.user_id,od.goods_id,od.order_number,od.price,g.goods_name,g.pic from t_order_detail od,t_goods g where od.goods_id=g.goods_id and order_id=?";
            Object[] args = {orderDetail.getOrderId()};
            crs = this.execQuery(sql, args);
        }
        if (crs != null) {
            try {
                while (crs.next()) {
                    list.add(crsGet(crs));
                }
                crs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    /**
     * 添加订单明细记录
     */
    @Override
    public int add(OrderDetail orderDetail) {
        String sql = "insert into t_order_detail (order_id,user_id, goods_id,order_number,price) values (?,?,?,?,?)";
        Object[] args = {orderDetail.getOrderId(), orderDetail.getUserId(), orderDetail.getGoodsId(),
                orderDetail.getOrderNumber(), orderDetail.getPrice()};
        return this.execUpdate(sql, args);
    }

    /**
     * 删除订单明细记录
     *
     * @param orderId
     * @return
     */
    @Override
    public int delete(Object orderId) {
        String sql = "delete from t_order_detail where order_id=?";
        Object[] args = {orderId};
        return this.execUpdate(sql, args);
    }

    @Override
    public int update(OrderDetail orderDetail) {
        return 0;
    }

    @Override
    public OrderDetail crsGet(CachedRowSet crs) throws SQLException {
        OrderDetail od = new OrderDetail();
        od.setOrderId(crs.getString("order_id"));
        od.setUserId(crs.getInt("user_id"));
        od.setGoodsId(crs.getInt("goods_id"));
        od.setOrderNumber(crs.getInt("order_number"));
        od.setGoodsName(crs.getString("goods_name"));
        od.setPrice(crs.getDouble("price"));
        od.setPic(crs.getString("pic"));
        return od;
    }

}
