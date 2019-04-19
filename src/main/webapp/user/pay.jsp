
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: lyj
  Date: 2018/12/8
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>结算页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="description" content=""/>
    <meta name="format-detection" content="telephone=no" />
    <link rel="stylesheet" type="text/css" href="../user/css/style.css">
    <link rel="stylesheet" href="../bootstrap/css/orderconfirm.css"/>
    <link rel="stylesheet" href="../bootstrap/css/tasp.css"/>
    <link rel="stylesheet" type="text/css" href="/user/css/index.css">
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
<%--页眉--%>
<header>
    <div class="top center">
        <div class="left fl">
            <ul>
                <li><a href="../user/index.jsp">首页</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="right fr">
            <%
                String realname = (String) session.getAttribute("realname");
            %>
            <div class="fr">
                <ul>
                    <li>欢迎您：<%=realname%></li>
                    <li>|</li>
                    <li><a href="/user.do?method=getMyInfo" target="_blank">个人中心</a></li>
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
                                <h4>${order.address}</h4> <br>
                                <h4>${order.realname} 收 <em>${order.telphone}</em></h4>
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
        <form id="J_Form" name="J_Form" action="/order.do?method=payOrder" method="post">
            <div>
                <h3 class="dib">确认订单信息</h3>
                <table cellspacing="0" cellpadding="0" class="order-table" id="J_OrderTable" summary="统一下单订单信息区域">
                    <caption style="display: none">统一下单订单信息区域</caption>
                    <thead>
                    <tr>
                        <th class="s-title">宝贝<hr/></th>
                        <th class="s-price">原价(元)<hr/></th>
                        <th class="s-price">销售价(元)<hr/></th>
                        <th class="s-amount">数量<hr/></th>
                        <th class="s-total">小计(元)<hr/></th>
                    </tr>
                    </thead>
                    <tbody data-spm="3" class="J_Shop" data-tbcbid="0" data-outorderid="47285539868"  data-isb2c="false" data-postMode="2" data-sellerid="1704508670">

                    <tr class="shop">
                        <td colspan="5">
                            店铺：<a class="J_ShopName J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.6" href="#" target="_blank" title="#">书籍是人类进步的阶梯</a>
                            <span class="seller">卖家：<a href="#" target="_blank" class="J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.15">高尔基</a></span>
                        </td>
                    </tr>
                    <input type="hidden" name="orderId" id="orderId" value="${order.id}">
                    <tr class="blue-line" style="height: 2px;"><td colspan="5"></td></tr>

                    <c:forEach begin="0" end="${orderInfoList.size()}" var="orderInfo" items="${orderInfoList}" step="1">
                        <tr class="item" data-lineid="19614514619:31175333266:35612993875" data-pointRate="0">
                            <td class="s-title">
                                <a href="#" target="_blank"  data-point-url="http://log.mmstat.com/buy.1.5">
                                    <img src="${orderInfo.gpic}" class="itempic"><span class="title J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.5">${orderInfo.gname}</span></a>
                                <div>
                                    <span style="color:gray;">卖家承诺72小时内发货</span>
                                </div>
                            </td>
                            <td class="s-price">
                              <span class='price '>
                                <em class="style-normal-small-black J_ItemPrice"  >${orderInfo.ypricereal}</em>
                              </span>
                            </td>
                            <td class="s-price">
                              <span class='price '>
                                <em class="style-normal-small-black J_ItemPrice"  >${orderInfo.spricereal}</em>
                              </span>
                            </td>
                            <td class="s-amount" data-point-url="">
                                <input type="hidden" class="J_Quantity" value="1" name="19614514619_31175333266_35612993875_quantity"/>1
                            </td>
                            <td class="s-total">
                               <span class='price '>
                                <em class="style-normal-bold-red ItemTotal ">${orderInfo.spricereal}</em>
                              </span>
                            </td>
                        </tr>
                    </c:forEach>

                    <tr class="blue-line" style="height: 2px;"><td colspan="5"></td></tr>

                    <tr class="shop-total">
                        <td colspan="5">店铺合计(<span class="J_Exclude" style="display: none">不</span>含运费<span class="J_ServiceText" style="display: none">，服务费</span>)：
                            <span class='price g_price '>
                             <span>&yen;</span><em class="style-middle-bold-red J_ShopTotal"  >${order.moneyreal}元</em>
                              </span>
                            <input type="hidden" name="1704508670:2|creditcard" value="false" />
                            <input type="hidden" id="J_IsLadderGroup" name="isLadderGroup" value="false"/>
                        </td>
                    </tr>
                    <tr class="blue-line" style="height: 2px;"><td colspan="5"></td></tr>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="5">
                            <div class="order-go" data-spm="4">
                                <div class="J_AddressConfirm address-confirm">
                                    <div class="kd-popup pop-back" style="margin-bottom: 40px;">
                                        <div class="box">
                                            <div class="bd">
                                                <div class="point-in">
                                                    <em class="t">实付款：</em>
                                                    <span class='price g_price '>
                                                     <span>&yen;</span><em class="style-large-bold-red"  id="J_ActualFee"  >${order.moneyreal}元</em>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <a id="J_Go" title="点击此按钮，确认付款。" class="btn btn-primary btn-warning active"><input type="submit" value="确认付款"/></a>
                                    </div>
                                </div>
                                <div class="msg" style="clear: both;">
                                    <p class="tips naked" style="float:right;padding-right: 0">若价格变动，请在提交订单后联系卖家改价，并查看已买到的宝贝</p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr class="blue-line" style="height: 2px;"><td colspan="5"></td></tr>
                    </tfoot>
                </table>
            </div>
        </form>
    </div>
</div>
<div style="text-align:center;">
</div>

<%--页脚--%>
<div class="footer">
    <div class="footer-content">
        <div class="w1200">
            <div class="footet-jiesao clearfix">
                <div class="fl footer-logo-box">
                    <img src="/user/imges/new_logo.png" class="footer-logo">
                    <span class="footer-slogan">买书看书 · 不求人</span>
                </div>
                <div class="fl footer-function">
                    <a href="#" rel="nofollow">关于我们</a>
                    <a href="#" rel="nofollow">用户协议</a>
                    <a href="#" rel="nofollow">最新信息</a>
                    <a href="#" rel="nofollow">意见反馈</a>
                </div>
                <div class="fr footer-kefu">
                    <a href="javascript:void(0)" rel="nofollow" class="lxkf">
                        <i class="iconfont">&#xe601;</i>
                        立即联系
                    </a>
                    <a rel="nofollow">
                        <i class="iconfont">&#xe61a;</i>
                        021-61097639
                    </a>
                </div>
            </div>
        </div>
        <div class="w1200">
            <p class="footer-bottom-size">© 2018 在线买书 晋ICP备17020445号-1
                <span id="exec_time"></span>|
                <span id="load_time"></span>
                <a class="shgongshang" rel="nofollow" href="#">
                    <img src="" alt="">山西工商</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>

