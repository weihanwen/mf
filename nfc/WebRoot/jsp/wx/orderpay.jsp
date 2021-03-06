<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>订单详情</title>
     <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/wx/frozen.css">
    <link rel="stylesheet" href="css/wx/newpay.css">
</head>
<body ontouchstart>
<header class="ui-header ui-header-positive ui-border-b bg_ff0600">
    <i class="ui-icon-return" onclick="history.back()"></i><h1 class="col_f">订单详情</h1>
</header>
<section class="ui-container" style=" overflow-y: scroll;">
    <ul class="ui-list ui-list-text ui-border-tb mg_b_10">
        <li class="ui-border-t">
            <div class="ui-list-info ">
                <h4>订单配送到</h4>
            </div>
            <div class="ui-list-action"> </div>
        </li>
        <li class="ui-border-t">
            <div class="ui-list-info">
            	<c:choose>
            		<c:when test="${!empty pd.wxmember_address_id }">
            			 <div onclick="changeAddress()" style="/* background-color: #D7DEE2; */color: #101010;padding: 8px;width: 100%;margin: auto;text-align: center;border-radius: 22px;">${address}</div>
            		</c:when>
            		<c:otherwise>
            			 <div onclick="changeAddress()" style="background-color: #27A6F1; color: #fff; padding: 8px; width: 50%; margin: auto; text-align: center; border-radius: 22px; "> +添加收件地址</div>
            		</c:otherwise>
            	</c:choose>              
            </div>
            <div class="ui-list-action col_c9"> </div>
        </li>
     </ul>
      <ul class="ui-list ui-list-text ui-border-tb mg_b_10">
        <li class="ui-border-t">
        	<c:choose>
        		<c:when test="${pd.order_type eq '1' }">
        			<div class="ui-list-info ">
		                <h4>预定送达时间 ：${showtime}</h4>
		            </div>
        		</c:when>
         		<c:otherwise>
         			<div class="ui-list-info ">
		                <h4>预定日期：${daypd.day}-${daypd.time_name}</h4>
		                <span>选择配送时间：
		                <select class="delivery_time" 	style=" width: 34%; ">
		                	<c:forEach items="${ydtimeList}" var="ydvar" varStatus="vs">
		                		<option value="${ydvar}" ${pd.ydtime eq ydvar?'selected':''} >${ydvar}</option>
		                	</c:forEach>
		                </select>
 		                </span>
		            </div>
         		</c:otherwise>
        	</c:choose>
         </li>
     </ul>
     <ul class="ui-list ui-list-text ui-list-pure ui-border-tb mg_b_10 ">
        <li class="ui-border-t youhuiList" >
        	<c:choose>
        		<c:when test="${pd.shop_type eq '1' }">
        			<c:forEach items="${shopList }" var="var">
					    <p  class="oneyouhui" style="overflow:hidden;">
					    	<span style='float:left ;text-align: center;'>${var.lunch_name}</span>
					    	<span style='float:left;width: 33%;text-align: center;'>X${var.shop_number} </span>
					    	<span style='float:right ;text-align: center;'>￥:${var.allsale_money}</span>
 					    </p>
			 		</c:forEach>
        		</c:when>
        		<c:otherwise>
        			<p  class="oneyouhui" style="overflow:hidden;">
        					<span style='float:left; text-align: center;'>${lunchpd.lunch_name}</span>
        					
					    	<span style='float:left;width: 33%;text-align: center;'>
					    		<a class="down sljj" onclick="isStockOk('-1','${lunchpd.lunch_id}',this)" style="display: inline-block;width: 27px;border: 1px solid #dddddd; ">-</a> 
			 					<span class="number" >${lunchpd.shop_number}</span> 
			 					<a class="up sljj" onclick="isStockOk('1','${lunchpd.lunch_id}',this)" style="display: inline-block;width: 27px;border: 1px solid #dddddd; ">+</a> 
 					    	</span>
					    	<span style='float:right; text-align: center;'>￥:${lunchpd.allsale_money}</span>
        			</p>
        		</c:otherwise>
        	</c:choose>
           </li>
    </ul>
     <ul class="ui-list ui-list-text ui-list-pure ui-border-tb mg_b_10 ">
         <li class="ui-border-t" onclick="peisong()">
            <h4 class="ui-nowrap">推广期间立减： <span>-${tuiguan_discount}</span>元</h4>
         </li>
         <c:if test="${pd.order_type eq '2' }">
	         <li class="ui-border-t" onclick="peisong()">
	            <h4 class="ui-nowrap">预定优惠立减： <span>-${yddiscount}</span>元</h4>
	         </li>
         </c:if>
         
    </ul>
     <ul class="ui-list ui-list-text ui-list-pure ui-border-tb mg_b_10 ">
        <li class="ui-border-t" onclick="peisong()">
            <h4 class="ui-nowrap">餐盒费用：<span>${chmoney}</span>元</h4>
            
        </li>
    </ul>
    <ul class="ui-list ui-list-text ui-list-link ui-border-tb mg_b_10">
        <li class="ui-border-t" onclick="peisong()">
            <h4 class="ui-nowrap">配送费</h4>
            <div class="ui-txt-info" >${ptmoney}元</div>
        </li>
    </ul>
    <ul class="ui-list ui-list-text ui-list-link ui-border-tb mg_b_10">
        <li class="ui-border-t" onclick="redMessage()">
            <h4 class="ui-nowrap">红包</h4>
            <div class="ui-txt-info redMessage" >
            	${empty pd.wxmember_redpackage_id or pd.wxmember_redpackage_id eq ''?'选择红包':redmoney}
             </div>
        </li>
    </ul>
     <ul class="ui-list ui-list-text ui-list-link ui-border-tb mg_b_10">
        <li class="ui-border-t" onclick="payway()">
            <h4 class="ui-nowrap">支付方式</h4>
            <div class="ui-txt-info pay_way" > 
       			${empty pd.wxmember_tihuojuan_idstr or pd.wxmember_tihuojuan_idstr eq ''?' 在线支付':'提货卷支付'}     
           </div>
        </li>
    </ul>
    <ul class="ui-list ui-list-text ui-list-pure ui-border-tb mg_b_10 ">
        <li class="ui-border-t" onclick="peisong()">
            <h4 class="ui-nowrap">本单赠送积分：<span>${allsendjf}</span>分</h4>
            <h6>1积分=1元</h6>
         </li>
    </ul>
    <ul class="ui-list ui-list-text ui-border-tb mg_b_10">
        <li class="ui-border-t">
            <div class="ui-list-info" style=" width: 184px; display: inline-block; ">
                <span>积分余额：</span>
                <span>${nowintegral}</span>
            </div>
            <label class="ui-switch">
                <input type="checkbox"  onclick="isOK(this)" class="user_integral" >
            </label>
        </li>
    </ul>
    <div class="ui-btn-wrap">
    	<div class="ui-btn-lg actual_money" style='color: block;background: #fff;' >
            	${actual_money}
        </div>
        <button class="ui-btn-lg surepay" style='color: #fff;background: #c90000;' onclick="surepay()">
            	去支付
        </button>
    </div>
