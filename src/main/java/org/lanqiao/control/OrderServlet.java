package org.lanqiao.control;

import com.sun.org.apache.xpath.internal.operations.Or;
import org.lanqiao.domain.*;
import org.lanqiao.service.IGoodsClassService;
import org.lanqiao.service.IGoodsService;
import org.lanqiao.service.IOrderService;
import org.lanqiao.service.impl.GoodsServiceImpl;
import org.lanqiao.service.impl.OrderServiceImpl;
import org.lanqiao.utils.PageModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Auther: WDS
 * @Date: 2019/4/4 19:12
 * @Description:
 */
@WebServlet("/order.do")
public class OrderServlet extends HttpServlet {

    IOrderService orderService = new OrderServiceImpl();
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
            case "getOrderListByCondition":
                getOrderListByCondition(req,resp,"");
                break;
            case "getOrderInfo":
                getOrderInfo(req,resp);
                break;
            case "updateOrderState":
                updateOrderState(req,resp);
                break;
                //为前端下单做准备，需要的是商品id和用户id，查询收货信息，商品详情，在跳转的页面进行订单确认！
            case "placeOrder":
                placeOrder(req,resp);
                break;
            case "createOrder":
                createOrder(req,resp);
                break;
            case "payOrder":
                payOrder(req,resp);
                break;
        }
    }

    private void payOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object userId = session.getAttribute("userId");
        if(userId == null){
            req.getRequestDispatcher("user/login.jsp").forward(req,resp);
        }else{
            String orderId = req.getParameter("orderId");
            orderService.updateOrderState(Integer.valueOf(orderId),2);

            //跳转到订单页面，获取订单列表（按创建时间倒排）
            List<Order> orderList = orderService.getOwnBuyerOrderList(Integer.valueOf(userId.toString()));
            req.setAttribute("orderList",orderList);
            req.getRequestDispatcher("user/orderBuyerList.jsp").forward(req,resp);
        }
    }

    private void createOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object userId = session.getAttribute("userId");
        if(userId == null){
            req.getRequestDispatcher("user/login.jsp").forward(req,resp);
        }else{
            String goodsId = req.getParameter("goodsId");
            //二手市场只能购买一个商品，一件商品
            Order order = Order.builder().build();
            List<OrderInfo> orderInfoList = new ArrayList<>();
            SimpleDateFormat sdf =new SimpleDateFormat("yyyyMMddHHmmss");
            String orderNo = "O" + sdf.format(new Date());
            order.setNo(orderNo);
            order.setFreight(1000);//运费10元
            order.setState(1);//未付款

            //收货人地址等信息(地址默认是用户注册时候的地址)
            order.setTelphone(session.getAttribute("telphone").toString());
            order.setAddress(session.getAttribute("address").toString());
            order.setRealname(session.getAttribute("realname").toString());

            order.setBid(Integer.valueOf(userId.toString()));//购买人id
            Goods goods = goodsService.getGoodsById(Integer.valueOf(goodsId));
            order.setSid(goods.getUId());//销售人id
            order.setMoney(goods.getSprice() + 1000);
            order.setPrice(goods.getSprice());
            order.setType(1);
            OrderInfo orderInfo = OrderInfo.builder().build();
            orderInfo.setGId(Integer.valueOf(goodsId));
            orderInfo.setGname(goods.getName());
            orderInfo.setYprice(goods.getYprice());
            orderInfo.setSprice(goods.getSprice());
            orderInfo.setGpic(goods.getPic());
            orderInfo.setNum(1);//二手数量默认为1
            orderInfoList.add(orderInfo);
            orderService.addOrder(order,orderInfoList);

            //通过用户id查询最新订单，并返回数据
            Order order1 = orderService.getOrderByUId(Integer.valueOf(userId.toString()));
            //通过id获取订单子表信息
            List<OrderInfo> orderInfoList1 = orderService.getOrderInfoList(order1.getId());
            req.setAttribute("order",order1);
            req.setAttribute("orderInfoList",orderInfoList1);
            req.getRequestDispatcher("user/pay.jsp").forward(req,resp);
        }
    }

    private void placeOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object userId = session.getAttribute("userId");
        if(userId == null){
            req.getRequestDispatcher("user/login.jsp").forward(req,resp);
        }else{
            String goodsId = req.getParameter("goodsId");
            Goods goods = goodsService.getGoodsById(Integer.valueOf(goodsId));
            req.setAttribute("goods",goods);
            req.getRequestDispatcher("user/placeOrder.jsp").forward(req,resp);
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
