package com.ig.filter;

import com.ig.entity.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 后台过滤权限
 */
public class BackstageFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        //获取请求的页面
        String requestPath = req.getServletPath();
        User user = (User) req.getSession().getAttribute("admin");
        if (requestPath.contains(".jsp")) {//过滤访问jsp
            if (requestPath.endsWith("adminLogin.jsp")) {
                chain.doFilter(request, response);
                return;
            } else if (user != null) {
                chain.doFilter(request, response);
                return;
            } else {
                res.sendRedirect("adminLogin.jsp");
                return;
            }
        }
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
