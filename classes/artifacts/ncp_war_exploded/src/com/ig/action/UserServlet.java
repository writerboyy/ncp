package com.ig.action;

import com.ig.entity.Goods;
import com.ig.entity.User;
import com.ig.service.GoodsService;
import com.ig.service.UserService;
import com.ig.service.impl.GoodsServiceImpl;
import com.ig.service.impl.UserServiceImpl;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService service = new UserServiceImpl();
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String flag = request.getParameter("flag");
        String userName = null;
        String password = null;
        String tell = null;
        String address = null;
        String userId = null;
        String grade = null;
        User user = new User();
        if (flag == null) {
            flag = "0";
        }
        switch (Integer.valueOf(flag)) {
            case 0:
            case 1://用户列表/分页显示/查询一个
                userId = request.getParameter("uid");
                if (userId != null) {//根据ID查一个
                    int userId2 = Integer.valueOf(userId);
                    user.setUserId(userId2);
                    User user1 = service.getUser(user);
                    session.setAttribute("user", user1);
                    response.sendRedirect("backstage/edit_user.jsp");
                } else {//分页显示
                    String pageNo = request.getParameter("iPageNo");
                    List<User> list = service.listUser();
                    List<User> userList = fenYe(user, list, pageNo, session);
                    session.setAttribute("flag", flag);
                    session.setAttribute("userList", userList);
                    response.sendRedirect("backstage/user_list.jsp");
                }
                break;
            case 2://用户添加
                userName = request.getParameter("userName");
                password = request.getParameter("password");
                tell = request.getParameter("tell");
                address = request.getParameter("address");
                user.setUserName(userName);
                user.setPassword(password);
                user.setTell(tell);
                user.setAddress(address);
                user.setGrade(1);
                service.regUser(user);
                response.sendRedirect("../reception/login.jsp");
                break;
            case 3://删除
                userId = request.getParameter("userId");
                int userId2 = Integer.valueOf(userId);
                service.deleteUser(userId2);
                response.sendRedirect("user");
                break;
            case 4://修改
                userId = request.getParameter("userId");
                userName = request.getParameter("userName");
                password = request.getParameter("password");
                tell = request.getParameter("tell");
                address = request.getParameter("address");
                grade = request.getParameter("grade");
                int grade1 = Integer.valueOf(grade);
                int userId1 = Integer.valueOf(userId);
                user.setUserId(userId1);
                user.setUserName(userName);
                user.setPassword(password);
                user.setTell(tell);
                user.setAddress(address);
                user.setGrade(grade1);
                int success1 = service.modifyUser(user);
                if (success1 == 1) {
                    response.getWriter().append("" + success1);
                    session.setAttribute("user", user);
                } else {
                    response.getWriter().append("0");
                }

                break;
            case 5://用户登录
                userName = request.getParameter("userName");
                password = request.getParameter("password");
                String k = request.getParameter("k");
                if ("true".equals(request.getParameter("ck"))) {
                    ServletContext application = this.getServletContext();//获取application
                    application.setAttribute("lastName", userName);
                }
                user = new User();
                user.setUserName(userName);
                User temp = service.login(user);
                if (temp != null) {
                    if (userName.equals(temp.getUserName()) && password.equals(temp.getPassword())) {
                        if ("1".equals(k)) {
                            if (temp.getGrade() == 9) {
                                session.setAttribute("admin", temp);
                                response.getWriter().write("{\"judge\":" + 1 + "}");
                                break;
                            } else {
                                response.getWriter().write("{\"judge\":" + 2 + "}");
                                break;
                            }
                        } else {
                            session.setAttribute("user", temp);
                            response.getWriter().write("{\"judge\":" + 1 + "}");
                            break;
                        }
                    } else {
                        response.getWriter().write("{\"judge\":" + 3 + "}");
                        break;
                    }
                } else {
                    response.getWriter().write("{\"judge\":" + 3 + "}");
                    break;
                }
            case 6://修改密码
                userName = request.getParameter("userName");
                password = request.getParameter("password");
                String password1 = request.getParameter("password1");
                user = (User) session.getAttribute("admin");
                if (!password.equals(user.getPassword())) {
                    response.getWriter().append("{\"judge\":" + false + "}");
                } else {
                    user.setUserName(userName);
                    user.setPassword(password1);
                    int i = service.modifyUser(user);
                    response.getWriter().append("{\"judge\":" + true + "}");
                }
                break;
            case 7://按属性查询
                String pageNo = request.getParameter("iPageNo");
                grade = request.getParameter("grade");
                String nameOrTell = request.getParameter("nameOrTell");
                Pattern pattern = Pattern.compile("^\\d+$");
                Matcher matcher = pattern.matcher(nameOrTell);
                if ("选择会员等级".equals(grade) || "".equals(grade)) {//没选会员等级按名字或电话查询
                    if (nameOrTell == null || "".equals(nameOrTell)) {//名字或电话为空返回页面
                        response.sendRedirect("user");
                    } else if (matcher.matches()) {//如果全为数字按电话查，（注册时用户名不能全为数字）
                        user.setTell(nameOrTell);
                        List<User> list = service.getUserAll(user);
                        List<User> userList = fenYe(user, list, pageNo, session);
                        session.setAttribute("grade", grade);
                        session.setAttribute("flag", flag);
                        session.setAttribute("nameOrTell", nameOrTell);
                        session.setAttribute("userList", userList);
                        response.sendRedirect("backstage/user_list.jsp");
                    } else {//按用户名查
                        user.setUserName(nameOrTell);
                        List<User> list = service.getUserAll(user);
                        List<User> userList = fenYe(user, list, pageNo, session);
                        session.setAttribute("grade", grade);
                        session.setAttribute("flag", flag);
                        session.setAttribute("nameOrTell", nameOrTell);
                        session.setAttribute("userList", userList);
                        response.sendRedirect("backstage/user_list.jsp");
                    }
                } else {//按等级查
                    int grade2 = Integer.valueOf(grade);
                    user.setGrade(grade2);
                    List<User> list = service.getUserAll(user);
                    List<User> userList = fenYe(user, list, pageNo, session);
                    session.setAttribute("flag", flag);
                    session.setAttribute("grade", grade);
                    session.setAttribute("userList", userList);
                    session.setAttribute("nameOrTell", nameOrTell);
                    response.sendRedirect("backstage/user_list.jsp");
                }
                break;
            case 8://全选删除
                String delArr = request.getParameter("delArr");
                String[] strings = delArr.split(",");
                for (String s : strings) {
                    int userId3 = Integer.valueOf(s);
                    service.deleteUser(userId3);
                }
                response.sendRedirect("user");
                break;
            case 9://验证用户名是否存在
                String regName = request.getParameter("regName");
                if (!"".equals(regName) && regName != null) {
                    user.setUserName(regName);
                    if (service.getUser(user) != null) {
                        response.getWriter().append("{\"judge\":" + false + "}");
                    } else {
                        response.getWriter().append("{\"judge\":" + true + "}");
                    }
                    break;
                }
                userName = request.getParameter("userName");
                userId = request.getParameter("userId");
                int uId = 0;
                if (userId != null) {
                    uId = Integer.valueOf(userId);
                }
                user.setUserName(userName);
                User user_c = service.login(user);
                if (user_c != null && uId != user_c.getUserId()) {
                    response.getWriter().append("1");
                } else {
                    response.getWriter().append("0");
                }
                break;
            /**前端
             *修改用户地址电话
             */
            case 10:
                User user1 = (User) session.getAttribute("user");
                address = request.getParameter("address");
                tell = request.getParameter("tell");
                if (user1 != null && !"".equals(address)) {
                    user1.setAddress(address);
                    user1.setTell(tell);
                    int success = service.modifyUser(user1);
                    response.getWriter().append(success + "");
                } else {
                    response.getWriter().append("0");
                }
                break;
            /**
             * 最近浏览
             */
            case 11:
//                ServletContext application = getServletContext();
                GoodsService goodsService = new GoodsServiceImpl();
                String gId = request.getParameter("goodsId");
                List<Goods> goodsList = new ArrayList<>();
                List<Goods> goods_l = (List) session.getAttribute("user_goods_List");
                if (goods_l != null) {
                    goodsList = goods_l;
                }
                int goodsId = Integer.valueOf(gId);
                Goods goods = new Goods();
                goods.setGoodsId(goodsId);
                goods = goodsService.getOne(goods);
                int goods_s = 0;
                for (int i = 0; i < goodsList.size(); i++) {
                    if (goodsList.get(i).getGoodsId() != goods.getGoodsId()) {
                        goods_s++;
                    }
                }
                if (goods_s == goodsList.size()) {
                    goodsList.add(goods);
                }
                if (goodsList.size() > 5) {
                    goodsList.remove(0);
                }
                session.setAttribute("user_goods_List", goodsList);
                break;
            case 12://清除session/application
//                ServletContext acation = getServletContext();
//                acation.removeAttribute("goodsList");
                HttpSession session1 = request.getSession();
                session1.invalidate();
                response.sendRedirect("../reception/login.jsp");
                break;
            case 13://后台起始页数据查询
                List<User> list = service.listUser();
                int number1 = 0;//白金会员
                int number2 = 0;//黄金会员
                int number3 = 0;//普通会员
                for (User u : list) {
                    if (u.getGrade() >= 5) {
                        number1++;
                        continue;
                    }
                    if (u.getGrade() >= 3) {
                        number2++;
                        continue;
                    }
                    if (u.getGrade() >= 1) {
                        number1++;
                        continue;
                    }
                }
                response.getWriter().write("{\"num1\":" + number1 + ",\"num2\":" + number2 + ",\"num3\":" + number3 + "}");
                break;
            default:
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private List<User> fenYe(User user, List<User> list, String pageNo, HttpSession session) {
        UserService service = new UserServiceImpl();
        int pageSize = 10;//页面数据条数
        int totalPage = (int) Math.ceil((list.size()) / (double) pageSize);//总页数
        int iPageNo = 0;//当前页
        if (pageNo == null || "".equals(pageNo)) {
            iPageNo = 1;
        } else {
            iPageNo = Integer.valueOf(pageNo);
        }
        if (iPageNo > totalPage) {
            iPageNo = totalPage;
        }
        if (iPageNo < 1) {
            iPageNo = 1;
        }
        List<User> userList = new ArrayList<>();
        if (user.getUserName() == null && user.getTell() == null && user.getGrade() == 0) {
            userList = service.listUser(iPageNo, pageSize);
        } else {
            userList = service.getUserAll(user, iPageNo, pageSize);
        }
        session.setAttribute("iPageNo", iPageNo);
        session.setAttribute("totalPage", totalPage);
        return userList;
    }
}
