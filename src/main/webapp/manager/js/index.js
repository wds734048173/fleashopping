function pageClick(k) {
	$(k).parent().find("div").removeClass("active");
	$(k).addClass("active");
	var text = $(k).text();
	$("#flTitle").text($(k).text());
    var url = "";
    if (text == "分类管理") {
        url = "/goodsClass.do?method=getGoodsClassListByCondition";
    } else if (text == "商品管理") {
        url = "/goods.do?method=getGoodsListByCondition";
    } else if (text == "订单管理") {
        url = "/order.do?method=getOrderListByCondition";
    } else if (text == "用户信息管理") {
        url = "/user.do?method=getUserListByCondition";
    } else if (text == "评价管理") {
        url = "/comment.do?method=getCommentListByCondition";
    }
    /*else if (text == "信息反馈管理"){
        url = "/reply.do?method=getReplylistByCondition";
    }*/
    $(".content").load(url);
}