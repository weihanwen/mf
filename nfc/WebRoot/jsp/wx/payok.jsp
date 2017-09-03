<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0">
	<title>支付成功</title>
	<base href="<%=basePath%>">
	 <link rel="stylesheet" href="css/wx/labary/predefine.css">
    <link rel="stylesheet" href="css/wx/frozen.css">
    <link rel="stylesheet" href="css/wx/use.css">
	<style type="text/css">
		body {
		    background: #FFFFFF;
		}
 		.tit{
			text-align: center;
		    padding-top: 1rem;
		    color: #ea4c27;
		    font-size: 0.4rem;
		}
		p{
			padding-left: 9rem;
			font-size: 1.6rem;
		}
		.img{
			width: 100%;
		}
		.col{
			color: #ea4c27;
		}
		.link{
			text-align: left;
			width: 100%;
			padding: 5% 15% 0 15%;
			margin: 0;
		}
		.link a:nth-child(1){
			display: block;
			width: 75%;
		}
		.link a img{
			width: 100%;
		}
		.text{
			padding-top: 4rem;
			color: #666;
			line-height: 1.4;
		}
	</style>
 </head>
<body>
<header class="ui-header ui-header-positive ui-border-b bg_ff0600">
    <i class="ui-icon-return" onclick="goback()"></i><h1 class="col_f" style="display: inline-block; width: 75%;">支付完成</h1>
</header>
<div class="tit">支付成功</div>
<img src="img/qqimg.png" alt="" class="img">
 <div class="link">
 	<a href="wxmember/myorderDetail.do?order_id=${pd.order_id}"><img src="img/ddxq.png" alt=""></a>
 </div>
 <script src="js/jquery-1.8.3.min.js"></script>
 <script src="js/wx/tongyong.js"></script>
<script type="text/javascript">
function goback(){
	window.location.href='<%=basePath%>wxmember/wxindex.do';
}
</script>
</body>
</html>