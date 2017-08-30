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
		<title>修改</title>
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
 		<!-- 引入 -->
		<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
	</head>
<body>
	<form action="delivery_fee/edit.do" name="Form" id="Form" method="post">
		<input type="hidden" name="delivery_fee_id" value="${pd.delivery_fee_id }" />
		<div id="zhongxin" style="width: 60%;margin: 5% auto;">
		<table>
			<tr>
				<td>数量（份）：</td>
				<td><input  type="text" name="number" id="number" value="${pd.number }" maxlength="32" placeholder="这里输入量（份） "    style="width:208px;" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>跑腿金额（元）：</td>
				<td><input  type="text" name="ptmoney" id="ptmoney" value="${pd.ptmoney }" maxlength="32" placeholder="这里输入金额（元） "   style="width:208px;"/></td>
			</tr>
			 <tr>
				<td>餐盒金额（元）：</td>
				<td><input  type="text" name="chmoney" id="chmoney" value="${pd.chmoney }" maxlength="32" placeholder="这里输入金额（元） "   style="width:208px;"/></td>
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
			if($("#number").val()==""){
				$("#number").tips({
					side:3,
		            msg:'请输入数量',
		            bg:'#AE81FF',
		            time:1
		        });
				$("#number").focus();
				return false;
			}
			if($("#pcmoney").val()==""){
				$("#pcmoney").tips({
					side:3,
		            msg:'请输入跑腿金额',
		            bg:'#AE81FF',
		            time:1
		        });
				$("#pcmoney").focus();
				return false;
			}
			if($("#chmoney").val()==""){
				$("#chmoney").tips({
					side:3,
		            msg:'请输入餐盒金额',
		            bg:'#AE81FF',
		            time:1
		        });
				$("#chmoney").focus();
				return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
 		}
		
		 
		
</script>
</body>
</html>