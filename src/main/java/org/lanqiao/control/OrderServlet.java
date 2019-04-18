package org.lanqiao.control;

import org.lanqiao.domain.Condition;
import org.lanqiao.domain.Order;
import org.lanqiao.domain.OrderInfo;
import org.lanqiao.service.IOrderService;
import org.lanqiao.service.impl.OrderServiceImpl;
import org.lanqiao.utils.PageModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:12
 * @Description:
 */
@WebServlet("/order.do")
public class OrderServlet extends HttpServlet {

    IOrderService orderService = new OrderServiceImpl();
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
            case "getOrderListByCondition":
                getOrderListByCondition(req,resp,"");
                break;
            case "getOrderInfo":
                getOrderInfo(req,resp);
                break;
            case "updateOrderState":
                updateOrderState(req,resp);
                break;
        }
    }

    private void updateOrderState(HttpServletRequest req, HttpServletResponse resp) {
        int orderId = Integer.valueOf(req.getParameter("orderId"));
        int state = Integer.valueOf(req.getParameter("state"));
        orderService.updateOrderState(orderId,state);
        getOrderListByCondition(req,resp,"update");
    }

    private void getOrderInfo(HttpServletRequest req, HttpServletResponse resp) {
        int orderId = Integer.valueOf(req.getParameter("orderId"));
        //获取订单列表的详细信息
        Order order = orderService.getOrderById(orderId);
        //获取订单子表信息
        List<OrderInfo> orderInfoList = orderService.getOrderInfoList(orderId);
        req.setAttribute("order",order);
        req.setAttribute("orderInfoList",orderInfoList);
        try {
            req.getRequestDispatcher("/manager/orderInfo.jsp").forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getOrderListByCondition(HttpServletRequest req, HttpServletResponse resp, String s) {
        int pageNum = 1;
        if(req.getParameter("currentPage") != null){
            pageNum = Integer.valueOf(req.getParameter("currentPage"));
        }
        int pageSize = 5;
        if(req.getParameter("pageSize") != null){
            pageSize = Integer.valueOf(req.getParameter("pageSize"));
        }

        //查询条件
        String searchOrderNo = "";
        if(req.getParameter("searchOrderNo") != null){
            searchOrderNo = req.getParameter("searchOrderNo");
        }
        String searchOrderState = "";
        if(req.getParameter("searchOrderState") != null){
            searchOrderState = req.getParameter("searchOrderState");
        }
        Condition condition = new Condition();
        condition.setOrderNo(searchOrderNo);
        condition.setState(searchOrderState);
        int totalRecords = orderService.getOrderCount(condition);
        //不同操作，不同的当前页设置
        PageModel pm = new PageModel(pageNum,totalRecords,pageSize);
        //如果当前页大于总页数，但是排除查询不到数据的情况。当前页等于最大页
        if(pageNum > pm.getTotalPageNum() && pm.getTotalPageNum() != 0){
            pageNum = pm.getTotalPageNum();
        }

        PageModel pageModel = new PageModel(pageNum,totalRecords,pageSize);
        //分页条件封装
        condition.setCurrentPage(pageModel.getStartIndex());
        condition.setPageSize(pageModel.getPageSize());
        List<Order> orderList = orderService.getOrderList(condition);
        req.setAttribute("currentPage",pageNum);
        pageModel.setRecords(orderList);
        req.setAttribute("pm",pageModel);
        req.setAttribute("condition",condition);
        req.setAttribute("orderList",orderList);
        try {
            req.getRequestDispatcher("manager/orderList.jsp").forward(req,resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
