package com.ig.dao.impl;

import com.ig.dao.BaseDao;
import com.ig.entity.Order;
import com.ig.entity.User;
import com.ig.util.DBUtil;

import javax.sql.rowset.CachedRowSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDaolmpl extends DBUtil implements BaseDao<Order> {
    /**
     * 添加订单记录
     */
    @Override
    public int add(Order order) {
        String sql = "insert into t_order (order_id,user_id,order_total,order_date,status) values (?,?,?,now(),?)";
        Object[] args = {order.getOrderId(), order.getUserId(), order.getOrderTotal(), order.getStatus()};
        return this.execUpdate(sql, args);
    }

    /**
     * 全部查询
     *
     * @return List<Order>
     */
    @Override
    public List<Order> getAll() {
        String sql = "select o.order_id,o.order_date,o.pay_date,u.user_id,u.user_name,u.tell,u.address,o.order_total,o.status\n" +
                "from t_user u,t_order o,t_order_detail od\n" +
                "where u.user_id=o.user_id and o.order_id=od.order_id group by o.order_id";
        CachedRowSet crs = this.execQuery(sql);
        List<Order> list = new ArrayList<Order>();
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
     * 根据用户id查询
     *
     * @return List<Order>
     */
    public List<Order> getAll(Order order) {
        String sql = "select* from t_order where user_id = ?";
        Object[] args = {order.getUserId()};
        CachedRowSet crs = this.execQuery(sql, args);
        List<Order> list = new ArrayList<Order>();
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
     * 根据用户id查询订单集合
     *
     * @return List<Order>
     */
    public List<Order> getAll(User user) {
        String sql = "select* from t_order where user_id = ?";
        Object[] args = {user.getUserId()};
        CachedRowSet crs = this.execQuery(sql, args);
        List<Order> list = new ArrayList<Order>();
        try {
            while (crs.next()) {
                Order order = new Order();
                order.setOrderDate(crs.getDate("order_date"));
                order.setOrderId(crs.getString("order_id"));
                order.setOrderTotal(crs.getDouble("order_total"));
                order.setStatus(crs.getInt("status"));
                order.setUserId(crs.getInt("user_id"));
                list.add(order);
            }
            crs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 根据用户名模糊查询
     *
     * @return List<Order>
     */
    public List<Order> getAllUsername(Order order) {
        String sql = "select o.order_id,o.order_date,u.user_id,u.user_name,u.tell,u.address,o.order_total,o.status,o.pay_date " +
                "from t_user u,t_order o,t_order_detail od " +
                "where u.user_id=o.user_id and o.order_id=od.order_id and u.user_name like \"%\"?\"%\" group by o.order_id";
        Object[] args = {order.getUserName()};
        CachedRowSet crs = this.execQuery(sql, args);
        List<Order> list = new ArrayList<Order>();
        try {
            while (crs.next()) {
                list.add(crsGet(crs));
            }
            crs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //System.out.println(list.toString());
        return list;
    }

    /**
     * 根据状态和用户名模糊查询
     *
     * @return List<Order>
     */
    public List<Order> getAllUsernameAndStatus(Order order) {
        String sql = "select o.order_id,o.order_date,u.user_id,u.user_name,u.tell,u.address,o.order_total,o.status,o.pay_date " +
                "from t_user u,t_order o,t_order_detail od " +
                "where u.user_id=o.user_id and o.order_id=od.order_id and o.status=? and u.user_name like \"%\"?\"%\" group by o.order_id";
        Object[] args = {order.getStatus(), order.getUserName()};
        CachedRowSet crs = this.execQuery(sql, args);
        List<Order> list = new ArrayList<Order>();
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
     * 删除订单
     */
    @Override
    public int delete(Object orderid) {
        String sql = "delete from t_order where order_id=?";
        Object[] args = {orderid};
        return this.execUpdate(sql, args);
    }

    /**
     * 根据订单号查询
     */
    @Override
    public Order getOne(Order order) {
        Order order2 = new Order();
        String sql = "select order_id,user_id,order_total,order_date,status from t_order where order_id = ?";
        Object[] args = {order.getOrderId()};
        CachedRowSet crs = this.execQuery(sql, args);
        if (crs != null) {
            try {
                while (crs.next()) {
                    order2.setOrderId(crs.getString("order_id"));
                    order2.setUserId(crs.getInt("user_id"));
                    order2.setOrderTotal(crs.getDouble("order_total"));
                    order2.setOrderDate(crs.getDate("order_date"));
                    order2.setStatus(crs.getInt("status"));
                }
                crs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return order2;
    }

    /**
     *支付
     * @param order
     * @return int
     */
    @Override
    public int update(Order order) {
        String sql ="update t_order set pay_date =now(),status=1 where order_id = ?";
        Object[] args = {order.getOrderId()};
        int a=this.execUpdate(sql,args);
        return a;
    }

    /**
     *修改状态（已评->未评价）
     * @param order
     * @return int
     */
    public int assess(Order order) {
        String sql ="update t_order set status=2 where order_id = ?";
        Object[] args = {order.getOrderId()};
        int a=this.execUpdate(sql,args);
        return a;
    }

    @Override
    public Order crsGet(CachedRowSet crs) throws SQLException {
        Order order = new Order();
        order.setOrderDate(crs.getDate("order_date"));
        order.setPayDate(crs.getDate("pay_date"));
        order.setOrderId(crs.getString("order_id"));
        order.setOrderTotal(crs.getDouble("order_total"));
        order.setStatus(crs.getInt("status"));
        order.setUserId(crs.getInt("user_id"));
        order.setUserName(crs.getString("user_name"));
        order.setAddress(crs.getString("address"));
        order.setTell(crs.getString("tell"));
        return order;
    }
}
