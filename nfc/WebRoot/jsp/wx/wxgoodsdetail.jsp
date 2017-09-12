<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>商品详情</title>
	<base href="<%=basePath%>">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0">
	<link rel="stylesheet" href="css/fonts/iconfont.css">
	<link rel="stylesheet" href="css/wx/style.css">
	<link rel="stylesheet" type="text/css" href="css/lunbo/slider.css" />
	<style type="text/css">
	.addshopcar {
	            display: block;
	    width: 3.4rem;
	    height: 3.4rem;
	    position: absolute;
	    right: 1rem;
	    bottom: 7.9rem;
	    color: #fff;
	    opacity: 0.8;
	    z-index: 1;
	}
	.shopcarnumber {
	            display: block;
		    width: 0.8rem;
		    height: 1rem;
		    position: absolute;
		    left: 3.8rem;
		    bottom: 2.8rem;
		    border-radius: 50%;
		    background-color: red;
		    color: #fff;
		    opacity: 0.6;
		    z-index: 1;
	}
	</style>
</head>
<body>
<!-- 顶部条 -->
<nav class="top">
	<div><span class="goback" onclick="backreturn()"><img src="img/fanhui.png" alt=""></span> 商品详情</div>
</nav>
<span class="addshopcar" onclick="clikthisLunch()"  ><img src="images/addshop.png" alt="" style="width: 100%;"></span>

<section class="twosection">
	<div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 800px; height: 1041px; overflow: hidden; visibility: hidden; background-color: #fff;">
        <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 800px; height:1041px; overflow: hidden;">
            <c:forEach items="${varList}" var="var">
            	<div data-p="160.50" style="display: none;">
	                <img data-u="image" src="${var.dc_images}" />
	                <img data-u="thumb" src="${var.dc_images_small}" lunch_id="${var.lunch_id}"/>
	            </div>
            </c:forEach>
        </div>
        <!-- Thumbnail Navigator -->
        <div data-u="thumbnavigator" class="jssort01" style="position:absolute;left:0px;bottom:0px;width:800px;height:172px;"  data-autocenter="1">
            <!-- Thumbnail Item Skin Begin -->
            <div data-u="slides" style="cursor: default;">
                <div data-u="prototype" class="p">
                    <div class="w">
                        <div data-u="thumbnailtemplate" class="t"></div>
                    </div>
                    <div class="c"></div>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>
       
    </div>
    <!-- #endregion Jssor Slider End -->
</section>

<footer class="twofooter"  >
 	<a href="wxmember/goshopcatList.do"  class="foot_guc">
 	 	<span class="iconfont icon-gouwuche1 icon2"></span><span class="shopcarnumber"  >${pd.shopnumber}</span>
 	</a>
	<a class="foot_gm" onclick="goPay()"><span>立即购买</span></a>
</footer>
	<a  href="javascript:void(0)" onclick="location.reload()" class="reflash"></a>	 <!-- 刷新链接 -->
</body>
 <script src="js/jquery-1.8.3.min.js"></script>
 <script src="js/wx/tongyong.js"></script>
<script type="text/javascript" src="js/lunbo/jssor.slider.mini.js"></script>
<script type="text/javascript" src="js/lunbo/slider.js"></script>
<script type="text/javascript">
$(function(){
 	$(".p").each(function(n,obj){
		var lunch=$(this).find("img").attr("lunch_id");
		if(lunch == "${pd.lunch_id}"){
 			$(this).click();
		}
	});
	
});

//返回
function backreturn(){
	window.location.href="wxmember/wxindex.do";
}

//添加进购物车   onclick="clikthisLunch()"
function clikthisLunch(){
	var lunch_id=$(".pav").find("img").attr("lunch_id");
	$.ajax({
		type:"post",
			url:"wxmember/addshopcart.do",
			data:{ "lunch_id":lunch_id ,"number":"1" },
			dataType:"json",
			success:function(data){
				  if(data.result == "1"){
					  $(".shopcarnumber").html(data.data);
				  }else{
					  alert(data.message);
				  }
			}
	});  
}
//前往支付界面
function goPay(){
	var lunch_id=$(".pav").find("img").attr("lunch_id");
	 window.location.href="wxmember/goPayJSP.do?shop_type=2&lunch_idstr="+lunch_id+"@1&order_type=1";
}


</script>
</html>