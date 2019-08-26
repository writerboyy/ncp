package com.ig.action;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.ig.entity.Goods;
import com.ig.entity.Order;
import com.ig.entity.OrderDetail;
import com.ig.service.GoodsService;
import com.ig.service.OrderDetailService;
import com.ig.service.OrderService;
import com.ig.service.impl.GoodsServiceImpl;
import com.ig.service.impl.OrderDetailServiceImpl;
import com.ig.service.impl.OrderServiceImpl;
import config.AlipayConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/buy")
public class BuyServlet extends HttpServlet {

    private int userId;
    private static int goodsId;
    private static int number;
    private String result;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GoodsService goodsService = new GoodsServiceImpl();
        OrderService orderService = new OrderServiceImpl();
        OrderDetailService odService = new OrderDetailServiceImpl();
        HttpSession session = request.getSession();

        String flag = request.getParameter("flag");
        if (flag == null) {
            flag = "0";
        }
        switch (Integer.valueOf(flag)) {
            case 0:
                //获取支付宝GET过来反馈信息
                getAlipayFeedback(request, response);
                break;
            case 1:

                break;
            case 2:
                //生成订单并付款
                createOrder(request, response, goodsService, orderService, odService, session);
                break;
            case 3://付款
                pay(request, response, orderService);
                break;
            default:
                break;
        }
    }

    /**
     * 付款
     *
     * @param request
     * @param response
     * @param orderService
     * @throws IOException
     */
    public void pay(HttpServletRequest request, HttpServletResponse response, OrderService orderService) throws IOException {
        Order order = new Order();
        String orderId = request.getParameter("orderId");
        order.setOrderId(orderId);
        Order order2 = orderService.getOne(order);
        System.out.println(order2);
        if (orderService.update(order2) > 0) {
            response.getWriter().write("{\"judge\":" + true + "}");
            return;
        } else {
            response.getWriter().write("{\"judge\":" + false + "}");
            return;
        }
    }

    /**
     * 生成订单并跳转付款
     *
     * @param request
     * @param response
     * @param goodsService
     * @param orderService
     * @param odService
     * @param session
     * @throws IOException
     */
    public void createOrder(HttpServletRequest request, HttpServletResponse response, GoodsService goodsService, OrderService orderService, OrderDetailService odService, HttpSession session) throws IOException {
        List<Goods> list = (List<Goods>) session.getAttribute("goodsList");
        if (list != null) {
            Order order = new Order();
            OrderDetail orderDetail = new OrderDetail();
            Random random = new Random();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
            String orderId = sdf.format(System.currentTimeMillis()) + (random.nextInt(8999) + 1000);
            userId = Integer.valueOf(request.getParameter("userId"));
            double total = Double.valueOf(request.getParameter("total"));
            order.setUserId(userId);
            order.setOrderId(orderId);
            order.setOrderTotal(total);
            order.setStatus(0);
            int i = orderService.add(order);
            for (Goods goods1 : list) {
                orderDetail.setOrderId(orderId);
                orderDetail.setUserId(userId);
                orderDetail.setGoodsId(goods1.getGoodsId());
                orderDetail.setOrderNumber(goods1.getSalesNumber());
                goods1.setSalesNumber(goods1.getSalesNumber());
                goodsService.update(goods1);
                orderDetail.setPrice(goods1.getPrice());
                odService.add(orderDetail);
            }
            System.out.println("生成的订单：" + orderService.getOne(order));
            if (i > 0) {
                response.getWriter().append("{\"order_Id\":\"" + orderId + "\"}");
                return;
            } else {
                response.getWriter().append("{\"order_Id\":}");
                return;
            }
        }
    }

    /**
     * 获取支付宝反馈信息
     *
     * @param request
     * @param response
     * @throws IOException
     */
    public void getAlipayFeedback(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = false; //调用SDK验证签名
        try {
            signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }

        //——请在这里编写您的程序（以下代码仅作参考）——
        if (signVerified) {
            //商户订单号
            String out_trade_no = request.getParameter("out_trade_no");
            //sessionid
            String extra_common_param = request.getParameter("extra_common_param");
            //支付宝交易号
            String trade_no = request.getParameter("trade_no");
            //交易状态
            String trade_status = request.getParameter("trade_status");
            System.out.println("支付宝交易号：" + trade_no);
            OrderServiceImpl orderService = new OrderServiceImpl();
            Order order = new Order();
            order.setOrderId(out_trade_no);
            System.out.println("支付宝返回订单编号" + out_trade_no);
            Order order2 = orderService.getOne(order);
            //System.out.println(order2);
            System.out.println("支付宝返回的sessionId：" + extra_common_param);
            orderService.update(order2);
            response.getWriter().println(" <script type=\"text/javascript\"> window.close();</script>");
            //response.sendRedirect("reception/index.jsp");
            //out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
        } else {//"验签失败"
            response.sendRedirect("reception/error.html");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
