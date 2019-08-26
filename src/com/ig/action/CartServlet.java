package com.ig.action;

import com.alibaba.fastjson.JSONArray;
import com.ig.entity.Cart;
import com.ig.entity.Goods;
import com.ig.entity.User;
import com.ig.service.CartService;
import com.ig.service.GoodsService;
import com.ig.service.impl.CartServiceImpl;
import com.ig.service.impl.GoodsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
//@WebServlet("/cart/*")//cart下的所有方法
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private int goodsId;
    private int userId;
    private int number;
    private List<Goods> goodsList;
    CartService cartService = new CartServiceImpl();
    GoodsService goodsService = new GoodsServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String flag = request.getParameter("flag");
        if (flag == null) {
            flag = "0";
        }
        switch (Integer.valueOf(flag)) {
            case 0://获取个人购物车商品列表
                getUserCart(response, session);
                break;
            case 1://获取商品个数跳转订单界面
                buyCartGoods(request, session);
                break;
            case 2://添加商品到购物车
                addCartGoods(request, response);
                break;
            case 3://删除购物车中商品
                deleteCartGoods(request, response);

                break;
            case 4://查询个人购物车总量
                getUserCartNumber(request, response);
                break;
            case 5://修改购物车商品数量
                updateCart(request, response);
                break;
            default:
                break;
        }
    }

    /**
     * 获取商品个数跳转订单界面
     * @param request
     * @param session
     */
    public void buyCartGoods(HttpServletRequest request,HttpSession session) {
        goodsList = new ArrayList<>();
        userId = Integer.valueOf(request.getParameter("userId"));
        JSONArray goodsIds = JSONArray.parseArray(request.getParameter("goodsIds"));
        JSONArray numbers = JSONArray.parseArray(request.getParameter("numbers"));
        double goodsSum = 0;
        for (int i = 0; i < goodsIds.size(); i++) {
            Goods tempGoods = new Goods();
            Goods goods = new Goods();
            goods.setGoodsId(Integer.valueOf((String) goodsIds.get(i)));
            tempGoods = goodsService.getOne(goods);
            tempGoods.setSalesNumber(Integer.valueOf((String) numbers.get(i)));
            goodsList.add(tempGoods);
            goodsSum += tempGoods.getPrice() * tempGoods.getSalesNumber();
        }
        session.setAttribute("goodsSum", goodsSum);
        session.setAttribute("goodsList", goodsList);
    }

    /**
     * 添加商品到购物车
     * @param request
     * @param response
     * @throws IOException
     */
    public void addCartGoods(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Cart cart = getCart(request);
        if (cartService.addCart(cart) > 0) {
            response.getWriter().append("{\"judge\":" + true + "}");
        } else {
            response.getWriter().append("{\"judge\":" + false + "}");
        }
    }

    /**
     * 删除购物车中商品
     * @param request
     * @param response
     * @throws IOException
     */
    public void deleteCartGoods(HttpServletRequest request, HttpServletResponse response) throws IOException {
        goodsId = Integer.valueOf(request.getParameter("goodsId"));
        userId = Integer.valueOf(request.getParameter("userId"));
        if (cartService.deleteCart(goodsId, userId) > 0) {
            response.getWriter().append("{\"judge\":" + true + "}");
        } else {
            response.getWriter().append("{\"judge\":" + false + "}");
        }
    }

    /**
     * 查询个人购物车总量
     * @param request
     * @param response
     * @throws IOException
     */
    public void getUserCartNumber(HttpServletRequest request, HttpServletResponse response) throws IOException {
        userId = Integer.valueOf(request.getParameter("userId"));
        response.getWriter().append("{\"num\":" + cartService.listUserCart(userId).size() + "}");
    }

    /**
     * 修改购物车商品数量
     * @param request
     * @param response
     * @throws IOException
     */
    public void updateCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Cart cart = getCart(request);
        if (cartService.updateCart(cart) > 0) {
            response.getWriter().append("{\"judge\":" + true + "}");
        } else {
            response.getWriter().append("{\"judge\":" + false + "}");
        }
    }

    /**
     * 生成购物车对象
     * @param request
     * @return
     */
    public Cart getCart(HttpServletRequest request) {
        Cart cart = new Cart();
        Goods goods = new Goods();
        goodsId = Integer.valueOf(request.getParameter("goodsId"));
        userId = Integer.valueOf(request.getParameter("userId"));
        number = Integer.valueOf(request.getParameter("number"));
        goods.setGoodsId(goodsId);
        goods = goodsService.getOne(goods);
        cart.setUserId(userId);
        cart.setGoodsId(goods.getGoodsId());
        cart.setCartNumber(number);
        cart.setPrice(goods.getPrice());
        cart.setGoodsName(goods.getGoodsName());
        return cart;
    }

    /**
     * 获取个人购物车商品列表
     * @param response
     * @param session
     * @throws IOException
     */
    public void getUserCart(HttpServletResponse response,HttpSession session) throws IOException {
        Goods goods;
        User user = (User) session.getAttribute("user");
        if (user!=null){
            List<Cart> cartList = cartService.listUserCart(user.getUserId());
            goodsList = new ArrayList<>();
            for (Cart c:cartList){
                Goods temp = new Goods();
                temp.setGoodsId(c.getGoodsId());
                goods = goodsService.getOne(temp);
                goodsList.add(goods);
            }
            session.setAttribute("goodsList",goodsList);
            session.setAttribute("cartList", cartList);
            response.sendRedirect("reception/cart.jsp");
        }else{
            response.sendRedirect("reception/login.jsp");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
