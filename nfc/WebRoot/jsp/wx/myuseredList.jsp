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
     <title>红包列表</title>
    <link rel="stylesheet" href="css/wx/labary/predefine.css">
    <link rel="stylesheet" href="css/wx/frozen.css">
    <link rel="stylesheet" href="css/wx/use.css">
</head>
<body>
<header class="ui-header ui-header-positive ui-border-b bg_ff0600">
    <i class="ui-icon-return" onclick="history.back()"></i><h1 class="col_f">红包列表</h1>
</header>
<section>
<!-- 可用 -->
<div class="rp_item">
	<c:forEach items="${redList}" var="var">
		<div class="rp_box clf">
	        <div class="cash col_c9">
	        	<span style="font-size: 0.25rem;;">${var.money}元红包 无条件使用</span>
 	        </div>
 	        <div class="ball ball_l"></div>
	        <div class="ball ball_r"></div>
	    </div>
	</c:forEach>
</div>
</section>
</body>
 <script src="js/jquery-1.8.3.min.js"></script>
 <script src="js/wx/tongyong.js"></script>
</html>