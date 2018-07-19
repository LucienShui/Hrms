package com.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "CharEncoding", urlPatterns = "/*")
public class CharEncoding implements Filter {
    private String encode = null;
    private FilterConfig config = null;

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        request.setCharacterEncoding(this.encode);
        response.setContentType("text/html; charset=UTF-8");
        // pass the request along the Filter chain
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig fConfig) throws ServletException {
        this.config = fConfig;
        this.encode = config.getInitParameter("encoding") == null ? "utf-8" : config.getInitParameter("encoding");
    }

}
