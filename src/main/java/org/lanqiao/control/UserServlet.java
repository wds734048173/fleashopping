package org.lanqiao.control;

import org.lanqiao.domain.User;
import org.lanqiao.service.IUserService;
import org.lanqiao.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * @Auther: WDS
 * @Date: 2019/4/3 23:07
 * @Description:
 */
@WebServlet("/user.do")
public class UserServlet extends HttpServlet {

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
        switch (method){
            case "addUser":
                addUser(req, resp);
                break;
        }
    }

    private void addUser(HttpServletRequest req, HttpServletResponse resp) {
        User user = new User();
        user.setUsername("admin");
        user.setPassword("123456");
        user.setRealname("管理员");
        user.setSex(0);
        user.setCollage("吕梁学院");
        user.setAge(21);
        userService.addUser(user);
    }
}
