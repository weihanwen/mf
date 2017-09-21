<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
﻿<!DOCTYPE html>
<<html>
	<head>
		<meta charset="utf-8">
		<base href="<%=basePath%>">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>跑腿餐盒费用</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Free HTML5 Template by FREEHTML5" />
		<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
		<link rel="stylesheet" href="css/wx/labary/predefine.css">
	    <link rel="stylesheet" href="css/wx/frozen.css">
	    <link rel="stylesheet" href="css/wx/use.css">
	    <style>
            ul, li {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }
            li {
                display: block;
                float: left;
                width: 18%;
                text-align: center;
                height: 84px;
                padding: 2px;
                font-size: 12px;
            }
                li img {
                    height: 60px;
                    width:60px;
                }
            li span {
                    height: 30px;
                    width: 20%;
             }
            section {
                padding:2px;
             }
            .one {
                width: 99%;
            }
            .one span {
                display: block;
            }
            .two {
                width:99%;
            }
             .three {
                width: 99%;
                clear: both;
            }
            .titlediv {
                width: 99%;
                height: 30px;
                background-color: red;
                color: #fff;
                padding-left: 10px;
                font-size: 20px;
              }
                .titlediv .span1 {
                    display: block;
                    height: 100%;
                    float: left;
                    text-align:left;
                    margin-left:10px;
                }
                .titlediv .span2 {
                    display: block;
                    width: 40%;
                    height: 100%;
                    float: right;
                    text-align: right;
                    margin-right: 10px;
                }
               
        </style>
	</head>
<body ontouchstart>
		<header class="ui-header ui-header-positive ui-border-b bg_ff0600">
		    <i class="ui-icon-return" onclick="history.back()"></i><h1 class="col_f">跑腿费用详情</h1>
		</header>
 		<section>
		    <div class="one">
                 <span> 1、单份费用3.5元，两份3.5元，三份3.5元，四份3.5元，五份以上免配送费；</span>
                <span>2、某公司，A点了一份，收了3.5元，B点了两份，收了3.5元，在A点餐起的10分钟之内没有后续订单了，则配送费不退还；</span>
                <span>3、某公司，A点了一份，收了3.5元，B点了两份，收了3.5元，C点了两份，收了3.5元，在A点餐起的10分种内，共产生了三个订单，共5份餐，则系统分别退A、B、C的各3.5元；				 </span>
            </div>
            <div class="two">
                 <div class="titlediv">
                    <span class="span1"> 正在订餐得同事</span>
                     <span class="span2" id="less_time"></span>
                 </div>
                 <ul>
                   <c:forEach items="${timeList}" var="var" varStatus="vs">
                    	<c:if test="${vs.index+1 <=6 }">
	                    	 <li>
		                         <img  src="${var.image_url}" />
		                         <span >${var.time}前预定</span>
		                     </li>
                    	</c:if>
                   </c:forEach>
                 </ul>
            </div>
            <div class="three">
                <div class="titlediv">
                    <span class="span1"> 已经订餐完成得同事</span>
                    <span class="span2"> 已完成${overnumber}</span>
                </div>
                <ul>
                    <c:forEach items="${overList}" var="var" varStatus="vs">
                    	<c:if test="${vs.index+1 <= 12 }">
	                    	 <li>
		                         <img  src="${var.image_url}" />
		                         <span >${var.time}前预定</span>
		                     </li>
                    	</c:if>
                   </c:forEach>
                </ul>
            </div>
		</section>
</body>
 <script src="js/jquery-1.8.3.min.js"></script>
 <script src="js/wx/tongyong.js"></script>
<script type="text/javascript">


window.onload = function() {
if("${less_time}" != '' && "${less_time}" != '0'){
	interval = setInterval(function() {
		var endDate = new Date("${less_time}");
		var leftTime=endDate.getTime()-(new Date()).getTime(); 
		var leftsecond = parseInt(leftTime/1000); 
		var day1=Math.floor(leftsecond/(60*60*24)); 
		var hour=Math.floor((leftsecond-day1*24*60*60)/3600); 
		var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60); 
		var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60); 
	    $("#less_time").html( minute + ":" + second);
	    if (minute == 0 && second == 0) {
	        clearInterval(interval);
	        return;
	    }
	}, 1000);
	}
}

 
</script>
 
</html>

