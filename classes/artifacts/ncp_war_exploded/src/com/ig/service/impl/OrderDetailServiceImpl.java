package com.ig.service.impl;

import com.ig.dao.BaseDao;
import com.ig.dao.impl.OrderDetailDaoImpl;
import com.ig.entity.OrderDetail;
import com.ig.service.OrderDetailService;

import java.util.List;

public class OrderDetailServiceImpl implements OrderDetailService {

    BaseDao<OrderDetail> dao = new OrderDetailDaoImpl();

    /**
     * 查询所有数据
     *
     * @return
     */
    @Override
    public List<OrderDetail> getAll() {
        return dao.getAll();
    }

    /**
     * 查询一个用户或者一个订单的所有记录
     */
    @Override
    public List<OrderDetail> getAll(OrderDetail orderDetail) {
        return dao.getAll(orderDetail);
    }

    /**
     * 添加订单明细记录
     */
    @Override
    public int add(OrderDetail orderDetail) {
        return dao.add(orderDetail);
    }

    /**
     * 删除订单明细
     */
    @Override
    public int delete(Object orderid) {
        return dao.delete(orderid);
    }
}
