<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
 	 <link rel="stylesheet" href="css/wx/labary/predefine.css">
    <link rel="stylesheet" href="css/wx/frozen.css">
	<script src="js/jquery-1.8.0.min.js"></script>
<style type="text/css">
	.ddxq-text p{
		line-height: 30px;
		margin-left: 10px;
	}
	.ddxq-thj{

	}
	.my-thj-list p{
		text-align: right;
		line-height: 20px;
	}
	.ddxq-red{
		padding:10px;
		text-align: center;
		font-size: 14px;
	}
	.blod{
		font-weight: bold;
		font-size: 16px;
	}
	.ddxq-list p{
		text-align: left;
	}
	.tit_bg_box {
	    position: absolute; right: 0.4rem; top: 0.4rem; display: inline; height: 1.5rem; width: 3.3rem; font-size: 10px; background-size: 100%;
	}
	.inline_box{
		height: 2.1rem;padding: 0.4rem 0.4rem;width: 100%;position: relative;line-height: 1.6rem;font-size: 2.1rem;
	}
</style>
</head>
<body style="background:#ededed;">
<header class="ui-header ui-header-positive ui-border-b bg_ff0600">
    <i class="ui-icon-return" onclick="history.back()"></i><h1 class="col_f">订单详情</h1>
</header>
<div class="wallet-content clearfix">
	<ul>
		<li class="clearfix">
			<div class="fl">
				<p class="fourteen-px">总金额</p>
 			</div>
			<div class="fr">
				<p>${pd.allmoney}</p>
			</div>
		</li>
		<li class="clearfix">
			<div class="fl">
				<p class="fourteen-px">使用红包/提货卷优惠金额</p>
				
			</div>
			<div class="fr">
				<p>${pd.discount_money} </p>
			</div>
		</li>
	</ul>
</div> 
<div class="wallet-content clearfix">
	<ul>
		<li class="clearfix">
			<div class="fl">
				<p class="fourteen-px">积分支付</p>
 			</div>
			<div class="fr">
				<p>${pd.use_integral }</p>
			</div>
		</li>
		<li class="clearfix">
			<div class="fl">
				<p class="fourteen-px">微信支付</p>
				
			</div>
			<div class="fr">
				<p>${pd.use_wx} </p>
			</div>
		</li>
	</ul>
</div> 
<div class="wallet-content clearfix">
	<p class="wallet-content-title" style="font-size: 17px;">商品信息</p>
	<ul >
		<c:forEach items="${lunchList}" var="var">
		 	<li class='clearfix'> 
		 		<div class='fl'>
		 			 <p class='fourteen-px' style='font-size: 14px;'>${var.lunch_name} X ${var.shopnumber}</p> 
		 		</div> 
		 		<div class='fr'> <p style='color:red;'>${var.allmoney}</p> 
		 		</div> 
		 	</li>
		</c:forEach>
 	</ul>
</div>
<div class="wallet-content clearfix">
	<ul>
		<li class="clearfix">
			<div class="fl">
				<p class="fourteen-px">订单号</p>
 			</div>
			<div class="fr">
				<p id="look_number">${pd.lookorder_id }</p>
			</div>
		</li>
		<li class="clearfix">
			<div class="fl">
				<p class="fourteen-px">下单时间</p>
				
			</div>
			<div class="fr">
				<p id="createtime">${pd.createtime } </p>
			</div>
		</li>
	</ul>
</div> 
 </body>
</html>
