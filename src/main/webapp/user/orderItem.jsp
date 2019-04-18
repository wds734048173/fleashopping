<%@ page import="org.lanqiao.domain.OrderItem" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/11/011
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单详情</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="description" content=""/>
    <meta name="format-detection" content="telephone=no" />
    <link rel="stylesheet" type="text/css" href="../sale/css/style.css">
    <link rel="stylesheet" href="../bootstrap/css/orderconfirm.css"/>
    <link rel="stylesheet" href="../bootstrap/css/tasp.css"/>
    <link rel="stylesheet" type="text/css" href="../sale/css/style.css">
    <link rel="stylesheet" href="../bootstrap/css/orderconfirm.css"/>
    <link rel="stylesheet" href="../bootstrap/css/tasp.css"/>
    <script type="text/javascript">
        $(function () {

        })
    </script>
    <style>
        #page{width:auto;}
        #comm-header-inner,#content{width:950px;margin:auto;}
        #logo{padding-top:26px;padding-bottom:12px;}
        #header .wrap-box{margin-top:-67px;}
        #logo .logo{position:relative;overflow:hidden;display:inline-block;width:140px;height:35px;font-size:35px;line-height:35px;color:#f40;}
        #logo .logo .i{position:absolute;width:140px;height:35px;top:0;left:0;background:url(http://a.tbcdn.cn/tbsp/img/header/logo.png);}
    </style>