</section>
 			<form action="" method="post" id="Form" name="Form">
				<input type="hidden" name="session_orderid" value="${session_orderid}">
				<input type="hidden" id="allmoney" value="${allmoney}" name="allmoney"/> 
				<input type="hidden" id="discount_money" value="${discount_money}" name="discount_money"/> 
				<input type="hidden" id="wxmember_redpackage_id" value="${pd.wxmember_redpackage_id}" name="wxmember_redpackage_id"/> 
				<input type="hidden" id="wxmember_tihuojuan_idstr" value="${pd.wxmember_tihuojuan_idstr}" name="wxmember_tihuojuan_idstr"/> 
				<input type="hidden" id="actual_money" value="${actual_money}" name="actual_money"/> 
				<input type="hidden" id="use_integral" value="0" name="use_integral"/> 
				<input type="hidden" id="use_wx" value="${actual_money}" name="use_wx"/> 
				<input type="hidden" id="send_integral" value="${allsendjf}" name="send_integral"/> 
				<input type="hidden" id="serial_number" value="" name="serial_number"/> 
				<input type="hidden" id="pay_type" value="${empty pd.wxmember_tihuojuan_idstr or pd.wxmember_tihuojuan_idstr eq ''?'1':'2'}" name="pay_type"/> 
				<input type="hidden" id="order_type" value="${pd.order_type}" name="order_type"/> 
				<input type="hidden" id="reserve_arrival_time" value="${reserve_arrival_time}" name="reserve_arrival_time"/> 
 				<input type="hidden" id="delivery_time" value="${delivery_time}" name="delivery_time"/> 
				<input type="hidden" id="delivery_fee" value="${delivery_fee}" name="delivery_fee"/> 
				<input type="hidden" id="chmoney" value="${chmoney}" name="chmoney"/> 
				<input type="hidden" id="ptmoney" value="${ptmoney}" name="ptmoney"/> 
				<input type="hidden" id="wxmember_address_id" value="${pd.wxmember_address_id}" name="wxmember_address_id"/> 
				<input type="hidden" id="order_status" value="0" name="order_status"/> 
				
				<input type="hidden" id="shop_type" value="${pd.shop_type}" name="shop_type"/> 
				<input type="hidden" id="allshopcart_id" value="${pd.allshopcart_id}" name="allshopcart_id"/> 
				<input type="hidden" id="lunch_idstr" value="${pd.lunch_idstr}" name="lunch_idstr"/> 
  			</form>
 </body>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/wx/weixinpay.js"></script>
