package org.lanqiao.control;

import org.lanqiao.domain.User;
import org.lanqiao.service.IUserService;
import org.lanqiao.service.impl.UserServiceImpl;
import org.lanqiao.utils.MD5Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/*
* 后台登录
* */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
    IUserService userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/json");
        String method = req.getParameter("method");
        switch(method){
            case "login":
                managerLogin(req,resp);
                break;
            case "userLogin":
                userLogin(req, resp);
                break;
        }

    }

    private void userLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        //对密码进行MD5加密
        String passwordMd5 = MD5Utils.MD5(password);
        //根据用户名密码获取用户 获取不到则为null
        User user = userService.getUserByUserNameAndPassword(username,passwordMd5);
        if (user == null){
            String message = "用户名或密码错误";
            //返回提示信息
            req.setAttribute("message",message);
            try {
                req.getRequestDispatcher("/user/login.jsp").forward(req,resp);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (ServletException e) {
                e.printStackTrace();
            }
        }else {
            int role = user.getRole();
            if(role != 1){
                String message = "您不是普通用户";
                req.setAttribute("message",message);
                req.getRequestDispatcher("/user/login.jsp").forward(req,resp);
            }else{
                int state = user.getState();
                if (state != 0) {
                    String message = "您的账号异常，请联系管理员";
                    req.setAttribute("message", message);
                    req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
                } else {
                    //获取用户的真实名字并返回
                    String realname = user.getRealname();
                    int userId = user.getId();
                    String address = user.getAddress();
                    String telphone = user.getTelphone();
                    HttpSession session = req.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("realname", realname);
                    session.setAttribute("userId", userId);
                    session.setAttribute("telphone", telphone);
                    session.setAttribute("address", address);
                    Cookie cookie = new Cookie("JSESSIONID", session.getId());
                    cookie.setMaxAge(7 * 24 * 60 * 60);
                    resp.addCookie(cookie);
                    try {
                        resp.sendRedirect("/user/index.jsp");
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    private void managerLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String passwordMd5 = MD5Utils.MD5(password);
        User user = userService.getUserByUserNameAndPassword(username,passwordMd5);
        if(user == null){
            String message = "用户名或密码错误";
            req.setAttribute("message",message);
            req.setAttribute("username",username);
            req.setAttribute("password",password);
            req.getRequestDispatcher("/manager/login.jsp").forward(req,resp);
        }else{
            int role = user.getRole();
            if(role != 0){
                String message = "您不是管理员，请用管理员账户登陆";
                req.setAttribute("message",message);
                req.getRequestDispatcher("/manager/login.jsp").forward(req,resp);
            }else {
                int state = user.getState();
                if (state != 0) {
                    String message = "您的账号异常，请联系管理员";
                    req.setAttribute("message", message);
                    req.getRequestDispatcher("/manager/login.jsp").forward(req, resp);
                } else {
                    String name = user.getUsername();
                    HttpSession session = req.getSession();
                    session.setAttribute("username", name);
                    Cookie cookie = new Cookie("JSESSIONID", session.getId());
                    cookie.setMaxAge(7 * 24 * 60 * 60);
                    resp.addCookie(cookie);
                    resp.sendRedirect("/manager/index.jsp");
                }
            }
        }
    }
}
