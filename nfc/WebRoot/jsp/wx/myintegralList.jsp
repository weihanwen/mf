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
     <title>积分财富历史列表</title>
    <link rel="stylesheet" href="css/wx/labary/predefine.css">
    <link rel="stylesheet" href="css/wx/frozen.css">
    <link rel="stylesheet" href="css/wx/use.css">
</head>
<body>
<header class="ui-header ui-header-positive ui-border-b bg_ff0600">
    <i class="ui-icon-return" onclick="history.back()"></i><h1 class="col_f">积分财富历史列表</h1>
</header>
<section>
<!-- 可用 -->
<div class="rp_item">
	<c:forEach items="${integralList}" var="var">
		<div class="rp_box clf">
	        <div class="cash col_c9" style="width:100%;">
	        	
	        	<span style="font-size: 0.25rem;;">
	        		<c:choose>
	        			<c:when test="${var.wealth_type eq '1'}">订单支付积分</c:when>
	        			<c:when test="${var.wealth_type eq '2'}">返跑腿费+送餐费</c:when>
	        			<c:otherwise>赠送积分</c:otherwise>
	        		</c:choose>
	        	</span>
	        	：
	        	<span style="font-size: 0.25rem;;">${var.isincome eq '2'?'-':'+'} ${var.money}</span>
 	        </div>
	    </div>
	</c:forEach>
</div>
</section>
</body>
 <script src="js/jquery-1.8.3.min.js"></script>
 <script src="js/wx/tongyong.js"></script>
</html>