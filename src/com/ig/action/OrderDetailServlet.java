package com.ig.action;

import com.ig.entity.Order;
import com.ig.entity.OrderDetail;
import com.ig.entity.User;
import com.ig.service.OrderDetailService;
import com.ig.service.OrderService;
import com.ig.service.UserService;
import com.ig.service.impl.OrderDetailServiceImpl;
import com.ig.service.impl.OrderServiceImpl;
import com.ig.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet("/orderDetail")
public class OrderDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flag = request.getParameter("flag");
        HttpSession session = request.getSession();
        OrderDetailService odService = new OrderDetailServiceImpl();
        UserService userService = new UserServiceImpl();
        OrderService orderService = new OrderServiceImpl();
        if (flag == null) {
            flag = "0";
        }
        switch (Integer.valueOf(flag)) {
            case 0:
                break;
            case 1://加载订单明细
                getAllDetail(request, response, session, odService, userService, orderService);
                break;
            case 2://根据订单号集合查询订单明细
                findDetailList(response, session);
                break;
            case 3:
                break;
            case 4:
                break;
            default:
                break;
        }
    }

    public void findDetailList(HttpServletResponse response, HttpSession session) throws IOException {
        String userId2 = (String) session.getAttribute("userId");
        List<Order> listfen = (List<Order>) session.getAttribute("listfen");
        List<OrderDetail> listDetail = new ArrayList<OrderDetail>();
        for (Order o : listfen) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrderId(o.getOrderId());
            List<OrderDetail> orderDetailList = new OrderDetailServiceImpl().getAll(orderDetail);
            listDetail.addAll(orderDetailList);
        }
        session.setAttribute("listDetail", listDetail);
        session.setAttribute("listfen", listfen);
        session.setAttribute("userId", userId2);
        response.sendRedirect("reception/user_center_order.jsp");
    }

    public void getAllDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session, OrderDetailService odService, UserService userService, OrderService orderService) throws IOException {
        String orderId = request.getParameter("orderId");
        User user = new User();
        OrderDetail od = new OrderDetail();
        Order order = new Order();
        od.setOrderId(orderId);
        order.setOrderId(orderId);
        List<OrderDetail> odList = odService.getAll(od);
        int userId = odList.get(0).getUserId();
        user.setUserId(userId);
        session.setAttribute("order", orderService.getOne(order));
        session.setAttribute("odUser", userService.getUser(user));
        session.setAttribute("odList", odList);
        response.sendRedirect("backstage/order_detail.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
