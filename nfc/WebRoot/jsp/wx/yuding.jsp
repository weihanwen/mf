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
    <title>预定</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="css/wx/labary/predefine.css">
    <link rel="stylesheet" href="css/wx/labary/swiper.min.css">
	<link rel="stylesheet" href="css/wx/style.css">
	<style type="text/css">
 
	.ydinfor .three{
		    width: 30%;
		    background-color: #079607;
		    height: 55px;
		    text-align: center;
		    line-height: 26px;
		    font-size: 8px;
		    color: #fff;
		    float: left;
		    margin-left: 9px;
	}
	
	
	</style>
</head>
<body>
<nav class="top">
	<div>预定</div>
</nav>
<section class="onesection">
	 <!--大类类别-->
     <div class="bigsort" >
      	<c:forEach items="${leibieList}" var="var" varStatus="vs">
      		    <div onclick="changeShoyLb('${var.category_id}',this)"  class="notchangediv">
							<img src="${var.image_url}"/>
							<span>${var.title}</span>
				</div>
       	</c:forEach>
 	</div>
		 	
		 	
		 	
		 			<div class="ydinfor">
		 				<c:forEach items="${ydList}" var="daypd">
		 				   <div class="three"  onclick="changeYdLunch('${daypd.scheduled_time_id}',this)">
				      	 		<span>  今日 ${daypd.time_name} </span><br>
				      	 		<span>${daypd.day} ${daypd.week} </span>
 				      	 	</div>
		 				</c:forEach>	 
				 	</div> 
				 	<div style="width:100%;height:65px;text-align: center;display: none;" class="nolunch">
		 				<img src="images/fl_d.png" >
		 			</div>
		 	<%-- <c:choose>
		 		<c:when test="${!empty daypd}">
		 			<!--预定说明-->
				 	 <div class="ydinfor">
				      	 	<div class="two">
				      	 		<span>当前可预定${daypd.day}（${daypd.week}）中午美味便当</span><br>
				      	 		<span>可预定时间${daypd.yd_starttime}至${daypd.yd_endtime}</span><br>
				      	 		<span>销售时段：${daypd.sale_starttime } - ${daypd.sale_endtime } </span>
				      	 	</div>
				 	</div>
				 	
				 	<div class="ydinfor" onclick="changeYdLunch('')">
				      	 	<div class="three">
				      	 		<span>  今日 中午 </span><br>
				      	 		<span>${daypd.day} ${daypd.week} </span>
 				      	 	</div>
 				      	 	
 				      	 	<div class="three">
				      	 		<span>  今日 中午 </span><br>
				      	 		<span>${daypd.day} ${daypd.week} </span>
 				      	 	</div>
 				      	 	
 				      	 	<div class="three">
				      	 		<span>  今日 中午 </span><br>
				      	 		<span>${daypd.day} ${daypd.week} </span>
 				      	 	</div>
				 	</div> 
				 	
				 	 
				 	
		  		</c:when>
		 		<c:otherwise>
		 			<div style="width:100%;height:65px;text-align: center;">
		 				<img src="images/fl_d.png" >
		 			</div>
		  		</c:otherwise>
		 	</c:choose> --%>
 			<!--商品循环-->
			<div class="allgoods">
		 		 <!-- <div class="ydgoods" >
				 		<img alt="" src="images/2.jpg"   />
				 		<span >西红柿炒鸡蛋</span>
		 		 		<span >20份可预订</span>
				 		<span >66元/份</span>
				 </div> -->
		  	</div>
 </section>
<footer class="footerdi guding clf">
	<ul>
		<li class="f_whole">
			<a  href="wxmember/wxindex.do">
				<i ></i>
				点餐
			</a>
		</li>
		<li class="f_jiexiao">
			<a style=" color: #72c4f9; " href="wxmember/yuding.do">
				<i class="cur"></i>
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
<script src="js/wx/tongyong.js"></script>
<script type="text/javascript">

//页面加载后执行
$(function(){
 	 $(".bigsort").children("div").eq(0).click();
});

//更换预定类别
function changeYdLunch(scheduled_time_id,obj){
	$(".three").css("background-color","#079607");
	$(obj).css("background-color","#af2222");
	$(".nolunch").hide();
	$.ajax({
		type:"post",
			url:"wxmember/getLunchList.do",
			data:{ "category_id":window_category_id ,"order_type":"2","scheduled_time_id":scheduled_time_id},
			dataType:"json",
			success:function(data){
				 var lunchList=data.data;
				 $(".allgoods").empty();
				 for (var i = 0; i < lunchList.length; i++) {
					 var s="<div class='ydgoods' onclick='goPay(this)' lunch_id='"+lunchList[i].lunch_id+"' category_id='"+lunchList[i].category_id+"' scheduled_time_id='"+scheduled_time_id+"' >"+
								 		"<img alt='' src='"+lunchList[i].yd_images+"'   />"+
							 		"<span>"+lunchList[i].lunch_name+"</span>"+
					 		 		"<span >"+lunchList[i].sale_money+"元/份</span>"+//<span>"+lunchList[i].yd_stocknumber+"份可预订</span>
							 "</div>";
					$(".allgoods").append(s);
				 }  
			}
	});  
}

var window_category_id="";
//获取商品
function changeShoyLb(category_id,obj){
	$(".notchangediv").removeClass("changediv");
	$(obj).addClass("changediv");
	 window_category_id=category_id;
	 if($(".ydinfor").children(".three").length > 0){
		 $(".ydinfor").children(".three").eq(0).click();
		 $(".nolunch").hide();
	 }else{
		 $(".nolunch").show();
	 }
}
//前往支付界面
function goPay(obj){
	var lunch_id=$(obj).attr("lunch_id");
	var scheduled_time_id=$(obj).attr("scheduled_time_id");
	 window.location.href="wxmember/goPayJSP.do?shop_type=2&lunch_idstr="+lunch_id+"@1&order_type=2&scheduled_time_id="+scheduled_time_id;
}


</script>
</html>