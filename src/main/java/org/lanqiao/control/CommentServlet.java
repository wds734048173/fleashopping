package org.lanqiao.control;

import com.alibaba.fastjson.JSON;
import org.lanqiao.domain.Comment;
import org.lanqiao.domain.Condition;
import org.lanqiao.service.ICommentService;
import org.lanqiao.service.impl.CommentServiceImpl;
import org.lanqiao.utils.PageModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/comment.do")
public class CommentServlet extends HttpServlet {
    ICommentService commentService = new CommentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
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
            case "getCommentListByCondition":
                getCommentListByCondition(req,resp,null);
                break;
            case "deleteComment":
                try {
                    delComment(req, resp);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "getCommentById":
                try {
                    getCommentById(req,resp);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }

    }
    //通过commentId获取一条评语
    private void getCommentById(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int commentId = Integer.parseInt(req.getParameter("commentId"));
        Comment commentById = commentService.selectOne(commentId);
        PrintWriter out = resp.getWriter();
        String comment = JSON.toJSONString(commentById);
        out.print(comment);
    }


    //获取全部评语
    private void getCommentlist(HttpServletRequest req, HttpServletResponse resp) {
        List<Comment> commentList = commentService.getCommentList();
        req.setAttribute("commentList",commentList);
        try {
            req.getRequestDispatcher("manager/commentList.jsp").forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //删除
    public void delComment(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
        int commentId = Integer.valueOf(req.getParameter("bookId"));
        commentService.delComment(commentId);
        getCommentListByCondition(req,resp,"delete");
    }
    private void getCommentListByCondition(HttpServletRequest req, HttpServletResponse resp, String mark) {
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
        String searchCommentGrade = "-1";
        if(req.getParameter("searchCommentGrade") != null  || "-1".equals(req.getParameter("searchCommentGrade"))){
            searchCommentGrade = req.getParameter("searchCommentGrade");
        }
        Condition condition = new Condition();
        condition.setName(searchGoodsName);
        condition.setGrade(searchCommentGrade);
        int totalRecords = commentService.getCommentCountByCondition(condition);
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
        List<Comment> commentList= commentService.getCommentListByCondition(condition);
        req.setAttribute("currentPage",pageNum);
        pageModel.setRecords(commentList);
        req.setAttribute("pm",pageModel);
        req.setAttribute("condition",condition);
        req.setAttribute("commentList",commentList);
        try {
            req.getRequestDispatcher("manager/commentList.jsp").forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }




}
