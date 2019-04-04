package org.lanqiao.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "saleFilter" ,urlPatterns = "/sale/*")
public class SaleFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("系统初始化。。");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // 获得在下面代码中要用的request,response,session对象
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();

        // 获得用户请求的URI
        String path = request.getRequestURI();

        // 从session里取顾客信息
        String username = (String) session.getAttribute("username");
        if(path.indexOf("/css/") > -1 || path.indexOf("/js/") > -1 || path.indexOf("/imges/") > -1){
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        // 登陆页面、注册页面、首页无需过滤
        if(path.indexOf("/login.jsp") > -1 || path.indexOf("/register.jsp") > -1 || path.indexOf("/index.jsp")>-1) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        if (username == null || "".equals(username)) {
            // 跳转到登陆页面
            response.sendRedirect("/sale/login.jsp");
        } else {
            // 已经登陆,继续此次请求
            filterChain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        System.out.println("系统退出。。");
    }
}
