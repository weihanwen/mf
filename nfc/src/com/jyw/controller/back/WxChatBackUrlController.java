package com.jyw.controller.back;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.wxpay.sdk.WXPayUtil;
import com.jyw.controller.base.BaseController;
import com.jyw.controller.wx.WxMemberController;
import com.jyw.util.Const;
import com.jyw.util.DateUtil;
import com.jyw.util.PageData;
import com.jyw.util.ServiceHelper;
import com.jyw.util.wxpay.WXPayPath;

/** 
 * 微信公众号的全部回调地址
 * @author Administrator
 *
 */
@Controller("wxChatBackUrlController")
@RequestMapping(value="/back_chat")
public class WxChatBackUrlController extends BaseController { 
	
	
	private String success= "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml> "; 
	private String notsuccess="<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[]]></return_msg></xml>";
	private String notsign="<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[签名错误]]></return_msg></xml>";
	private String notorder="<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[订单不存在]]></return_msg></xml>";
	private String notmoney="<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[金额不一致]]></return_msg></xml>";
 	
	
	 
	/**
	 * 微信支付回调接口
	* 方法名：Notify
	* wxback_chat/notify.do
	* 
    */
	@RequestMapping(value="/notify")
	@ResponseBody
	public void Notify(PrintWriter out,HttpServletRequest request) throws Exception{
 		String inputLine;
		StringBuilder sb =new StringBuilder();
		String resXml="";//返回数据
 		try {
			while ((inputLine = request.getReader().readLine()) != null) {
				sb.append(inputLine);
			}
			request.getReader().close();
			String xmlStr = sb.toString();
 			//验签
			WXPayPath dodo = new WXPayPath("3");
			boolean signflag=dodo.YanQian(xmlStr);
			if(!signflag){
				ServiceHelper.getWxmemberService().saveLog("01", "","回调的订单验签失败"+xmlStr);
				resXml=notsign;
			}else{
				Map<String, String> map =  WXPayUtil.xmlToMap( xmlStr );
 	 	 		//1.订单id
				String out_trade_no=(String)map.get("out_trade_no");
	 			//2.流水单号
				String tradnumber = (String) map.get("transaction_id");
	 			//3.总金额
				String total_fee=(String) map.get("total_fee");
				//4.支付类型  1-优惠买单支付，2-购买提货券商品,3-优选商品,4-充值商品
				String attach=(String) map.get("attach");
	 			//是否成功
				Object result_code=map.get("result_code");
				if("SUCCESS".equals(result_code)){ 
						 double ac_money=Double.parseDouble(total_fee)/100.00;
						 PageData pd=new PageData();
						 pd.put("order_id", out_trade_no);
 						 if(ServiceHelper.getWxOrderService().findById(pd) != null){
 							 String user_wx=ServiceHelper.getWxOrderService().findById(pd).getString("user_wx");
							 String order_type=ServiceHelper.getWxOrderService().findById(pd).getString("order_type");
							 if(Double.parseDouble(user_wx) != ac_money){
								 ServiceHelper.getWxmemberService().saveLog("04", "",Double.parseDouble(user_wx)+"回调得金额匹配不上"+ac_money+"==="+xmlStr);
							 }else{
 								 //修改订单状态
								 if(order_type.equals("1")){
									 pd.put("order_status", "2");
								 }else{
									 pd.put("order_status", "1");
								 }
								 pd.put("serial_number", tradnumber);
								 ServiceHelper.getWxOrderService().changeOrderStatus(pd);
								 WxMemberController.addPurchaseRecord(ServiceHelper.getWxOrderService().findById(pd));
							 }
						 }else{
							 ServiceHelper.getWxmemberService().saveLog("02", "","回调的订单验签失败"+xmlStr);
						 }
 			 	}else{
  					resXml=notsuccess;	 
				}		
			}
   		} catch (Exception e) {
			ServiceHelper.getWxmemberService().saveLog("03", "","Notify错误"+e.toString());
			e.printStackTrace();
 		}
 		out.write(resXml);
		out.close();
 	}
	
 
	
}
