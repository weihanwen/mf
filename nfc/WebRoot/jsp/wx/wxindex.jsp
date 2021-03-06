<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>点餐</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="css/wx/labary/predefine.css">
    <link rel="stylesheet" href="css/wx/labary/swiper.min.css">
	<link rel="stylesheet" href="css/wx/style.css">
</head>
<body>
<nav class="top">
	<div>点餐</div>
</nav>
<section class="onesection">
 	<div class="lunboclass">
		<!-- 轮播图 -->
		<div class="swiper-container swiper-container_2">
			<div class="swiper-wrapper" >
				 <c:forEach items="${lunboList}" var="var">
				 	<c:choose>
				 		<c:when test="${var.link_type eq '2'}"><div class='swiper-slide'><a href="${var.link_content}"><img src="${var.image_url}" style="height:100px;"></a></div></c:when>
				 		<c:when test="${var.link_type eq '3'}"><div class='swiper-slide'><a href="wxmember/godetailBygoods.do?lunch_id=${var.link_content}"><img src="${var.image_url}" style="height:100px;"></a></div></c:when>
				 		<c:otherwise><div class='swiper-slide'><a><img src="${var.image_url}" style="height:100px;"> </a></div></c:otherwise>
				 	</c:choose>
 				 </c:forEach>
 			  </div>
			<div class="swiper-pagination swiper-pagination_2"></div>
		</div>
	</div>
    
	<!--大类类别-->
     <div class="bigsort" >
	      	<c:forEach items="${leibieList}" var="var" varStatus="vs">
	      		<div onclick="changeShoyLb('${var.category_id}',this)"  class="notchangediv">
							<img src="${var.image_url}"/>
							<span>${var.title}</span>
				</div>
        	</c:forEach>
 	</div>
	
	<!--商品循环-->
	<div class="allgoods">
		 
 	</div>
 	
</section>
<footer class="footerdi guding clf">
	<ul>
		<li class="f_whole">
			<a style=" color: #72c4f9; " href="wxmember/wxindex.do">
				<i class="cur"></i>
				点餐
			</a>
		</li>
		<li class="f_jiexiao">
			<a href="wxmember/yuding.do">
				<i></i>
				预定
			</a>
		</li>
		<li class="f_personal">
 			<a href="wxmember/gome.do">
				<i></i>
				我的
			</a>
		</li>
	</ul>
</footer>
</body>
<script src="js/wx/library/jquery-1.12.4.min.js"></script>
<script src="js/wx/library/swiper.min.js"></script>
<script src="js/wx/tongyong.js"></script>
<script type="text/javascript">
//页面加载后执行
$(function(){
	 //构造轮播  图片
	 var swiper = new Swiper('.swiper-container_2', {
	    pagination: '.swiper-pagination_2',
	    paginationClickable: true,
	    autoplay : 5000,
	    loop:true
	 });
	 $(".bigsort").find("div").eq(0).click();
	 
});
//获取商品
function changeShoyLb(category_id,obj){
	$(".notchangediv").removeClass("changediv");
	$(obj).addClass("changediv");
  	$.ajax({
		type:"post",
			url:"wxmember/getLunchList.do",
			data:{ "category_id":category_id ,"order_type":"1" },
			dataType:"json",
			success:function(data){
				 var lunchList=data.data;
				 $(".allgoods").empty();
				 for (var i = 0; i < lunchList.length; i++) {
					 var s="<div class='goodsshow' onclick='goDetail(this,1)' lunch_id='"+lunchList[i].lunch_id+"' category_id='"+lunchList[i].category_id+"' >"+
								"<div class='one'>"+
									"<img src='"+lunchList[i].index_images+"' style=height:187px;' />"+
									"<div class='two'>"+
									"<span style='text-decoration: line-through;'>"+lunchList[i].show_sale_money+"</span><span style='font-size:15px;'>"+lunchList[i].sale_money+"</span> 赠积分"+lunchList[i].send_integral+"分 <span>到手价："+lunchList[i].daoshoumoney+"元</span> 仅剩"+lunchList[i].dc_stocknumber+"份"+
									"</div>"+
								"</div>"+
							"</div>";
					$(".allgoods").append(s);
				 }
			}
	});  
}
//前往详情
function goDetail(obj,order_type){
	window.location.href="wxmember/godetailBygoods.do?lunch_id="+$(obj).attr("lunch_id")+"&order_type="+order_type+"&category_id="+$(obj).attr("category_id");
}

</script>
</html>