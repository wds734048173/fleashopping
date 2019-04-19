package org.lanqiao.control;

import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Goods;
import org.lanqiao.domain.GoodsClass;
import org.lanqiao.service.IGoodsClassService;
import org.lanqiao.service.IGoodsService;
import org.lanqiao.service.impl.GoodsClassServiceImpl;
import org.lanqiao.service.impl.GoodsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/home.do")
public class HomeServlet extends HttpServlet {
    IGoodsClassService goodsClassService = new GoodsClassServiceImpl();
    IGoodsService goodsService = new GoodsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method=req.getParameter("method");
        switch (method){
            case "homeList":
                getHomeList(req,resp);
                break;
            case "bookList":
                getBookList(req, resp);
                break;
        }
    }



    private void getHomeList(HttpServletRequest req, HttpServletResponse resp){

        List<Goods> goodsList = goodsService.getGoodsListAll(null);
        Condition condition= new Condition();
        condition.setName(null);
        condition.setCurrentPage(0);
        condition.setPageSize(10);
        List<GoodsClass> goodsClassList = goodsClassService.getGoodsClassList();

        req.setAttribute("goodsList",goodsList);
        req.setAttribute("goodsClassList",goodsClassList);
        //获取商品列表是5的倍数，向上取整
        int titleCount = 0;
        if(goodsList.size() % 5 != 0){
            titleCount = goodsList.size()/5 + 1;
        }else{
            titleCount = goodsList.size()/5;
        }
        req.setAttribute("titleCount",titleCount);
        try {
            req.getRequestDispatcher("user/home.jsp").forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getBookList(HttpServletRequest req, HttpServletResponse resp) {
        //根据商品分类id获取商品列表
        String goodsClassId =  req.getParameter("goodsClassId");
        Condition condition = new Condition();
        condition.setGoodsClassId(goodsClassId);
        List<Goods> goodsList = goodsService.getGoodsListAll(condition);
        req.setAttribute("goodsList",goodsList);
        //获取商品列表是5的倍数，向上取整
        int titleCount = 0;
        if(goodsList.size() % 5 != 0){
            titleCount = goodsList.size()/5 + 1;
        }else{
            titleCount = goodsList.size()/5;
        }
        req.setAttribute("titleCount",titleCount);
        try {
            req.getRequestDispatcher("user/goodsList.jsp").forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
