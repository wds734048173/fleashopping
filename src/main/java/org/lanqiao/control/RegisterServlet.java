package org.lanqiao.control;

import org.lanqiao.domain.User;
import org.lanqiao.service.IUserService;
import org.lanqiao.service.impl.UserServiceImpl;
import org.lanqiao.utils.MD5Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;


/*
* 注册
* */
@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {
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
        switch (method) {
            case "register":
                register(req, resp);
                break;
            case "updatePwd":
                updatePwd(req, resp);
                break;
            case "exit":
                exit(req, resp);
                break;
        }
    }

    private void updatePwd(HttpServletRequest req, HttpServletResponse resp) {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String passwordMd5 = MD5Utils.MD5(password);
        User user = new User();
        user.setUsername(username);
        user.setPassword(passwordMd5);
        int result = userService.modifyUserPassword(user);
        if(result == 1){
            try {
                resp.sendRedirect("/manager/login.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void register(HttpServletRequest req, HttpServletResponse resp) {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String passwordMd5 = MD5Utils.MD5(password);
        User user = new User();
        user.setUsername(username);
        user.setPassword(passwordMd5);
        int result = userService.addUser(user);
        if(result == 1){
            try {
                resp.sendRedirect("/manager/login.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void exit(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        session.setAttribute("username",null);
        try {
            resp.sendRedirect("/manager/login.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
