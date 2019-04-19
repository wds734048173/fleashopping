package org.lanqiao.control;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebServlet("collection")
public class CollectionServlet extends HttpServlet {

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
            //添加收藏
            case "addCollection":
                addCollection(req, resp);
                break;
            //获取收藏列表
            case "getCollectionList":
                getCollectionList(req, resp);
                break;
            //取消收藏列表
            case "removeCollection":
                removeCollection(req, resp);
                break;
        }
    }

    private void removeCollection(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void getCollectionList(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void addCollection(HttpServletRequest req, HttpServletResponse resp) {
        System.out.println("添加收藏、、、、、、、");
    }
}
