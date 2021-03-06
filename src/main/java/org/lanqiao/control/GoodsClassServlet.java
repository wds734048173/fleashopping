package org.lanqiao.control;

import com.alibaba.fastjson.JSON;
import org.lanqiao.domain.Condition;
import org.lanqiao.domain.GoodsClass;
import org.lanqiao.service.IGoodsClassService;
import org.lanqiao.service.impl.GoodsClassServiceImpl;
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

/**
 * @Auther: WDS
 * @Date: 2019/4/4 23:07
 * @Description:
 */
@WebServlet("/goodsClass.do")
public class GoodsClassServlet extends HttpServlet {
    IGoodsClassService goodsClassService = new GoodsClassServiceImpl();

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
            case "getGoodsClassListByCondition":
                getGoodsClassListByCondition(req,resp,"");
                break;
            case "getGoodsClassById":
                getGoodsClassById(req,resp);
                break;
            case "addGoodsClass":
                addGoodsClass(req,resp);
                break;
            case "deleteGoodsClassById":
                deleteGoodsClassById(req,resp);
                break;
            case "getGoodsClassListForSelect":
                getGoodsClassListForSelect(req,resp);
                break;
        }
    }

    private void getGoodsClassListForSelect(HttpServletRequest req, HttpServletResponse resp) {
        List<GoodsClass> goodsClassList = goodsClassService.getGoodsClassListForSelect();
        try {
            PrintWriter out = resp.getWriter();
            String goodsClassListJson = JSON.toJSONString(goodsClassList);
            out.print(goodsClassListJson);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteGoodsClassById(HttpServletRequest req, HttpServletResponse resp) {
        int goodsClassId = Integer.valueOf(req.getParameter("goodsClassId"));
        goodsClassService.deleteGoodsClassById(goodsClassId);
        getGoodsClassListByCondition(req,resp,"delete");
    }

    private void addGoodsClass(HttpServletRequest req, HttpServletResponse resp) {
        String mark = null;
        GoodsClass goodsClass = new GoodsClass();
        String goodsClassName = req.getParameter("goodsClassName");
        goodsClass.setName(goodsClassName);
        String goodsClassId = req.getParameter("goodsClassId");
        if(goodsClassId == null || "".equals(goodsClassId)){
            mark = "add";
            goodsClassService.addGoodsClass(goodsClass);
        }else{
            mark = "update";
            goodsClass.setId(Integer.valueOf(goodsClassId));
            goodsClassService.modifyGoodsClass(goodsClass);
        }
        getGoodsClassListByCondition(req, resp, mark);
    }

    private void getGoodsClassById(HttpServletRequest req, HttpServletResponse resp) {
        int goodsClassId = Integer.valueOf(req.getParameter("goodsClassId"));
        GoodsClass goodsClass = goodsClassService.getGoodsClassById(goodsClassId);
        try {
            PrintWriter out = resp.getWriter();
            String bookTypeJson = JSON.toJSONString(goodsClass);
            out.print(bookTypeJson);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getGoodsClassListByCondition(HttpServletRequest req, HttpServletResponse resp,String mark) {
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
        Condition condition = new Condition();
        condition.setName(searchName);
        int totalRecords = goodsClassService.getGoodsClassCountByCondition(condition);
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
        List<GoodsClass> goodsClassList = goodsClassService.getGoodsClassListByCondition(condition);
        req.setAttribute("currentPage",pageNum);
        pageModel.setRecords(goodsClassList);
        req.setAttribute("pm",pageModel);
        req.setAttribute("condition",condition);
        req.setAttribute("goodsClassList",goodsClassList);
        try {
            req.getRequestDispatcher("manager/goodsClassList.jsp").forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
