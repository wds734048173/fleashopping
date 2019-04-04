package org.lanqiao.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "managerFilter",urlPatterns = "/manager/*")
public class ManagerFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // 获得在下面代码中要用的request,response,session对象
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();

        // 获得用户请求的URI
        String path = request.getRequestURI();

        // 从session里取员工工号信息
        String username = (String) session.getAttribute("username");

        //创建类Constants.java，里面写的是无需过滤的页面
         /*for (int i = 0; i < Constants.NoFilter_Pages.length; i++) {

             if (path.indexOf(Constants.NoFilter_Pages[i]) > -1) {
                 chain.doFilter(servletRequest, servletResponse);
                 return;
            }
         }*/

         //资源文件无需过滤
        if(path.indexOf("/css/") > -1 || path.indexOf("/js/") > -1 || path.indexOf("/img/") > -1){
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        // 登陆页面或注册页面无需过滤
        if(path.indexOf("/login.jsp") > -1 || path.indexOf("/register.jsp") > -1 || path.indexOf("/updatePwd.jsp") > -1) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        // 判断如果没有取到员工信息,就跳转到登陆页面
        if (username == null || "".equals(username)) {
            // 跳转到登陆页面
            response.sendRedirect("/manager/login.jsp");
        } else {
            // 已经登陆,继续此次请求
            filterChain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
