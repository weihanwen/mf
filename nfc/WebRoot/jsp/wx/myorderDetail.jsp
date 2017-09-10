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
    <link rel="stylesheet" href="css/wx/use.css">
	 <script src="js/jquery-1.8.3.min.js"></script>
 	<script src="js/wx/tongyong.js"></script>
<style type="text/css">
	.clearfix{
	 	display: block;
	    width: 100%;
	     background-color: #ffffff;
	    font-size: 20px;
	     margin-bottom: 5px;
	}
	.clearfix .fl{
	 	width: 90%; text-align: left;padding-left:10px;
	}
	.clearfix .fr{
	 	width: 90%; text-align: right;padding-right:10px;
	}
	 
</style>
</head>
<body style="background:#ededed;">
<header class="ui-header ui-header-positive ui-border-b bg_ff0600">
    <i class="ui-icon-return" onclick="history.back()"></i><h1 class="col_f">订单详情</h1>
</header>
<section style="top:40px;">
<div class="wallet-content">
	<ul>
		<li class="clearfix">
			<div class="fl"  >
				<p class="fourteen-px">订单总金额</p>
 			</div>
			<div class="fr">
				<p>${pd.allmoney}</p>
			</div>
		</li>
		<li class="clearfix">
			<div class="fl"  >
				<p class="fourteen-px">餐盒费</p>
 			</div>
			<div class="fr">
				<p>${pd.chmoney}</p>
			</div>
		</li>
		<li class="clearfix">
			<div class="fl"  >
				<p class="fourteen-px">跑腿费</p>
 			</div>
			<div class="fr">
				<p>${pd.ptmoney}</p>
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
		<li class="clearfix">
			<div class="fl">
				<p class="fourteen-px">订单号</p>
 			</div>
			<div class="fr">
				<p id="look_number">${pd.looknumber}</p>
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
		<li class="clearfix">
			<div class="fl">
				<p class="fourteen-px">商品列表</p>
 			</div>
 		</li>
		<c:forEach items="${lunchList}" var="var">
		 	<li class='clearfix'> 
		 		<div class='fl'>
		 			 <p style='font-size: 21px;'>${var.lunch_name} X ${var.shop_number}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style='color:red;'> ￥：${var.allmoney}</span></p> 
		 		</div> 
 		 	</li>
		</c:forEach>
		<li class="clearfix">
			<div class="fl">
				<p class="fourteen-px">联系方式</p>
 			</div>
			<div class="fr">
				<p id="createtime">${pd.contacts } -- ${pd.contacts_number }</p>
			</div>
		</li>
		<li class="clearfix">
			<div class="fl">
				<p class="fourteen-px">配送地址</p>
				
			</div>
			<div class="fr">
				<p id="createtime">${pd.address_name }${pd.corporate_name } ${pd.floor_number }  </p>
			</div>
		</li>
	</ul>
</div> 
</section> 
 </body>
</html>
