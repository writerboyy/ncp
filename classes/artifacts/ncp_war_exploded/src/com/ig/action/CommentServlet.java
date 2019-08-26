package com.ig.action;

import com.alibaba.fastjson.JSON;
import com.ig.dao.impl.CommentDaoImpl;
import com.ig.entity.Comment;
import com.ig.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
    private static List<Comment> Lastlist;
    private static List<Comment> userlist;
    private static List<Comment> Alllist;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flag = request.getParameter("flag");
        String ComId = null;
        String goodsId = null;
        String userId = null;
        String pagenum = null;
        String Comment = null;
        String praise = null;
        HttpSession session = request.getSession();
        Comment comment = new Comment();
        List<Comment> list = new ArrayList<>();
        List l = new ArrayList();
        List<Comment> listComment = new ArrayList<>();
        CommentDaoImpl commentDao = new CommentDaoImpl();
        CommentServlet commentServlet = new CommentServlet();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        if (flag == null) {
            flag = "0";
        }
        switch (Integer.valueOf(flag)) {
            case 0:
                goodsId = request.getParameter("goodsid");
                pagenum = request.getParameter("pagenum");
                Lastlist = (List<Comment>) session.getAttribute("Lastlist");
                if (goodsId != null) {
                    comment.setGoodsId(Integer.valueOf(goodsId));
                    list = commentDao.getAll(comment);
                    session.setAttribute("Lastlist", list);
                }
                if (Lastlist != null) {
                    l = fengye(Lastlist, pagenum, session);
                } else {
                    l = fengye(list, pagenum, session);
                }
                response.getWriter().println(JSON.toJSONString(l));
                break;
            case 1:
                userId = request.getParameter("userId");
                pagenum = request.getParameter("pagenum");
                userlist = (List<Comment>) session.getAttribute("userlist");
                if (userId != null) {
                    comment.setUserId(Integer.valueOf(userId));
                    list = commentDao.getAll(comment);
                    session.setAttribute("userlist", list);
                }
                if (userlist != null) {
                    l = fengye(userlist, pagenum, session);
                } else {
                    l = fengye(list, pagenum, session);
                }
                response.getWriter().println(JSON.toJSONString(l));
                break;
            case 2:
                pagenum = request.getParameter("pagenum");

                list = commentDao.getAll();
                l = fengye(list, pagenum, session);

                response.getWriter().println(JSON.toJSONString(l));
                break;
            case 3:
                String str = request.getParameter("str");
                String[] arr = str.split(",");
                for (int i = 0; i < arr.length; i++) {
                    commentDao.delete(Integer.valueOf(arr[i]));
                }
                break;
            case 4:
                userId = request.getParameter("userId");
                goodsId = request.getParameter("goodsId");
                Comment = request.getParameter("com_text");
                praise = request.getParameter("praise");
                comment.setGoodsId(Integer.valueOf(goodsId));
                comment.setUserId(Integer.valueOf(userId));
                comment.setPraise(Integer.valueOf(praise));
                comment.setComment(Comment);
                commentDao.add(comment);
                break;
            case 5:
                String comId = request.getParameter("comId");
                commentDao.delete(Integer.valueOf(comId));
                break;
            case 6:
                User user = (User) session.getAttribute("user");
                pagenum = request.getParameter("pagenum");
                comment.setUserId(user.getUserId());
                list = commentDao.getAll(comment);
                l = fengye(list, pagenum, session);
                response.getWriter().println(JSON.toJSONString(l));
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    private List fengye(List<Comment> list, String pagenum, HttpSession session) {
        List<Comment> listComment = new ArrayList<>();

        int end = 0;//开始行数
        int start = 0;//结束行数

        int page = 0;//当前页
        int pageTotal = 0;//总页数

        if (pagenum != null) {
            page = Integer.valueOf(pagenum);//得到第几页
        } else {
            page = 1;
        }

        if (page < 1) {
            page = 1;
        }

        double pageSize = 5.0;//每页显示条数
        int pageSum = list.size();//总条数

        pageTotal = (int) Math.ceil(pageSum / pageSize);

        if (page > pageTotal) {
            page = pageTotal;
        }

        start = (page - 1) * 5;
        end = page * 5;

        if (end > pageSum) {//限定结束数组下标
            end = pageSum;
        }

        listComment = list.subList(start, end);
        List l = new ArrayList();
        l.add(listComment);
        l.add(page);
        l.add(pageTotal);
        session.setAttribute("pageSum", pageSum);
        return l;
    }
}