<script src="js/wx/tongyong.js"></script>
<script type="text/javascript">

	//判断是从那个界面进来得
	if("${pd.order_type}" == "1"){ 
		 document.title='订单详情';
 	 } else{
 		 document.title='预定详情';
	}

	//判断近期是否充足
	function isOK(obj){//1-使用余额，2-使用积分
		if(!$(obj).is(":checked")){
			$(".actual_money").html("${actual_money}");
			 $(obj).removeAttr("checked");
		}else{
 			if( parseFloat("${actual_money}") >0 ){
				 if(parseFloat("${nowintegral}") >0){
					  if(parseFloat("${actual_money}")  > parseFloat("${nowintegral}")){
						   var n=parseFloat("${actual_money}")-parseFloat("${nowintegral}");
  						   $("#use_integral").val("${nowintegral}");
						   $("#use_wx").val(n.toFixed(2));
						   $(".actual_money").html(n.toFixed(2));
					  }else{
  						  $("#use_integral").val("${actual_money}");
						  $("#use_wx").val("0");
						  $(".actual_money").html("0");
					  }
 					 $(obj).attr("checked");
				 } 
			}
			
		}
 	}
	
	//前往选择地址页面
	function changeAddress(){
		window.location.href="wxmember/changeAddress.do?shop_type=${pd.shop_type}&allshopcart_id=${pd.allshopcart_id}&order_type=${pd.order_type}&lunch_idstr=${pd.lunch_idstr}&wxmember_address_id=${pd.wxmember_address_id}&wxmember_redpackage_id=${pd.wxmember_redpackage_id}&wxmember_tihuojuan_idstr=${pd.wxmember_tihuojuan_idstr}&scheduled_time_id=${pd.scheduled_time_id}&ydtime="+$(".delivery_time").val();
	}
	
	//前往配送费+餐盒费说明页面
	function peisong(){
		window.location.href="wxmember/canheDetail.do?wxmember_address_id=${pd.wxmember_address_id}";
	}

 
	//前往使用红包页面
	function redMessage(){
		window.location.href="wxmember/gouserRed.do?allmoney=${allmoney}&shop_type=${pd.shop_type}&allshopcart_id=${pd.allshopcart_id}&order_type=${pd.order_type}&lunch_idstr=${pd.lunch_idstr}&wxmember_address_id=${pd.wxmember_address_id}&wxmember_redpackage_id=${pd.wxmember_redpackage_id}&wxmember_tihuojuan_idstr=${pd.wxmember_tihuojuan_idstr}&scheduled_time_id=${pd.scheduled_time_id}&ydtime="+$(".delivery_time").val();
	}
	
	//前往使用提货卷页面
	function payway(){
		window.location.href="wxmember/gouserTiHuoJuan.do?allmoney=${allmoney}&shop_type=${pd.shop_type}&allshopcart_id=${pd.allshopcart_id}&order_type=${pd.order_type}&lunch_idstr=${pd.lunch_idstr}&wxmember_address_id=${pd.wxmember_address_id}&wxmember_redpackage_id=${pd.wxmember_redpackage_id}&wxmember_tihuojuan_idstr=${pd.wxmember_tihuojuan_idstr}&scheduled_time_id=${pd.scheduled_time_id}&ydtime="+$(".delivery_time").val();
	}
	 

	
	var flag=true;
	//确认支付--直接购买的会判断库存
	function surepay(){
		if($("#wxmember_address_id").val() == ""){
		    alert("地址不能为空");
		    return;
		}
		if(!flag){
			return;
		}
		flag=false;
		$(".surepay").removeAttr("onclick");
		$(".surepay").css("background","rgb(192, 192, 192)");
 		var use_wx= parseFloat($("#use_wx").val());
 		if("${pd.order_type}" == "2"){
 			var delivery_time=$(".delivery_time").val();
 			if(delivery_time ==""){
 				alert("配送时间不能为空");
 				return;
 			}else{
 				$("#delivery_time").val("${daypd.day}"+" "+delivery_time+":00");
 				$("#reserve_arrival_time").val("${daypd.day}"+" "+delivery_time+":00");
 			}
 		}
	    $("#Form").ajaxSubmit({  
	    	url : 'wxmember/payorder.do',
	        type: "post",//提交类型  
	      	data:{ 
	      		"pay_way":"wx_pub" 
    	    },  
	      	dataType:"json",
	   		success:function(data){ 
	   			if(data.result == "0"){
	   				flag=true;
	   				$(".surepay").attr("onclick","surepay()");
	   				$(".surepay").css("background","#c90000");
	   				alert(data.message);
	   				return;
	   			}
	   			var map=data.data;
	   			if(use_wx > 0){
 					 if(map.return_msg == "OK"){
 						callWxJsPay(map.appId,map.timeStamp,map.nonceStr,map.package,map.signType,map.sign,map.out_trade_no);
		        	 }else{
		        		 alert(map.return_msg);
		        	 }
	   			}else{
	   				//在支付成功的状态下跳转订单到订单详情界面
	   				window.location.href="wxmember/payok.do?order_id="+map.out_trade_no; 
	   			}
 	   		}
	    }); 
	}
	
	
	//加减商品重新调接口
	function isStockOk(number,lunch_id,obj){
		if(number == "-1" && $(obj).prev().html() == "1"){
			return;
		} 
		var lunch_idstr="${pd.lunch_idstr}";
		if(number == "-1"){
			 lunch_idstr=lunch_id+"@"+(parseInt($(obj).next().html())+parseInt(number));
		}else{
			 lunch_idstr=lunch_id+"@"+(parseInt($(obj).prev().html())+parseInt(number));
		}
 		window.location.href="wxmember/goPayJSP.do?shop_type=${pd.shop_type}&allshopcart_id=${pd.allshopcart_id}&order_type=${pd.order_type}&lunch_idstr="+lunch_idstr+"&wxmember_address_id=${pd.wxmember_address_id}&wxmember_redpackage_id=${pd.wxmember_redpackage_id}&wxmember_tihuojuan_idstr=${pd.wxmember_tihuojuan_idstr}&scheduled_time_id=${pd.scheduled_time_id}&ydtime="+$(".delivery_time").val();
  	}
	
	

	
</script>
</html>