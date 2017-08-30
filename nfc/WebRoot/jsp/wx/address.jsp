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
     <title>选择地址</title>
    <link rel="stylesheet" href="css/wx/labary/predefine.css">
    <link rel="stylesheet" href="css/wx/frozen.css">
    <link rel="stylesheet" href="css/wx/use.css">
    <style type="text/css">
    .address_search{
    	display: block;margin:auto;width: 100%;
    	height: 32px;line-height: 31px;
    	text-align: center;background-color: #fff;margin-bottom: 2px;
    }
    .address_search_1{
    	font-size: 16px
    }
    .address_search_2{
    	color:red;font-size: 8px;display: block;float: right;margin-right:5px;
    }
    ul li{
     	display: block;
	    width: 95%;
	     margin: 10px auto;
	    background-color: #fff;
	    height: 43px;
	    text-align: center;
	    line-height: 38px;
     }
     input{
     	    height: 24px;
     }
    </style>
</head>
<body>
<header class="ui-header ui-header-positive ui-border-b bg_ff0600">
    <i class="ui-icon-return" onclick="history.back()"></i>
    <span style="position: absolute;right: 0;" onclick="openSearch()">搜索地址</span>
    <h1 class="col_f">选择地址</h1>
 </header>
<section>
<!-- 展示地址列表 -->
<div class="rp_item list">
	<c:forEach items="${addressList}" var="var">
		<div class="rp_box clf" onclick="sureThisAddress('${var.wxmember_address_id}')">
	        <div class="cash col_c9">
	        	<span style="font-size: 0.18rem;;">${var.address}</span>
 	        </div>
	        <c:if test="${var.wxmember_address_id eq pd.wxmember_address_id}"><div class="hongbao"><span>✔</span>  </div></c:if>
	    </div>
	</c:forEach>
</div>


<!-- 搜索地址 -->
<div class="rp_item search" style="display:none">
	<div style="width: 84%;padding: 20px;">
		<input type="text" oninput="getLikeAddress(this.value)" style="height: 31px; width: 328px; " id="search"  placeholder="填写你要搜索的地址">
	</div>
	<div style="width:100%;" id="listsearch">
	
		
		<!-- <span class="address_search">
			<span class="address_search_1" >国泰科技大厦22</span>
			<span class="address_search_2" >已注册2人</span>
		</span> -->
		
		
	</div>
</div>


<!-- 新增地址  -->
<div class="rp_item addaddress" style="display:none">
	<ul style="display: block;width:100%;">
		<li>联系人：<input type="text" id="contacts"/></li>
		<li>性别：
			<input type="radio" id="sex1" name="sex" value="1" checked/>男
			<input type="radio" id="sex2" name="sex" value="2"/>女
		</li>
		<li>电话：<input type="text" id="contacts_number"/></li>
		<li>
			大厦：<select id="address_id" style="width:40%">
					<c:forEach items="${alladdress}" var="var">
						<option value="${var.address_id }">${var.address.name}</option>
					</c:forEach>
			</select>
		</li>
		<li>公司名称：<input type="text" id="corporate_name"/></li>
		<li>楼层：<input type="text" id="floor_numbe1" style="display: inline-block;width:20%;"/>层<input type="text" id="floor_numbe2" style="display:inline-block;width:20%;"/>号</li>
		<li><span style="display: block;width:100%;height:100%;background-color: #00B5DE;color:#fff;" onclick="sureAddAddress()">确认新增并返回</span></li>
	</ul>
 </div>
</section>
<div class="header footer">
    <span class='ccyc head_tit add'  onclick="openAdd()">没有地址？新增一个</span>
     <span class='ccyc head_tit backlist'  onclick="openList()">返回列表</span>
