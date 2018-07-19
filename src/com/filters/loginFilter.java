package com.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "loginFilter", urlPatterns = "/*")
public class loginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        // 获得在下面代码中要用的req,resp,session对象
        HttpServletRequest servletRequest = (HttpServletRequest) req;
        HttpServletResponse servletResponse = (HttpServletResponse) resp;
        HttpSession session = servletRequest.getSession();

        // 获得用户请求的URI
        String path = servletRequest.getRequestURI();
        //System.out.println(path);

        // 从session里取登陆信息
        String id = (String) session.getAttribute("id");

        // 无需过滤的页面
        if(path.contains("assets") || path.contains("loginVerification")) {
            chain.doFilter(servletRequest, servletResponse);
            return ;
        }

        if (path.contains("login.jsp")) {
            if (session.getAttribute("id").equals("Hello World!")) servletResponse.sendRedirect("/");
            else chain.doFilter(servletRequest, servletResponse);
            return ;
        }

        // 判断如果没有取到员工信息,就跳转到登陆页面
        if (id != null && id.equals("Hello World!")) {
            // 已经登陆,继续此次请求
            chain.doFilter(req, resp);
        } else {
            // 跳转到登陆页面
            servletRequest.getRequestDispatcher("/login.jsp").forward(servletRequest, servletResponse);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
