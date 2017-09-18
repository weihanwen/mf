package com.jyw.util.wxpay;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import com.jyw.controller.base.BaseController;
import com.jyw.util.DateUtil;

public class test {

    public static void main(String[] args) throws Exception {
    	test t=new test();
     	t.Apipay();
     }
    
    public void Apipay() throws Exception{
    	//开始调用微信支付接口
    	String s=BaseController.get12UID();
		WXPayPath dodo = new WXPayPath();
	    Map<String, String> reqData=new HashMap<String, String>();
	    reqData.put("body", "支付订单");
	    reqData.put("attach","1");
	    reqData.put("out_trade_no", s);
    	reqData.put("fee_type", "CNY");
    	reqData.put("total_fee","1");
    	reqData.put("spbill_create_ip", dodo.getSpbill_create_ip());
    	reqData.put("notify_url", "http://www.jybd666.cn/back_chat/notify.do");
     	//JSAPI--公众号支付、NATIVE--原生扫码支付、APP--app支付，统一下单接口trade_type的传参可参考这里
    	//MICROPAY--刷卡支付，刷卡支付有单独的支付接口，不调用统一下单接口
    	reqData.put("trade_type", "JSAPI");
    	reqData.put("openid", "oJ6nY02FKz8dt_nRBBIqEpqfexZo");
        reqData.put("sign_type", WXPayConstants.MD5);
	    	Map<String, String> map2=dodo.unifiedOrder(reqData);
	    	Map<String, String> returnmap=new HashMap<String, String>();
	    	//开始处理结果
	        if(map2.get("return_code").toString().equals("SUCCESS") && map2.get("result_code").toString().equals("SUCCESS")  ){
	    	  returnmap.put("appId", map2.get("appid").toString());
	    	  returnmap.put("timeStamp", String.valueOf(WXPayUtil.getCurrentTimestamp()));
	    	  returnmap.put("nonceStr", WXPayUtil.generateNonceStr());
	    	  returnmap.put("package","prepay_id="+ map2.get("prepay_id").toString());
	    	  returnmap.put("signType", WXPayConstants.MD5);
	    	 //二次签名
	    	  String sign=dodo.AddSign(returnmap);
	    	  returnmap=WXPayUtil.xmlToMap(sign);
	    	  returnmap.put("result_code", map2.get("result_code").toString());
	       } 
	       returnmap.put("payment_type", "1");
	       returnmap.put("out_trade_no", s);
	       returnmap.put("return_code", map2.get("return_code").toString());
	       returnmap.put("return_msg", map2.get("return_msg").toString());
	       System.out.println("returnmap="+returnmap);
    }
    
   
    
}