</div>
<script src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
//开启搜索页面
function openSearch(){
	$(".search").show();
	$(".add").hide();
	$(".addaddress").hide();
	$(".list").hide();
	$(".backlist").show();
	$("#search").val("");
	$("#listsearch").empty();
}
//填写地址搜索
function getLikeAddress(value){
	if(value == ""){return;}
	$.ajax({
		type:"post",
			url:"wxmember/getLikeAddress.do",
			data:{ "addres":value  },
			dataType:"json",
			async: false,
			success:function(data){
				  if(data.result == "1"){
					  var likeaddressList=data.likeaddressList;
					  for (var int = 0; int < likeaddressList.length; int++) {
						var array_element = likeaddressList[int];
						$("#listsearch").append("<span class=\"address_search\" onclick=\"openAddForSearch(\'"+array_element.contacts+"\',\'"+array_element.sex+"\',\'"+array_element.contacts_number+"\',\'"+array_element.corporate_name+"\',\'"+array_element.address_id+"\',\'"+array_element.floor_numbe+"\')\">"+
					  			" <span class='address_search_1' >"+array_element.address+"</span> <span class='address_search_2' >已注册"+array_element.number+"人</span></span>");
						}
 				  }else{
					  alert(data.message);
				  }
			}
	}); 
}

//前往新增页面
function openAddForSearch(contacts,sex,contacts_number,corporate_name,address_id,floor_numbe){
	$(".search").hide();
	$(".add").show();
 	$("#contacts").val(contacts);
 	if(sex == "1"){
 		$("sex1").attr("checked");
 		$("sex2").removeAttr("checked");
 	}else{
 		$("sex2").attr("checked");
 		$("sex1").removeAttr("checked");
 	}
 	$("#contacts_number").val(contacts_number);
 	$("#corporate_name").val(corporate_name);
 	$("#address_id").val(address_id);
 	$("#floor_number1").val(floor_number.split(",")[0]);
 	$("#floor_number2").val(floor_number.split(",")[1]);
 }


//前往新增页面
function openAdd(){
	$(".search").hide();
	$(".add").hide();
	$(".addaddress").show();
	$(".list").hide();
	$(".backlist").show();
 	
}

//返回列表
function openList(){
	$(".search").hide();
	$(".addaddress").hide();
 	$(".backlist").hide();
 	$(".add").show();
	$(".list").show();
}
//确认新增地址
function sureAddAddress(){
	if($("#contacts").val() == ""){ alert("联系人不能为空"); return; }
	if($("#contacts_number").val() == ""){ alert("电话号码不能为空");return; }
	if($("#corporate_name").val() == ""){ alert("公司名称不能为空");return; }
 	if($("#floor_number1").val() == ""){ alert("楼层不能为空");return; }
 	if($("#floor_number2").val() == ""){ alert("房间不能为空");return; }
  	$.ajax({
		type:"post",
			url:"wxmember/addAddress.do",
			data:{ 
					"contacts":$("#contacts").val(),  
					"sex":  $("input[name='sex']:checked").val(),  
					"contacts_number":$("#contacts_number").val(),  
					"corporate_name":$("#corporate_name").val(),  
					"address_id":$("#address_id").val(),  
					"floor_number":$("#floor_number1").val()+"层"+$("#floor_number2").val()
			},
			dataType:"json",
			async: false,
			success:function(data){
				  if(data.result == "1"){
					  var wxmember_address_id=data.wxmember_address_id;
					  sureThisAddress(wxmember_address_id);
 				  }else{
					  alert(data.message);
				  }
			}
	}); 
 }

//确认使用地址
function sureThisAddress(wxmember_address_id){
	window.location.href="wxmember/goPayJSP.do?shop_type=${pd.shop_type}&allshopcart_id=${pd.allshopcart_id}&order_type=${pd.order_type}&lunch_idstr=${pd.lunch_idstr}&wxmember_address_id="+wxmember_address_id+"&wxmember_redpackage_id=${wxmember_redpackage_id}&wxmember_tihuojuan_idstr=${pd.wxmember_tihuojuan_idstr}";
}

</script>
</body>
</html>