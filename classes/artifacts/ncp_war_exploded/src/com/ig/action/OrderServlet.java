package com.ig.action;

import com.ig.entity.Order;
import com.ig.entity.User;
import com.ig.service.OrderDetailService;
import com.ig.service.OrderService;
import com.ig.service.impl.OrderDetailServiceImpl;
import com.ig.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flag = request.getParameter("flag");
        String pagenum = request.getParameter("pagenum");//
        //System.out.println(flag);
        HttpSession session = request.getSession();
        OrderService orderService = new OrderServiceImpl();
        OrderDetailService odService = new OrderDetailServiceImpl();
        List<Order> list;
        if (flag == null) {
            flag = "0";
        }
        if (pagenum == null) {
            pagenum = "1";
        }
        //System.out.println(pagenum);
        switch (Integer.valueOf(flag)) {
            case 0:
            case 1:
                //列出所有订单
                list = new OrderServiceImpl().getAll();
                new OrderServlet().fengye(list, pagenum, session);
                session.setAttribute("statusTxt", "");//记录状态
                session.setAttribute("flagOld", flag);//记录全部查询
                session.setAttribute("userNameOld", "");//记录用户名
                response.sendRedirect("backstage/order_list.jsp");
                break;
            case 2:
                //删除订单
                String orderId = request.getParameter("orderId");
                orderService.delete(orderId);
                odService.delete(orderId);
                response.sendRedirect("order");
                break;
            case 3:
                //按要求查询
                String userName = request.getParameter("userName");
                String status = request.getParameter("status");
                Order order = new Order();
                if (userName == null) {
                    userName = "";
                }
                order.setUserName(userName);
                //System.out.println("servlet------"+order.getUserName());
                if ("".equals(status) || status == null) {//不指定状态，按用户名模糊查询
//					System.out.println("flag:"+flag+"pagenum:"+pagenum+"status:"+status);
//					System.out.println("1-----------------"+userName);
                    List<Order> list2 = new OrderServiceImpl().getAllUsername(order);
                    new OrderServlet().fengye(list2, pagenum, session);
                    session.setAttribute("statusTxt", "");//记录状态
                    session.setAttribute("statusOld", status);//传入状态
                    session.setAttribute("flagOld", flag);//记录按要求查询
                    session.setAttribute("userNameOld", userName);//记录用户名
                    response.sendRedirect("backstage/order_list.jsp");
                    break;
                } else {//指定状态按用户名模糊查询
//					System.out.println("flag:"+flag+"pagenum:"+pagenum+"status:"+status);
//					System.out.println("2-----------------"+userName);

                    order.setStatus(Integer.valueOf(status));
                    List<Order> list2 = new OrderServiceImpl().getAllUsernameAndStatus(order);
                    new OrderServlet().fengye(list2, pagenum, session);
                    if ("0".equals(status)) {
                        session.setAttribute("statusTxt", "未付款");//记录状态
                    } else if("1".equals(status)) {
                        session.setAttribute("statusTxt", "已付款");//记录状态
                    }else {
                        session.setAttribute("statusTxt", "已评价");//记录状态
                    }
                    session.setAttribute("userNameOld", userName);
                    session.setAttribute("statusOld", status);//传入状态
                    session.setAttribute("flagOld", flag);//记录按要求查询
                    response.sendRedirect("backstage/order_list.jsp");
                    break;
                }
            case 4://批量删除
                String ids = request.getParameter("ids");
                String[] StrIds = ids.split(",");
                for (int i = 0; i < StrIds.length; i++) {
                    orderService.delete(Integer.valueOf(StrIds[i]));
                    odService.delete(Integer.valueOf(StrIds[i]));
                }
                break;
            case 5://根据用户ID查询订单
                String userId = request.getParameter("userId");
                if (userId == null || "".equals(userId)) {
                    response.sendRedirect("reception/login.jsp");
                    break;
                }
                User user = new User();
                user.setUserId(Integer.valueOf(userId));
                List<Order> orderUser = orderService.getAll(user);
                List<Order> listfen = fengye(orderUser, pagenum, session);
                session.setAttribute("listfen", listfen);
                session.setAttribute("userId", userId);
                response.sendRedirect("orderDetail?flag=2");
                break;
            case 6://后台起始页数据查询
                list = orderService.getAll();
                int number1 = list.size();//总订单数
                int number2 = 0;//已付款
                int number3 = 0;//未付款
                for (Order o : list) {
                    if (o.getStatus() != 0)
                        number2++;
                    else
                        number3++;
                }
                response.getWriter().write("{\"num1\":" + number1 + ",\"num2\":" + number2 + ",\"num3\":" + number3 + "}");
                break;
            case 7://修改订单状态（未评论->已评论）
                String orderId2 = request.getParameter("orderId");
                System.out.println("orderId2:" + orderId2);
                Order orderAssess = new Order();
                orderAssess.setOrderId(orderId2);
                if (orderService.assess(orderAssess) > 0) {
                    response.getWriter().write("{\"judge\":" + true + "}");
                    break;
                } else {
                    response.getWriter().write("{\"judge\":" + false + "}");
                    break;
                }

            case 8:
                //删除订单
                String orderId3 = request.getParameter("orderId");
                orderService.delete(orderId3);
                odService.delete(orderId3);
                break;
            default:
                break;
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }

    private List<Order> fengye(List<Order> list, String pagenum, HttpSession session) {
        int pagen = Integer.valueOf(pagenum);//得到第几页
        if (pagen < 1) {
            pagen = 1;
        }

        int barstotal = list.size();           //得到总条数
        int shownum = 10;                        //每页显示数据条数
        int pagetatol = barstotal / shownum;        //总页数
        if (barstotal % shownum != 0) {
            pagetatol++;
        }
        if (pagen > pagetatol) {
            pagen = pagetatol;
        }
        if (pagen < 1) {
            pagen = 1;
        }

//		System.out.println("pagen"+pagen+"zong"+pagetatol);
        int start = (pagen - 1) * shownum;  //开始的数据下标
        int end = pagen * shownum;            //介绍的数据下标
        if (end > barstotal) {                //限定结束数组下标
            end = barstotal;
        }
        list = list.subList(start, end);//查询后的页码数据
        session.setAttribute("barstotal", barstotal);//总条数
        session.setAttribute("pagetatol", pagetatol);//总页数
        session.setAttribute("pagen", pagen);            //当前页数
        session.setAttribute("OrderList", list);
        return list;
    }
}
