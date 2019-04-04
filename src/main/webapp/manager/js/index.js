function pageClick(k) {
	$(k).parent().find("div").removeClass("active");
	$(k).addClass("active");
	var text = $(k).text();
	$("#flTitle").text($(k).text());
    var url = "";
    if (text == "分类管理") {
        url = "/bookType.do?method=getBookTypelist";
    } else if (text == "订单管理") {
        url = "/order.do?method=getOrderlist";
    } else if (text == "图书信息管理") {
        url = "/book.do?method=getBooklist";
    } else if (text == "管理员信息管理") {
        url = "/manager.do?method=getManagerList";
    } else if (text == "客户信息管理") {
        url = "/customer.do?method=getCustomerlist";
    } else if (text == "评价信息") {
        url = "/comment.do?method=getCommentlist";
    } else if (text == "信息反馈"){
        url = "/reply.do?method=getReplylist";
    }
    $(".content").load(url);
}