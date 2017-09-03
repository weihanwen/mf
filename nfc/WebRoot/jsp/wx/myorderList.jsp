<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0">
     <title>订单列表</title>
    <link rel="stylesheet" href="css/wx/labary/predefine.css">
    <link rel="stylesheet" href="css/wx/frozen.css">
    <link rel="stylesheet" href="css/wx/use.css">
</head>
<body>
<header class="ui-header ui-header-positive ui-border-b bg_ff0600">
    <i class="ui-icon-return" onclick="history.back()"></i><h1 class="col_f">订单列表</h1>
</header>
<section>
<!-- 可用 -->
<div class="rp_item">
	<c:forEach items="${orderList}" var="var">
		<div class="rp_box clf" onclick="godetail('${var.order_id}')">
	        <div class="cash col_c9" style="width: 100%;line-height: 1.8;padding:7px;">
	        	<span style="display:block;width:90%;font-size: 0.16rem;;">${var.order_type eq '1'?'点餐订单':'预定订单'}编号：${var.looknumber}</span>
	        	<span style="display:block;text-align:left;font-size: 0.16rem;float:left;">${var.order_status eq '3'?'已完成':'待配送'}</span>
	        	<span style="display:block;width:60%;font-size: 0.16rem;float:right;">${var.createtime}</span>
  	        </div>
	    </div>
	</c:forEach>
</div>
</section>
</body>
 <script src="js/jquery-1.8.3.min.js"></script>
 <script src="js/wx/tongyong.js"></script>
 <script type="text/javascript">
 function godetail(order_id){
	 window.location.href="wxmember/myorderDetail.do?order_id="+order_id;
 }
 </script>
</html>