package com.jyw.entity.wx;

import java.text.DecimalFormat;
import java.util.List;
import java.util.TimerTask;

import com.jyw.util.PageData;
import com.jyw.util.ServiceHelper;
 
 
 
/**
 * 
* 类名称：第一笔订单的支付时间，倒计时十分钟
* 创建人：魏汉文  
* 创建时间：2016年4月7日 上午9:50:10
 */
public class DeliveryFeeTime extends TimerTask{
 
 	private String ordertime_id;//订单ID
     

	public   DeliveryFeeTime(){
		
	}

	public   DeliveryFeeTime(String ordertime_id ) {
 		this.ordertime_id = ordertime_id;
 	}

	
	@Override
	public void run() {
			/*
			 * 在定时器到时间的时候 
 			 */
			DecimalFormat    df   = new DecimalFormat("######0.00"); 
  		 	PageData pd=new PageData();
 		 	try { 
 		 		//获取所有订单
 		 		pd.put("ordertime_id", ordertime_id);
 		 		pd=ServiceHelper.getWxOrderService().getOrderTimeForId(pd);
 		 		if(pd != null){
 		 				String order_idstr=pd.getString("order_idstr");
 		 				//处理跑腿费用分配问题
	   					int goods_number=order_idstr.split(",").length;
	 					int delivery_fee=Integer.parseInt(ServiceHelper.getDelivery_feeService().getMoneyByNumber(String.valueOf(goods_number)));
	 					//根据份数获取总共多少钱
	 					int order_deliver_fee=ServiceHelper.getWxOrderService().sumDeliveryFeeByOrder(order_idstr);
	  					List<PageData> orderList=ServiceHelper.getWxOrderService().getOrderInfor(order_idstr);
	  					//每笔订单总共可以优惠多少钱
	 					double discount_money_every=(double)order_deliver_fee-delivery_fee/(double)orderList.size();
	 					for (PageData e : orderList) {
							e.put("now_integral", df.format(Double.parseDouble(e.getString("now_integral"))+discount_money_every));
							e.put("before_integral", e.getString("now_integral"));
							ServiceHelper.getWxmemberService().changeMoneyByMember(e);
							//新增财富记录
	 						e.put("money", df.format(discount_money_every));
							e.put("income", "1");
							e.put("wealth_type", "2");
							ServiceHelper.getWxmemberService().saveWealthHistory(e);
						}
 		 		}
  		 	} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
    
	public static void main(String[] age){
 	}

}
