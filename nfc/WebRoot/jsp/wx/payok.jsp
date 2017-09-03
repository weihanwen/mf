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
	<script src="js/jquery-1.8.0.min.js"></script>
	<style type="text/css">
	/*初始化*/
		html,body,h1,h2,h3,h4,h5,h6,p,img,ul,li{
			margin: 0;
			border: 0;
			padding: 0;
			font-weight: normal;
		}
		body,html{
			height: 100%;
		}
		body{
			font-family: Arial, 微软雅黑, sans-serif;
			overflow-y:hidden;
		}
		ul,li{
			list-style: none;
		}
		a{
			text-decoration: none;
			color: #000;
		}


		/*头部*/
		header{
			height: 44px;
			width: 100%;
			background: #fc111b;
			line-height: 44px;
			color: #fff;
			position: fixed;
			top: 0;
			z-index: 2;
		}
		.goback{
			position: absolute;
			left: 0;
			top: 0;
			width: 44px;
			text-align: center;line-height: 44px;
			font-size: 3.6rem;
		}
		.title{
			width: 100%;
			text-align: center;
			color: #fff;

		}
		.djs {
		  	height: 44px;
		  	text-align: center;
		}
		.djs h6{
			font-weight: normal;
			line-height: 44px;
			font-size: 2rem;
		}
		.tit{
			text-align: center;
			padding-top: 8rem;
			color: #ea4c27;
			font-size: 3.6rem;
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
			width: 50%;
			float: left;
			padding-right: 2rem;
		}
		.link a:nth-child(2){
			display: block;
			width: 50%;
			float: left;
			padding-left: 2rem;
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
<header class="ui-header ui-header-positive ui-border-b bg_ff0600">
    <i class="ui-icon-return" onclick="goback()"></i><h1 class="col_f">支付完成</h1>
</header>
<body>
<div class="tit">支付成功</div>
<img src="img/qqimg.png" alt="" class="img">
 <div class="link">
	<a onclick="goBaoPing()"><img src="img/jxqg.png" alt=""></a>
	<a href="wxmember/myorderDetail.do?order_id=${pd.order_id}"><img src="img/ddxq.png" alt=""></a>
 </div>
<script type="text/javascript">
function goback(){
	window.location.href='<%=basePath%>wxmember/wxindex.do';
}
</script>
</body>
</html>