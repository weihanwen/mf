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
                    height: 54px;
                }
            li span {
                    height: 30px;
                    width: 20%;
             }
            section {
                padding:2px;
                overflow-y:scroll;
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
                 <span> 1、单份费用5元，两份8元，三份9元，四份8元，五份免配送费；</span>
                <span>2、同一公司同一地址十分钟内下单达到5份全免 费用；以该时段内第一个人下单时间为准；该 批订单送出后重新计时；</span>
                <span>3、已支付的配送费根据该时段内订餐数量进行返还；返还方式为积分，积分1分=1元，可在下次订餐时抵现金使用。
				例：李先生11:30成功订餐1份（以支付时间为准），支付配送费和餐盒费共5元，同公司的赵小姐、钱先生、孙小姐、李先生分别在11:32、11:33、11:38、11:39分成功订餐，各支付配送费和餐盒费5元，到11:40时，共订餐5份，免配送费和餐盒费，则五位同事每人帐户返积分5分（价值5元）；
				 </span>
            </div>
            <div class="two">
                 <div class="titlediv">
                    <span class="span1"> 正在订餐得同事</span>
                     <span class="span2" id="less_time"> ${less_time}</span>
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
//倒计时函数
function newTime (){
    //算出中间差并且已毫秒数返回; 除以1000将毫秒数转化成秒数方便运算；
    var countDown =  "${less_time}";
    
    //获取分钟数
    //同理剔除掉分钟数
    var oMinutes = parseInt(countDown/60%60);
    
    //获取秒数
    //因为就是秒数  所以取得余数即可
    var oSeconds = parseInt(countDown%60);
    
    //下面就是插入到页面事先准备容器即可;
    var html =  "<span>" + p(oMinutes) + "分</span>" +"<span>" + p(oSeconds) + "秒</span>";
    document.getElementById('less_time').innerHTML = html;
    
    //别忘记当时间为0的，要让其知道结束了;
    if(countDown < 0){
        document.getElementById('less_time').innerHTML = '--';
    }
}
</script>
 
</html>

