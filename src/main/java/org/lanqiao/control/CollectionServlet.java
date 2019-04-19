package org.lanqiao.control;

import org.lanqiao.domain.Collection;
import org.lanqiao.service.ICollectionService;
import org.lanqiao.service.impl.CollectionServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet("/collection.do")
public class CollectionServlet extends HttpServlet {

    ICollectionService collectionService = new CollectionServiceImpl();

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

    private void removeCollection(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("collectionId");
        collectionService.removeCollection(Integer.valueOf(id));
        getCollectionList(req, resp);
    }

    private void getCollectionList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object userId = session.getAttribute("userId");
        if(userId == null){
            req.getRequestDispatcher("user/login.jsp").forward(req,resp);
        }else {
            List<Collection> collectionList =  collectionService.getCollectionList(Integer.valueOf(userId.toString()));
            req.setAttribute("collectionList",collectionList);
            req.getRequestDispatcher("user/collectionList.jsp").forward(req,resp);
        }
    }

    private void addCollection(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object userId = session.getAttribute("userId");
        if(userId == null){
            req.getRequestDispatcher("user/login.jsp").forward(req,resp);
        }else{
            String goodsId = req.getParameter("goodsId");
            Collection collection = Collection.builder().build();
            collection.setGId(Integer.valueOf(goodsId));
            collection.setUId(Integer.valueOf(userId.toString()));
            Collection collection1 = collectionService.getCollection(collection);
            if(collection1 == null){
                collectionService.addCollection(collection);
            }else{
                collectionService.modifyCollection(collection);
            }
            getCollectionList(req, resp);
        }

    }
}
