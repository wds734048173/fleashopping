package org.lanqiao.control;

import com.alibaba.fastjson.JSON;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Goods;
import org.lanqiao.domain.GoodsClass;
import org.lanqiao.service.IGoodsService;
import org.lanqiao.service.impl.GoodsServiceImpl;
import org.lanqiao.utils.DataMap;
import org.lanqiao.utils.PageModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:11
 * @Description:
 */
@WebServlet("/goods.do")
public class GoodsServlet extends HttpServlet {
    IGoodsService goodsService = new GoodsServiceImpl();
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
            case "getGoodsListByCondition":
                getGoodsListByCondition(req,resp,"");
                break;
            case "DownGoodsById":
                DownGoodsById(req,resp);
                break;
            //后端获取详情
            case "getGoodsById":
                getGoodsById(req,resp);
                break;
            //前端获取详情
            case "detail":
                detail(req,resp);
                break;
        }
    }

    private void detail(HttpServletRequest req, HttpServletResponse resp) {
        String goodsId = req.getParameter("goodsId");
        //根据goodsId获取商品详情
        Goods goods = goodsService.getGoodsById(Integer.parseInt(goodsId));
        req.setAttribute("goods",goods);
        try {
            req.getRequestDispatcher("user/detail.jsp").forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getGoodsById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String goodsId = req.getParameter("goodsId");
        Goods goods = goodsService.getGoodsById(Integer.valueOf(goodsId));
        try {
            PrintWriter out = resp.getWriter();
            String goodsJson = JSON.toJSONString(goods);
            out.print(goodsJson);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void DownGoodsById(HttpServletRequest req, HttpServletResponse resp) {
        int goodsId = Integer.valueOf(req.getParameter("goodsId"));
        goodsService.downGoodsById(goodsId);
        getGoodsListByCondition(req,resp,"update");
    }

    private void getGoodsListByCondition(HttpServletRequest req, HttpServletResponse resp, String mark) {
        int pageNum = 1;
        if(req.getParameter("currentPage") != null){
            pageNum = Integer.valueOf(req.getParameter("currentPage"));
        }
        int pageSize = 5;
        if(req.getParameter("pageSize") != null){
            pageSize = Integer.valueOf(req.getParameter("pageSize"));
        }

        //查询条件
        String searchGoodsName = "";
        if(req.getParameter("searchGoodsName") != null){
            searchGoodsName = req.getParameter("searchGoodsName");
        }
        String searchGoodsClassId = "-1";
        if(req.getParameter("searchGoodsClassId") != null || "-1".equals(req.getParameter("searchGoodsClassId"))){
            searchGoodsClassId = req.getParameter("searchGoodsClassId");
        }
        String searchGoodsState = "-1";
        if(req.getParameter("searchGoodsState") != null  || "-1".equals(req.getParameter("searchGoodsState"))){
            searchGoodsState = req.getParameter("searchGoodsState");
        }
        Condition condition = new Condition();
        condition.setName(searchGoodsName);
        condition.setGoodsClassId(searchGoodsClassId);
        condition.setState(searchGoodsState);
        int totalRecords = goodsService.getGoodsCountByCondition(condition);
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
        List<Goods> goodsList = goodsService.getGoodsListByCondition(condition);
        req.setAttribute("currentPage",pageNum);
        pageModel.setRecords(goodsList);
        req.setAttribute("pm",pageModel);
        req.setAttribute("condition",condition);
        req.setAttribute("goodsList",goodsList);
        try {
            req.getRequestDispatcher("manager/goodsList.jsp").forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
