<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
 		<meta charset="utf-8" />
		<title>优惠操作</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta name="renderer" content="webkit">
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="css/bootstrap.min.css" rel="stylesheet" />
		<link href="css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<!--[if IE 7]><link rel="stylesheet" href="css/font-awesome-ie7.min.css" /><![endif]-->
		<!--[if lt IE 9]><link rel="stylesheet" href="css/ace-ie.min.css" /><![endif]-->
 		<link rel="stylesheet" href="css/chosen.css" /><!-- 下拉框 -->
 		<link rel="stylesheet" href="css/ace.min.css" />
		<link rel="stylesheet" href="css/ace-responsive.min.css" />
		<link rel="stylesheet" href="css/ace-skins.min.css" />
 		<link rel="stylesheet" href="css/datepicker.css" /><!-- 日期框 -->
 		<style type="text/css">
 		.link_content{
 			display:none;
 		}
 		</style>
 		<!-- 引入 -->
		<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
	</head>
<body>
	<form action="discount/edit.do" name="Form" id="Form" method="post">
		<input type="hidden" name="discount_way_id" value="${pd.discount_way_id }" />
		<div id="zhongxin" style="width: 60%;margin: 5% auto;">
		<table>
			<tr>
				<td>大类：</td>
				<td>
					<select name="category_id" id="category_id">
						 <c:forEach items="${categoryList}" var="var">
	 					 		<option value="${var.category_id }" ${pd.category_id eq var.category_id?'selected':''}>${var.title }</option>
	  		 			</c:forEach>
 		 			</select>
				</td>
			</tr>
			<tr>
				<td>最少份数：</td>
				<td><input  type="text" name="min_number" id="min_number" value="${pd.min_number}" maxlength="32"  style="width:208px;"/></td>
			</tr>
			<tr>
				<td>最多份数：</td>
				<td><input  type="text" name="max_number" id="max_number" value="${pd.max_number}" maxlength="32" style="width:208px;"/></td>
			</tr>
			 <tr>
				<td>优惠金额：</td>
				<td><input  type="text" name="reduce_money" id="reduce_money" value="${pd.reduce_money}" maxlength="32" style="width:208px;"/></td>
			</tr>
			<tr>
				<td>赠送积分：</td>
				<td><input  type="text" name="send_integral" id="send_integral" value="${pd.send_integral}" maxlength="32" style="width:208px;"/></td>
			</tr>
			<tr>
				<td>预定优惠金额：</td>
				<td><input  type="text" name="ydreduce_money" id="ydreduce_money" value="${pd.ydreduce_money}" maxlength="32" style="width:208px;"/></td>
			</tr>
			 
 		</table>
		</div>
		<div style="width:40%;padding-top:5%;margin:0 auto;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
		</div>
 		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
 	</form>
 
 		<script type="text/javascript">window.jQuery || document.write("<script src='js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/ace-elements.min.js"></script>
		<script src="js/ace.min.js"></script>
		<script type="text/javascript" src="js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="js/jquery.form.js"></script>
 		<script type="text/javascript" src="js/jquery.tips.js"></script>
		<script type="text/javascript">
 			
		$(window.parent.hangge());
		$(function() {
 			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
 			//日期框
			$('.date-picker').datepicker();
 			
    	});
  		 
		
		//保存
		function save(){
			if($("#address_name").val()==""){
				$("#address_name").tips({
					side:3,
		            msg:'请输入配送地址',
		            bg:'#AE81FF',
		            time:1
		        });
				$("#address_name").focus();
				return false;
			}
			if($("#detail_address").val()==""){
				$("#detail_address").tips({
					side:3,
		            msg:'请输入详细地址',
		            bg:'#AE81FF',
		            time:1
		        });
				$("#detail_address").focus();
				return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
 		}
		
		 
		
</script>
</body>
</html>