package org.lanqiao.control;

import org.lanqiao.domain.Condition;
import org.lanqiao.domain.User;
import org.lanqiao.service.IUserService;
import org.lanqiao.service.impl.UserServiceImpl;
import org.lanqiao.utils.MD5Utils;
import org.lanqiao.utils.PageModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

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
            case "getUserListByCondition":
                getUserListByCondition(req, resp,"");
                break;
            case "updateUserState":
                updateUserState(req, resp);
                break;
            case "getMyInfo":
                getMyInfo(req, resp);
                break;
        }
    }

    private void getMyInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object userId = session.getAttribute("userId");
        System.out.println(userId);
        if(userId == null){
            req.getRequestDispatcher("user/login.jsp").forward(req,resp);
        }else {
            User user =userService.getUserById(Integer.valueOf(userId.toString()));
            System.out.println(user+"==========================");
            req.setAttribute("user",user);
            req.getRequestDispatcher("user/myInfo.jsp").forward(req,resp);
        }
    }

    private void updateUserState(HttpServletRequest req, HttpServletResponse resp) {
        int userId = Integer.valueOf(req.getParameter("userId"));
        int state = Integer.valueOf(req.getParameter("state"));
        userService.modifyUserState(userId,state);
        getUserListByCondition(req,resp,"update");
    }

    private void getUserListByCondition(HttpServletRequest req, HttpServletResponse resp, String mark) {
        int pageNum = 1;
        if(req.getParameter("currentPage") != null){
            pageNum = Integer.valueOf(req.getParameter("currentPage"));
        }
        int pageSize = 5;
        if(req.getParameter("pageSize") != null){
            pageSize = Integer.valueOf(req.getParameter("pageSize"));
        }

        //查询条件
        String searchName = "";
        if(req.getParameter("searchName") != null){
            searchName = req.getParameter("searchName");
        }
        String searchState = "-1";
        if(req.getParameter("searchState") != null  || "-1".equals(req.getParameter("searchState"))){
            searchState = req.getParameter("searchState");
        }
        Condition condition = new Condition();
        condition.setName(searchName);
        condition.setState(searchState);
        int totalRecords = userService.getUserCount(condition);
        //不同操作，不同的当前页设置
        PageModel pm = new PageModel(pageNum,totalRecords,pageSize);
        if("add".equals(mark)){
            pageNum = pm.getEndPage();
        }else if("update".equals(mark)){
            pageNum = Integer.valueOf(req.getParameter("currentPage"));
        }else{
            //如果当前页大于总页数，但是排除查询不到数据的情况。当前页等于最大页
            if(pageNum > pm.getTotalPageNum() && pm.getTotalPageNum() != 0){
                pageNum = pm.getTotalPageNum();
            }
        }
        PageModel pageModel = new PageModel(pageNum,totalRecords,pageSize);
        //分页条件封装
        condition.setCurrentPage(pageModel.getStartIndex());
        condition.setPageSize(pageModel.getPageSize());
        List<User> userList = userService.getUserList(condition);
        req.setAttribute("currentPage",pageNum);
        pageModel.setRecords(userList);
        req.setAttribute("pm",pageModel);
        req.setAttribute("condition",condition);
        req.setAttribute("userList",userList);
        try {
            req.getRequestDispatcher("manager/userList.jsp").forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //前端注册
    private void addUser(HttpServletRequest req, HttpServletResponse resp) {
        String username = req.getParameter("username");
        String password1 = req.getParameter("password1");
        String password2 = req.getParameter("password2");
        String sex = req.getParameter("sex");
        String realname = req.getParameter("realname");
        String collage = req.getParameter("collage");
        String telphone = req.getParameter("telphone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");

        User user = new User();
        user.setUsername(username);
        user.setPassword(MD5Utils.MD5(password1));
        user.setSex(Integer.valueOf(sex));
        user.setRealname(realname);
        user.setCollage(collage);
        user.setTelphone(telphone);
        user.setEmail(email);
        user.setAddress(address);
        user.setRole(1);
        userService.addUser(user);
        try {
            req.setAttribute("success","success");
            req.getRequestDispatcher("/user/login.jsp").forward(req,resp);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }
}
