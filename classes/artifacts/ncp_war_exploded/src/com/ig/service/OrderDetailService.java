package com.ig.service;

import com.ig.entity.OrderDetail;

import java.util.List;

/**
 * 订单明细业务逻辑接口
 */
public interface OrderDetailService {
    /**
     * 查询所有数据
     *
     * @return
     */
    List<OrderDetail> getAll();

    /**
     * 查询一个用户或者一个订单的所有记录
     */
    List<OrderDetail> getAll(OrderDetail orderDetail);

    /**
     * 添加订单明细记录
     */
    int add(OrderDetail orderDetail);

    /**
     * 删除订单明细
     */
    int delete(Object orderId);

}
