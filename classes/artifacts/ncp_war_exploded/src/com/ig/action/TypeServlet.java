package com.ig.action;

import com.ig.entity.Type;
import com.ig.service.TypeService;
import com.ig.service.impl.TypeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/type")
public class TypeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flag = request.getParameter("flag");
       // System.out.println(flag);
        String typeName = null;
        String typeId = null;
        Type type = new Type();
        List<Type> list = new ArrayList<>();
        TypeService typeService = new TypeServiceImpl();
        HttpSession session = request.getSession();
        if (flag == null) {
            flag = "0";
        }
        switch (Integer.valueOf(flag)) {
            case 0:
                list = typeService.getAll();
                session.setAttribute("list", list);
                response.sendRedirect("backstage/product_category.jsp");
                break;

            /**
             * 添加商品
             */
            case 1:
                typeName = request.getParameter("type_name");
               // System.out.println(typeName);
                type = new Type();
                type.setTypeName(typeName);
                typeService.add(type);
                response.sendRedirect("type");
                break;

/**
 * 修改商品时获取的值传入页面中
 * 通过id获取一个类别
 */
            case 2:
                typeId = request.getParameter("type_id");
                Type type2 = new Type();
                type2.setTypeId(Integer.valueOf(typeId));
                session.setAttribute("type", typeService.getOne(type2));
                response.sendRedirect("backstage/update_category.jsp");
                break;
            /**
             * 修改类别
             * 通过id获取一个类别
             */
            case 3:
                typeId = request.getParameter("type_id");
                typeName = request.getParameter("type_name");
                type = new Type();
                type.setTypeId(Integer.valueOf(typeId));
                type.setTypeName(typeName);
                typeService.update(type);
                response.sendRedirect("type");
                break;

            /**
             * 删除类别
             */
            case 4:
                typeId = request.getParameter("type_id");
                typeService.delete(Integer.valueOf(typeId));
                response.sendRedirect("type");
                break;
            /**
             * 批量删除类别
             */
            case 5:
                String ids = request.getParameter("ids");
                System.out.println(ids);
                String[] StrIds = ids.split(",");
                for (int i = 0; i < StrIds.length; i++) {
                    System.out.println(StrIds[i]);
                    typeService.delete(Integer.valueOf(StrIds[i]));
                    System.out.println("--------s删除");
                }
                break;
            /**
             * 通过类别名获取获取类别（模糊查询）
             */
            case 6:
                typeName =request.getParameter("typeName");
                type.setTypeName(typeName);
                list =typeService.getAll(type);
                session.setAttribute( "list",list);
                response.sendRedirect("backstage/product_category.jsp");
                break;
            default:
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