</head>
<body data-spm="1">
    <header>
        <div class="top center">
            <div class="left fl">
                <ul>
                    <%--点击进入反馈页面--%>
                    <li><a href="">问题反馈</a></li>
                    <div class="clear"></div>
                </ul>
            </div>
            <div class="right fr">
                <%
                    String name = (String) session.getAttribute("name");
                %>
            <div class="gouwuche fr"><a href="sale/pay.jsp">我的订单</a></div>
            <div class="fr">
                <ul>
                    <li>欢迎您：<%=name%></li>
                    <li>|</li>
                    <li><a href="/logout.do">退出登录</a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </header>

    <div id="page">

        <div id="" class="grid-c" style="width: 90%;margin: auto">

            <div id="address" class="address" style="margin-top: 20px;" data-spm="2">
                <form name="addrForm" id="addrForm" action="#" style="height: 100px">
                    <h3>收货地址</h3>
                    <ul id="address-list" class="address-list">
                        <li class="J_Addr J_MakePoint clearfix  J_DefaultAddr "  >
                            <s class="J_Marker marker"></s>
                            <span class="marker-tip">寄送至</span>
                            <div class="address-info">
                                <label  class="user-address">
                                    <h4><%=session.getAttribute("CustomerAddr")%></h4> <br>
                                    <h4><%=name%> 收 <em><%=session.getAttribute("CustomerTel")%></em></h4>
                                </label>
                            </div>
                        </li>
                        <li class="J_Addr J_MakePoint clearfix"
                            data-point-url="http://log.mmstat.com/buy.1.20" >
                            <s class="J_Marker marker"></s>
                            <div class="address-info">
                            </div>
                        </li>
                    </ul>
                    <ul id="J_MoreAddress" class="address-list hidden">
                    </ul>
                </form>
            </div>
            <form id="J_Form" name="J_Form" action="/order.do?method=createOrder" method="post">
                <div>
                    <h3 class="dib">确认订单信息</h3>
                    <table cellspacing="0" cellpadding="0" class="order-table" id="J_OrderTable" summary="统一下单订单信息区域">
                        <caption style="display: none">统一下单订单信息区域</caption>
                        <thead>
                        <tr>
                            <th class="s-title">店铺宝贝<hr/></th>
                            <th class="s-price">单价(元)<hr/></th>
                            <th class="s-amount">数量<hr/></th>
                            <th class="s-agio">优惠方式(元)<hr/></th>
                            <th class="s-total">小计(元)<hr/></th>
                        </tr>
                        </thead>
                        <tbody data-spm="3" class="J_Shop" data-tbcbid="0" data-outorderid="47285539868"  data-isb2c="false" data-postMode="2" data-sellerid="1704508670">
                        <tr class="first">
                            <td colspan="5"></td></tr>
                        <tr class="shop blue-line">
                            <td colspan="3">
                                店铺：<a class="J_ShopName J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.6" href="#"
                                      target="_blank" title="#">书籍是人类进步的阶梯</a>
                                <span class="seller">卖家：<a href="#" target="_blank" class="J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.15">高尔基</a></span>
                                <span class="J_WangWang"  data-nick="淘米魅"   data-display="inline" ></span>
                            </td>
                            <td colspan="2" class="promo">
                                <div>
                                    <ul class="scrolling-promo-hint J_ScrollingPromoHint">
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <%
                            List<OrderItem> cartItems = (List<OrderItem>) request.getAttribute("cartItems");
                            for (OrderItem item:cartItems){
                        %>
                        <tr class="item" data-lineid="19614514619:31175333266:35612993875" data-pointRate="0">
                            <td class="s-title">
                                <a href="#" target="_blank"  data-point-url="http://log.mmstat.com/buy.1.5">
                                    <img src="<%=item.getBookPic()%>" class="itempic"><span class="title J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.5"><%=item.getBookName()%></span></a>

                                <div class="props">
                                    <span><%=item.getBookId()%></span>
                                    <span><%=item.getNum()%>本</span>
                                </div>
                                <%--<a  href="#" target="_blank">--%>
                                    <%--<img src="<%=item.%>"/>--%>
                                <%--</a>--%>
                                <div>
                                    <span style="color:gray;">卖家承诺72小时内发货</span>
                                </div>
                            </td>
                            <td class="s-price">

                              <span class='price '>
                             <em class="style-normal-small-black J_ItemPrice"  ><%=item.getPrice()%></em>
                              </span>
                                <input type="hidden" name="costprice" value="630.00" class="J_CostPrice" />
                            </td>
                            <td class="s-amount" data-point-url="">
                                <input type="hidden" class="J_Quantity" value="1" name="19614514619_31175333266_35612993875_quantity"/>1

                            </td>
                            <td class="s-agio">
                                <div class="J_Promotion promotion" data-point-url="">打折</div>
                            </td>
                            <td class="s-total">

                               <span class='price '>
                             <em class="style-normal-bold-red ItemTotal "><%=item.getPrice()*item.getNum()%></em>
                              </span>
                                <input id="furniture_service_list_b_47285539868" type="hidden" name="furniture_service_list_b_47285539868"/>
                            </td>
                        </tr>
                        <%
                            }
                        %>


                        <tr class="item-service">
                            <td colspan="5" class="servicearea" style="display: none"></td>
                        </tr>

                        <tr class="blue-line" style="height: 2px;"><td colspan="5"></td></tr>

                        <tr class="shop-total blue-line">
                            <td colspan="5">店铺合计(<span class="J_Exclude" style="display: none">不</span>含运费<span class="J_ServiceText" style="display: none">，服务费</span>)：
                                <span class='price g_price '>
                                 <span>&yen;</span><em class="style-middle-bold-red J_ShopTotal"  ><%=request.getParameter("total")%></em>
                                  </span>
                                <input type="hidden" name="1704508670:2|creditcard" value="false" />
                                <input type="hidden" id="J_IsLadderGroup" name="isLadderGroup" value="false"/>

                            </td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="5">

                                <div class="order-go" data-spm="4">
                                    <div class="J_AddressConfirm address-confirm">
                                        <div class="kd-popup pop-back" style="margin-bottom: 40px;">
                                            <a href="/order.do?method=getOrderAll"
                                               class="back J_MakePoint" target="_top"
                                               data-point-url="" style="width: 100px;">返回订单中心</a>
                                            <%--<a id="J_Go"   title="点击此按钮，确认付款。" class="btn btn-primary btn-warning active"><input type="submit" value="确认付款"/></a>--%>
                                        </div>
                                    </div>

                                    <div class="J_confirmError confirm-error">
                                        <div class="msg J_shopPointError" style="display: none;"><p class="error">积分点数必须为大于0的整数</p></div>
                                    </div>


                                    <div class="msg" style="clear: both;">
                                        <p class="tips naked" style="float:right;padding-right: 0">若价格变动，请在提交订单后联系卖家改价，并查看已买到的宝贝</p>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tfoot>

                    </table>
                </div>
            </form>
        </div>
        <div id="footer"></div>
    </div>
    <div style="text-align:center;">
    </div>
</body>
</html>
