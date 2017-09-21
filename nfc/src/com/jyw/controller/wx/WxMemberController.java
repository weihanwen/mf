package com.jyw.controller.wx;


import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jyw.controller.base.BaseController;
import com.jyw.entity.wx.DeliveryFeeTime;
import com.jyw.entity.wx.OrderShop;
import com.jyw.entity.wx.WxLogin;
import com.jyw.service.business.AddressService;
import com.jyw.service.business.Carousel_figureService;
import com.jyw.service.business.CategoryService;
import com.jyw.service.business.Daily_menuService;
import com.jyw.service.business.Delivery_feeService;
import com.jyw.service.business.DiscountService;
import com.jyw.service.business.LunchService;
import com.jyw.service.business.Scheduled_timeService;
import com.jyw.service.wx.WxOrderService;
import com.jyw.service.wx.WxmemberService;
import com.jyw.util.Const;
import com.jyw.util.DateUtil;
import com.jyw.util.PageData;
import com.jyw.util.ServiceHelper;
import com.jyw.util.wxpay.WXPayConstants;
import com.jyw.util.wxpay.WXPayPath;
import com.jyw.util.wxpay.WXPayUtil;
 
 
/** 
 * 
* 类名称：HtmlMemberController   
* 类描述：  h5的页面
* 创建人：魏汉文  
* 创建时间：2016年5月26日 下午3:46:49
 */
@Controller("wxMemberController")
@RequestMapping(value="/wxmember")
public class WxMemberController extends BaseController {
	
	

	@Resource(name="wxmemberService")
	private WxmemberService wxmemberService;
	@Resource(name="categoryService")
	private CategoryService categoryService;//类别集合
	@Resource(name="scheduled_timeService")
	private Scheduled_timeService scheduled_timeService;//预定商品列表
	@Resource(name="lunchService")
	private LunchService lunchService;//商品列表
	@Resource(name="daily_menuService")
	private Daily_menuService daily_menuService;//正常商品菜品
	@Resource(name="carousel_figureService")
	private Carousel_figureService carousel_figureService;//轮播图
	@Resource(name="wxOrderService")
	private WxOrderService wxOrderService;//订单
	@Resource(name="delivery_feeService")
	private Delivery_feeService delivery_feeService;//配送费
	
	@Resource(name="discountService")
	private DiscountService discountService;
	
	
	/**
   	 * 获取商品列表
   	* wxmember/getLunchList.do
   	* 
   	* category_id  类别ID
    */
	@RequestMapping(value="/getLunchList")
	@ResponseBody
	public  Object getLunchList(String category_id,String order_type) throws Exception{
 		Map<String, Object> map = new HashMap<String, Object>();
 	  	String result="1";
		String message="获取成功";
		PageData pd=new PageData();
		try{
 			pd.put("category_id", category_id);
 			pd.put("order_type", order_type);
			if(order_type.equals("2")){
				pd.put("scheduled_time_id", pd.getString("scheduled_time_id"));
				List<PageData> ydList=scheduled_timeService.listAllNowDay(pd);
				map.put("data", ydList);
    		}else{
     			//3默认获取当日便当类别的所有
     			pd.put("day", DateUtil.getDay());
     			List<PageData> biandanList=daily_menuService.listAllNowDay(pd);
    			map.put("data", biandanList);
    		}
		}catch(Exception e){
			result="0";
			message="系统异常";
 			logger.error(e.toString(), e);
		}
		map.put("result", result);
		map.put("message", message);
 		return map;
 	}
	
	
	
	/**
	 * 前往个人中心
	 * wxmember/gome.do 
	 * 
	 *  返回值：用户信息  
	 *  session存储 Wxlogin  
 	 */
	@RequestMapping(value="/gome")
	public ModelAndView gome()throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
  		PageData pd = new PageData();
    	try {
    		if(login != null){
    			pd.put("wxmember_id", login.getWXMEMBER_ID());
        		pd.put("image_url", login.getIMAGE_URL());
        		pd.put("name", login.getNAME());
        		pd.put("showlook_id", login.getSHOWLOOK_ID());
        		pd.put("isuse", "0");
        		pd.put("isfrozen", "0");
        		//获取优惠券个数
        		String countYh=wxmemberService.getRedPackageNumber(pd);
        		//获取提货券个数
        		String countTh=wxmemberService.getRedPackageNumber(pd);
        		//获取积分余额
        		String now_integral=wxmemberService.getNowIntegral(pd);
        		pd.put("countYh", countYh);
        		pd.put("countTh", countTh);
        		pd.put("now_integral", now_integral);
        		pd.remove("isuse");
        		pd.remove("wxmember_id");
        		mv.addObject("pd", pd);
    			mv.setViewName("wx/wxme");
    		}else{
    			mv.setViewName("redirect:../wxlogin/toLoginWx.do");
    		}
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}

	
	/**
	 * 前往个人详情页面
	 * wxmember/gomedetail.do 
	 * 
	 *  返回值：用户信息  
	 *  session存储 Wxlogin  
 	 */
	@RequestMapping(value="/gomedetail")
	public ModelAndView gomedetail()throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
  		PageData pd = new PageData();
    	try {
    		if(login != null){
         		pd.put("image_url", login.getIMAGE_URL());
        		pd.put("name", login.getNAME());
        		pd.put("showlook_id", login.getSHOWLOOK_ID());
         		mv.addObject("pd", pd);
    			mv.setViewName("wx/wxmedetail");
    		}else{
    			mv.setViewName("redirect:../wxlogin/toLoginWx.do");
    		}
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}
	

	
	/**
	 * 去红包列表
	 * wxmember/myuseredList.do 
 	 */
	@RequestMapping(value="/myuseredList")
	public ModelAndView myuseredList()throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
  		PageData pd = new PageData();
    	try {
    		pd=this.getPageData();
    		if(login != null){
         		pd.put("wxmember_id", login.getWXMEMBER_ID());
        		List<PageData> redList=wxmemberService.getMyRedList(pd);
        		mv.addObject("redList", redList);
        		pd.remove("wxmember_id");
         		mv.addObject("pd", pd);
    			mv.setViewName("wx/myuseredList");
    		}else{
    			mv.setViewName("redirect:../wxlogin/toLoginWx.do");
    		}
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}

	/**
	 * 去提货卷列表
	 * wxmember/myusetihuojuanList.do 
  	 */
	@RequestMapping(value="/myusetihuojuanList")
	public ModelAndView myusetihuojuanList()throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
  		PageData pd = new PageData();
    	try { 
    		pd=this.getPageData();
    		if(login != null){
         		pd.put("wxmember_id", login.getWXMEMBER_ID());
        		List<PageData> tihuoredList=wxmemberService.getMyTiHuoList(pd);
         		mv.addObject("tihuoredList", tihuoredList);
         		pd.remove("wxmember_id");
         		mv.addObject("pd", pd);
    			mv.setViewName("wx/myusetihuojuanList");
    		}else{
    			mv.setViewName("redirect:../wxlogin/toLoginWx.do");
    		}
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}
	
	/**
	 * 去积分财富历史列表
	 * wxmember/myintegralList.do 
  	 */
	@RequestMapping(value="/myintegralList")
	public ModelAndView myintegralList()throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
  		PageData pd = new PageData();
    	try { 
    		pd=this.getPageData();
    		if(login != null){
         		pd.put("wxmember_id", login.getWXMEMBER_ID());
        		List<PageData> integralList=wxmemberService.getWealthHistoryList(pd);
         		mv.addObject("integralList", integralList);
         		pd.remove("wxmember_id");
         		mv.addObject("pd", pd);
    			mv.setViewName("wx/myintegralList");
    		}else{
    			mv.setViewName("redirect:../wxlogin/toLoginWx.do");
    		}
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}
	
	/**
	 * 去地址列表
	 * wxmember/myaddressList.do 
  	 */
	@RequestMapping(value="/myaddressList")
	public ModelAndView myaddressList()throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
  		PageData pd = new PageData();
    	try {
    		pd=this.getPageData();
    		if(login != null){
         		pd.put("wxmember_id", login.getWXMEMBER_ID());
        		List<PageData> addressList=wxmemberService.getMyAddressList(pd);
        		mv.addObject("addressList", addressList);
        		List<PageData>	alladdress = addressService.listAll(pd);
        		mv.addObject("alladdress", alladdress);
        		pd.remove("wxmember_id");
         		mv.addObject("pd", pd);
    			mv.setViewName("wx/myaddressList");
    		}else{
    			mv.setViewName("redirect:../wxlogin/toLoginWx.do");
    		}
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}

	/**
	 * 去订单列表
	 * wxmember/myorderList.do 
  	 */
	@RequestMapping(value="/myorderList")
	public ModelAndView myorderList()throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
  		PageData pd = new PageData();
    	try { 
    		pd=this.getPageData();
    		if(login != null){
         		pd.put("wxmember_id", login.getWXMEMBER_ID());
        		List<PageData> orderList=wxOrderService.listOrderForMember(pd);
         		mv.addObject("orderList", orderList);
         		pd.remove("wxmember_id");
         		mv.addObject("pd", pd);
    			mv.setViewName("wx/myorderList");
    		}else{
    			mv.setViewName("redirect:../wxlogin/toLoginWx.do");
    		}
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}
	
	
	/**
	 * 去订单详情页
	 * wxmember/myorderDetail.do 
  	 */
	@RequestMapping(value="/myorderDetail")
	public ModelAndView myorderDetail()throws Exception{
		ModelAndView mv = this.getModelAndView();
   		PageData pd = new PageData();
    	try { 
    		pd=this.getPageData();
    		pd=wxOrderService.findById(pd);
    		mv.addObject("pd", pd);
    		//获取相关购买商品列表
    		List<PageData> lunchList=wxOrderService.listLunchByOrder(pd);
     		mv.addObject("lunchList", lunchList);
    		mv.setViewName("wx/myorderDetail");
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	//=============================================================================================
	
	
	
	/**
	 * 前往订餐界面
	 * wxmember/wxindex.do 
	 * 
  	 */
	@RequestMapping(value="/wxindex")
	public ModelAndView wxindex()throws Exception{
		ModelAndView mv = this.getModelAndView();
  		PageData pd = new PageData();
    	try {
    		pd=this.getPageData();
    		//1.获取轮播图
 			List<PageData> lunboList=carousel_figureService.listAllOk(pd);
 			mv.addObject("lunboList", lunboList);
 			//2.获取分类类别
 			List<PageData> leibieList=categoryService.listAll(pd);
 			mv.addObject("leibieList", leibieList);
   			mv.setViewName("wx/wxindex");
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}
	
	
	/**
	 * 前往预定界面
	 * wxmember/yuding.do 
	 * 
  	 */
	@RequestMapping(value="/yuding")
	public ModelAndView yuding()throws Exception{
		ModelAndView mv = this.getModelAndView();
  		PageData pd = new PageData();
    	try {
    		pd=this.getPageData();
    		//2.获取分类类别
 			List<PageData> leibieList=categoryService.listAll(pd);
 			mv.addObject("leibieList", leibieList);
  			//获取最近三次得预定时间
  			List<PageData> ydList=scheduled_timeService.listThreeTime(pd);
 			mv.addObject("ydList", ydList);
  			
   			mv.setViewName("wx/yuding");
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}
	
	
	/**
	 * 前往商品的详情页
	 * wxmember/godetailBygoods.do 
	 * 
	 * lunch_id 商品ID
	 * category_id 类别ID
	 * order_type :  1-订单进入，2-预定进入
   	 */
	@RequestMapping(value="/godetailBygoods")
	public ModelAndView godetailBygoods(String lunch_id,String order_type,String category_id)throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
  		PageData pd = new PageData();
    	try {
    		if(login != null ){
    			//获取商品详情
        		pd.put("category_id", category_id);
        		pd.put("order_type", order_type);
        		if(order_type.equals("2")){
        			//直接购买
        		}else{
         			//3默认获取当日便当类别的所有
         			pd.put("day", DateUtil.getDay());
         			List<PageData> biandanList=daily_menuService.listAllNowDay(pd);
         			mv.addObject("varList", biandanList); 
         			mv.setViewName("wx/wxgoodsdetail");
        		}
        		pd.put("lunch_id", lunch_id);
        		//获取购物车数量
        		pd.put("wxmember_id", login.getWXMEMBER_ID());
        		pd.put("shopnumber", wxmemberService.countShopcartNumber(pd));
        		pd.remove("wxmember_id");
    		}else{
    			mv.setViewName("redirect:../wxlogin/toLoginWx.do");
    		}
         } catch (Exception e) {
   			e.printStackTrace();
 		}
    	mv.addObject("pd", pd); 
  		return mv;
	}
	
	
	
	/**
   	 * 添加金额购物车
   	* wxmember/addshopcart.do
   	* 
   	* lunch_id  商品ID
   	* number  加1减-1
   	 */
	@RequestMapping(value="/addshopcart")
	@ResponseBody
	public  Object addshopcart(HttpServletRequest request,String lunch_id,String number) throws Exception{
 		Map<String, Object> map = new HashMap<String, Object>();
 		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
	  	String result="1";
		String message="添加成功";
		PageData pd=new PageData();
		try{
			if(login == null){
				result="0";
				message="登录身份失效，请重新登录";
			}else{
				pd.put("wxmember_id", login.getWXMEMBER_ID()) ;
				pd.put("lunch_id", lunch_id);
				boolean flag=true;
				PageData messagepd=isKunCunOK(lunch_id, number, "1" );
				flag=(boolean)messagepd.get("flag");
				message=messagepd.getString("message");
 				if(flag){
					//判断购物车是否有当前的商品
					PageData shoppd=wxmemberService.findShopCartById(pd);
					if(shoppd == null){
						String shopcart_id=BaseController.get10UID();
						pd.put("shopcart_id", shopcart_id);
						wxmemberService.saveShopCartById(pd);
					}else{
						if(shoppd.getString("shop_number").equals("1") && number.equals("-1")){
							wxmemberService.deleteShopCartById(shoppd);
						}else{
 							shoppd.put("number", number);
							wxmemberService.updateShopCartById(shoppd);
	 					}
					}
				}else{
					result="0";
 				}
				
				map.put("data", wxmemberService.countShopcartNumber(pd));
  			}
 		}catch(Exception e){
			result="0";
			message="系统异常";
 			logger.error(e.toString(), e);
		}
		map.put("result", result);
		map.put("message", message);
 		return map;
 	}
	
	 

	/**
	 * 前往购物车列表
	 * wxmember/goshopcatList.do 
     */
	@RequestMapping(value="/goshopcatList")
	public ModelAndView goshopcatList()throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
  		PageData pd = new PageData();
    	try {
    		if(login != null ){
    			pd.put("wxmember_id", login.getWXMEMBER_ID());
    			//获取购物车列表
    			List<PageData> shopList=wxmemberService.findShopCartList(pd);
    			mv.addObject("shopList", shopList);
     			mv.setViewName("wx/shopcartlist");
     		}else{
    			mv.setViewName("redirect:../wxlogin/toLoginWx.do");
    		}
         } catch (Exception e) {
   			e.printStackTrace();
 		}
    	mv.addObject("pd", pd); 
  		return mv;
	}
	/**
	 * 计算总价
	 * wxmember/countAllShopMoney.do
	 * 
	 * allshopcart_id  商品所有ID集合
 	 */
	@RequestMapping(value="/countAllShopMoney")
	@ResponseBody
	public  Object countAllShopMoney(String allshopcart_id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
 		String result="1";
		String message="统计完成";
		PageData pd=new PageData();
		try{
			pd.put("allshopcart_id", allshopcart_id);
			map.put("data", wxmemberService.sumShopcartById(pd));
 		}catch(Exception e){
			result="0";
			message="系统异常";
			logger.error(e.toString(), e);
		}
		map.put("result", result);
		map.put("message", message);
 		return map;
	}
	
	/**
	 * 去支付界面
	 * wxmember/goPayJSP.do?shop_type=1&allshopcart_id=&order_type=1&lunch_idstr=&wxmember_address_id=&wxmember_redpackage_id=&wxmember_tihuojuan_idstr=
	 * 
	 * shop_type 		1-购物车购买，2-直接购买
 	 * allshopcart_id  	购物车结算嘚所有购物车ID
	 * lunch_idstr   	ID@数量
	 * order_type  		1-点餐，2-预定
	 * scheduled_time_id 预定ID
	 * 
	 * 二次加载可能嘚参数
	 * wxmember_address_id  		地址id
	 * wxmember_redpackage_id  		使用红包id
	 * wxmember_tihuojuan_idstr		使用嘚提货卷ID
	 * ydtime 预定时间
      */
	@RequestMapping(value="/goPayJSP")
	public ModelAndView goPayJSP()throws Exception{
		ModelAndView mv = this.getModelAndView();
		DecimalFormat    df   = new DecimalFormat("######0.00"); 
		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
  		PageData pd = new PageData();
    	try {
    		pd=this.getPageData();
    		if(login != null ){
    			pd.put("wxmember_id", login.getWXMEMBER_ID());
    			mv.addObject("nowintegral", wxmemberService.getNowIntegral(pd));
    			String shop_type=pd.getString("shop_type");
    			double allmoney=0;
    			double alldiscountmoney=0;
    			double allsendjf=0;
    			double delivery_fee=0;
    			//当前已购买订单数
    			int countordernumber=wxOrderService.countordernumber(pd)+1;
    			if(shop_type.equals("1")){
    				//获取购买商品列表
        			List<PageData> shopList=wxmemberService.findShopCartList(pd);
        			PageData discountpd=null;
        			double tuiguan_discount=0;
        			int shop_number=0;
        			for (PageData e : shopList) {
						e.put("ordernumber", countordernumber);
						allsendjf=Double.parseDouble(e.getString("send_integral"));
						allmoney=Double.parseDouble(e.get("allsale_money").toString());
						shop_number+=Integer.parseInt(e.get("shop_number").toString());
						discountpd=discountService.findById(e);
						if(discountpd != null){
							alldiscountmoney+=Double.parseDouble(discountpd.get("reduce_money").toString())*Integer.parseInt(e.get("shop_number").toString());
							tuiguan_discount+=Double.parseDouble(discountpd.get("reduce_money").toString())*Integer.parseInt(e.get("shop_number").toString());
							allsendjf+=Double.parseDouble(discountpd.get("send_integral").toString());
  						}
					}
        			mv.addObject("tuiguan_discount", df.format(tuiguan_discount));
        			mv.addObject("shopList", shopList);
        			//获取配送详情
    				PageData pspd=delivery_feeService.getPeiSongDetail(shop_number+"");
    				double chmoney=Double.parseDouble(pspd.getString("chmoney"));
    				mv.addObject("chmoney", String.valueOf(chmoney));
    				double ptmoney=Double.parseDouble(pspd.getString("ptmoney"));
    				mv.addObject("ptmoney", String.valueOf(ptmoney));
        			//配送费+餐盒费
        			delivery_fee=chmoney+ptmoney;
     			}else{
    				String lunch_id=pd.getString("lunch_idstr").split("@")[0];
    				pd.put("lunch_id", lunch_id);
    				String shop_number=pd.getString("lunch_idstr").split("@")[1];
    				//获取商品详情
    				PageData lunchpd=lunchService.findByIdForWx(pd);
    				lunchpd.put("shop_number", shop_number);
    				allsendjf=Integer.parseInt(lunchpd.get("send_integral").toString())*Integer.parseInt(shop_number);
    				lunchpd.put("ordernumber", countordernumber);
    				PageData discountpd=discountService.findById(lunchpd);
    				if(discountpd != null){
						alldiscountmoney+=Double.parseDouble(discountpd.get("reduce_money").toString())*Integer.parseInt(shop_number);
						allsendjf+=Double.parseDouble(discountpd.get("send_integral").toString())*Integer.parseInt(shop_number);
						mv.addObject("tuiguan_discount", df.format(alldiscountmoney));
						if(pd.getString("order_type").equals("2")){
							double yddicount=Double.parseDouble(discountpd.get("ydreduce_money").toString())*Integer.parseInt(shop_number);
 							mv.addObject("yddiscount", df.format(yddicount));
 							alldiscountmoney+=yddicount;
						}
					}
    				allmoney=Double.parseDouble(lunchpd.get("sale_money").toString())*Integer.parseInt(shop_number);
    				lunchpd.put("allsale_money", df.format(allmoney));
    				mv.addObject("lunchpd", lunchpd);
    				//获取配送详情
    				PageData pspd=delivery_feeService.getPeiSongDetail(shop_number);
    				double chmoney=Double.parseDouble(pspd.getString("chmoney"));
    				mv.addObject("chmoney", String.valueOf(chmoney));
    				double ptmoney=Double.parseDouble(pspd.getString("ptmoney"));
    				mv.addObject("ptmoney", String.valueOf(ptmoney));
     				//配送费+餐盒费
    				delivery_fee=chmoney+ptmoney;
     			}
     			mv.addObject("delivery_fee", df.format(delivery_fee));
    			mv.addObject("allmoney", df.format(allmoney));
    			double lesspaymoney=allmoney+delivery_fee;
     			//判断是否使用提货卷
     			if(pd.getString("wxmember_tihuojuan_idstr") != null &&  !pd.getString("wxmember_tihuojuan_idstr").equals("")){
     				String[] thjstr=pd.getString("wxmember_tihuojuan_idstr").split(",");
      				for (int i = 0; i < thjstr.length; i++) {
						pd.put("wxmember_tihuojuan_id", thjstr[i]);
						alldiscountmoney+=Integer.parseInt(wxmemberService.getTiHuoJuanMoneyById(pd));
					}
     				pd.remove("wxmember_tihuojuan_id");
     				pd.put("wxmember_redpackage_id", "");
      			}else{
     				//判断是否使用红包
         			if(pd.getString("wxmember_redpackage_id") != null && !pd.getString("wxmember_redpackage_id").equals("")){
         				mv.addObject("redmoney", wxmemberService.getRedPackageMoneyById(pd)+"元红包");
         				alldiscountmoney+=Integer.parseInt(wxmemberService.getRedPackageMoneyById(pd));
        			}
     			}
     			lesspaymoney=lesspaymoney-alldiscountmoney;
    			mv.addObject("discount_money", df.format(alldiscountmoney));
    			mv.addObject("allsendjf", df.format(allsendjf));
    			mv.addObject("actual_money", df.format(lesspaymoney));
    			//判断是否有选择地址
    			if(pd.getString("wxmember_address_id") != null && !pd.getString("wxmember_address_id").equals("") ){
    				mv.addObject("address", wxmemberService.findAddressDetail(pd).getString("address"));
    			}
    			//设置时间
    			if(pd.getString("order_type").equals("1")){
     				mv.addObject("delivery_time", DateUtil.getAfterMinTime(DateUtil.getTime(), Const.arrivetime));
    				mv.addObject("reserve_arrival_time", DateUtil.getAfterMinTime(DateUtil.getTime(), Const.arrivetime));
    				mv.addObject("showtime", DateUtil.getAfterMinTime(DateUtil.getTime(), Const.arrivetime));
    			}else{
    				PageData daypd=scheduled_timeService.findById(pd);
             		mv.addObject("daypd",daypd);
             		String day=daypd.get("day").toString();
             		String sale_starttime=daypd.get("sale_starttime").toString();
             		String sale_endtime=daypd.get("sale_endtime").toString();
             		//将预定时间分为几个option
             		List<String> ydtimeList=new ArrayList<String>();
             		String zhuan_time=day+" "+sale_starttime;
             		boolean flag=true;
              		while(flag){
              			long n1=DateUtil.fomatDate1(day+" "+sale_starttime).getTime();
              			long n2=DateUtil.fomatDate1(day+" "+sale_endtime).getTime();
               			String after_time=DateUtil.getAfterMinTime(zhuan_time, "30");
               			long n3=DateUtil.fomatDate1(after_time).getTime();
                		if(n1< n3 && n3 < n2){
                			zhuan_time=after_time;
                			ydtimeList.add(DateUtil.getAfterMinTime2(after_time, "0"));
               			}else{
               				flag=false;
               			}
              		}
              		mv.addObject("ydtimeList",ydtimeList);
    			}
     			mv.setViewName("wx/orderpay");
     		}else{
    			mv.setViewName("redirect:../wxlogin/toLoginWx.do");
    		}
         } catch (Exception e) {
   			e.printStackTrace();
 		}
    	mv.addObject("pd", pd); 
  		return mv;
	}
	
	@Resource(name="addressService")
	private AddressService addressService;

	/**
	 * 去选择地址页面
	 * wxmember/changeAddress.do 
	 * 
	 * shop_type 		1-购物车购买，2-直接购买
 	 * allshopcart_id  	购物车结算嘚所有购物车ID
	 * lunch_idstr   	ID@数量
	 * order_type  		1-点餐，2-预定
	 * 
	 * 二次加载可能嘚参数
	 * wxmember_address_id  		地址id
	 * wxmember_redpackage_id  		使用红包id
	 * wxmember_tihuojuan_idstr		使用嘚提货卷ID *  
 	 */
	@RequestMapping(value="/changeAddress")
	public ModelAndView changeAddress()throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
  		PageData pd = new PageData();
    	try {
    		pd=this.getPageData();
    		if(login != null){
         		pd.put("wxmember_id", login.getWXMEMBER_ID());
        		List<PageData> addressList=wxmemberService.getMyAddressList(pd);
        		mv.addObject("addressList", addressList);
        		List<PageData>	alladdress = addressService.listAll(pd);
        		mv.addObject("alladdress", alladdress);
        		pd.remove("wxmember_id");
         		mv.addObject("pd", pd);
    			mv.setViewName("wx/address");
    		}else{
    			mv.setViewName("redirect:../wxlogin/toLoginWx.do");
    		}
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}

	
	/**
   	 * 搜索地址
   	* wxmember/getLikeAddress.do
   	* 
   	* address 地址
   	 */
	@RequestMapping(value="/getLikeAddress")
	@ResponseBody
	public  Object getLikeAddress(String address) throws Exception{
 		Map<String, Object> map = new HashMap<String, Object>();
	  	String result="1";
		String message="查询成功";
		PageData pd=new PageData();
		try{
			pd.put("address", address);
			List<PageData> likeaddressList=wxmemberService.findlikeAddressList(pd);
			map.put("likeaddressList", likeaddressList);
		}catch(Exception e){
			result="0";
			message="系统异常";
 			logger.error(e.toString(), e);
		}
		map.put("result", result);
		map.put("message", message);
 		return map;
 	}
	

	/**
   	 * 新增地址
   	* wxmember/addAddress.do
   	* 
   	* address 地址
   	 */
	@RequestMapping(value="/addAddress")
	@ResponseBody
	public  Object addAddress() throws Exception{
 		Map<String, Object> map = new HashMap<String, Object>();
 		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
	  	String result="1";
		String message="新增成功";
		PageData pd=new PageData();
		try{
			if(login != null){
          		 pd=this.getPageData();
         		 String wxmember_address_id= BaseController.get12UID();
    			 pd.put("wxmember_address_id",wxmember_address_id);
    			 pd.put("wxmember_id", login.getWXMEMBER_ID());
    			 wxmemberService.saveAddress(pd);
    			 map.put("wxmember_address_id", wxmember_address_id);
			}else{
				result="0";
				message="请先登录";
			}
 		}catch(Exception e){
			result="0";
			message="系统异常";
 			logger.error(e.toString(), e);
		}
		map.put("result", result);
		map.put("message", message);
 		return map;
 	}
	

	/**
	 * 去餐盒说明界面
	 * wxmember/canheDetail.do 
	 * 
	 * wxmember_address_id  		地址id
 	 */
	@RequestMapping(value="/canheDetail")
	public ModelAndView canheDetail()throws Exception{
		ModelAndView mv = this.getModelAndView();
   		PageData pd = new PageData();
    	try {
    		pd=this.getPageData();
    		PageData addresspd=wxmemberService.findAddressDetail(pd);
    		if(addresspd !=null){
    			addresspd.put("order_status", "2");
    			//获取同个地址得正在订餐得同事：根据地址检索，今天正在配送订单得同事
        		List<PageData>  timeList=wxOrderService.listByStatusOrderOne(addresspd);
        		mv.addObject("timeList", timeList);
        		String endtime="0";
        		if(timeList.size() >0 ){
        			endtime=timeList.get(timeList.size()-1).get("endtime").toString();
        		}
        		mv.addObject("less_time", endtime);
        		//获取所有成功订餐得同事：按时间排序，最近得10份订单得，已完成得
        		addresspd.put("order_status", "3");
        		List<PageData> overList=wxOrderService.listByStatusOrderTwo(addresspd);
        		mv.addObject("overList", overList);
        		mv.addObject("overnumber", overList.size());
     		}
     		mv.addObject("pd", pd);
			mv.setViewName("wx/ptdetail");
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}
	
	
	
	/**
	 * 去使用红包界面
	 * wxmember/gouserRed.do 
	 * 
	 * shop_type 		1-购物车购买，2-直接购买
 	 * allshopcart_id  	购物车结算嘚所有购物车ID
	 * lunch_idstr   	ID@数量
	 * order_type  		1-点餐，2-预定
	 * 
	 * 二次加载可能嘚参数
	 * wxmember_address_id  		地址id
	 * wxmember_redpackage_id  		使用红包id
	 * wxmember_tihuojuan_idstr		使用嘚提货卷ID *  
 	 */
	@RequestMapping(value="/gouserRed")
	public ModelAndView gouserRed()throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
  		PageData pd = new PageData();
    	try {
    		pd=this.getPageData();
    		if(login != null){
         		pd.put("wxmember_id", login.getWXMEMBER_ID());
        		List<PageData> redList=wxmemberService.getMyRedList(pd);
        		mv.addObject("redList", redList);
        		pd.remove("wxmember_id");
         		mv.addObject("pd", pd);
    			mv.setViewName("wx/usered");
    		}else{
    			mv.setViewName("redirect:../wxlogin/toLoginWx.do");
    		}
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}
	
	

	/**
	 * 去使用提货卷界面
	 * wxmember/gouserTiHuoJuan.do 
	 * 
	 * shop_type 		1-购物车购买，2-直接购买
 	 * allshopcart_id  	购物车结算嘚所有购物车ID
	 * lunch_idstr   	ID@数量
	 * order_type  		1-点餐，2-预定
	 * 
	 * 二次加载可能嘚参数
	 * wxmember_address_id  		地址id
	 * wxmember_redpackage_id  		使用红包id
	 * wxmember_tihuojuan_idstr		使用嘚提货卷ID *  
 	 */
	@RequestMapping(value="/gouserTiHuoJuan")
	public ModelAndView gouserTiHuoJuan()throws Exception{
		ModelAndView mv = this.getModelAndView();
		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
  		PageData pd = new PageData();
    	try { 
    		pd=this.getPageData();
    		if(login != null){
         		pd.put("wxmember_id", login.getWXMEMBER_ID());
        		List<PageData> tihuoredList=wxmemberService.getMyTiHuoList(pd);
        		for (PageData e : tihuoredList) {
//        			System.out.println(Double.parseDouble(pd.getString("allmoney"))-Double.parseDouble(e.get("money").toString()));
					if(Double.parseDouble(pd.getString("allmoney"))-Double.parseDouble(e.get("money").toString()) >=0){
						e.put("isok", "1");
					}else{
						e.put("isok", "0");
					}
				}
        		mv.addObject("tihuoredList", tihuoredList);
        		mv.addObject("number", tihuoredList.size()  );
        		pd.remove("wxmember_id");
         		mv.addObject("pd", pd);
    			mv.setViewName("wx/usetihuojuan");
    		}else{
    			mv.setViewName("redirect:../wxlogin/toLoginWx.do");
    		}
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}
	
	
	
	
	/**
   	 * 微信支付的订单交易支付接口
   	* 方法名称:：payorder 
   	* 方法描述：订单支付接口
   	* wxmember/payorder.do
   	* 
	 * shop_type 		1-购物车购买，2-直接购买
 	 * allshopcart_id  	购物车结算嘚所有购物车ID
	 * lunch_idstr   	ID@数量
	 * order_type       1-点餐购买，2-预定购买
   	* 
   	 */
	@RequestMapping(value="/payorder")
	@ResponseBody
	public  synchronized Object PayOrder(HttpServletRequest request) throws Exception{
 		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, String> data = new HashMap<String, String>();
		//shiro管理的session
 		Subject currentUser = SecurityUtils.getSubject();  
 		Session session = currentUser.getSession();
 		WxLogin login=(WxLogin) session.getAttribute(Const.WXLOGIN);
	  	String result="1";
		String message="支付成功";
		PageData pd=new PageData();
		try{
			pd = this.getPageData();
			System.out.println(pd.toString());
 			if(login == null){
 				map.put("result", "0");
				map.put("message", "请先前往登录。。。");
				map.put("data", "");
				return map;
			}
 			pd.put("wxmember_id", login.getWXMEMBER_ID());
 			String now_integral=wxmemberService.getNowIntegral(pd);
 			String use_integral=pd.getString("use_integral");
 			if(Double.parseDouble(now_integral) < Double.parseDouble(use_integral)){
 				map.put("result", "0");
				map.put("message", "积分不足!");
				map.put("data", "");
				return map;
 			}
 			//设置订单号
			String order_id=BaseController.getTimeID();
			pd.put("order_id", order_id);
			pd.put("looknumber", BaseController.get8UID());
			//如果是直接购买需要判断库存
			String shop_type=pd.getString("shop_type");
			String order_type=pd.getString("order_type");
 			if(shop_type.equals("2") ){
				String lunch_id=pd.getString("lunch_idstr").split("@")[0];
				String number=pd.getString("lunch_idstr").split("@")[1];
				if(order_type.equals("1")){
					PageData messagepd=isKunCunOK(lunch_id, number, "1" );
					boolean flag=(boolean)messagepd.get("flag");
					if(!flag){
						map.put("result", "0");
						map.put("message", messagepd.getString("message"));
						map.put("data", "");
						return map;
					}
				}
 				//存入tb_order_lunch
				 PageData olpd=new PageData();
				 olpd.put("order_id", order_id);
				 olpd.put("lunch_id", lunch_id);
				 olpd.put("shop_number", number);
				 wxOrderService.saveOrderLunch(olpd);
				//添加库存嘚定时器-5分钟订单未支付退还到账户
 			 	 OrderShop op=new OrderShop(order_id);
				 Timer tt=new Timer();
				 tt.schedule(op, 1000*60*5);
  			}else{
  				String[] allshopcart_id=pd.getString("allshopcart_id").split(",");
  				PageData shoppd=null;
  				for (int i = 0; i < allshopcart_id.length; i++) {
					String string = allshopcart_id[i];
					shoppd=new PageData();
					shoppd.put("shopcart_id", string);
					shoppd=wxmemberService.findShopCartById(shoppd);
					if(shoppd != null){
						shoppd.put("order_id", order_id);
						wxOrderService.saveOrderLunch(shoppd);
 					}
					shoppd=null;
 				}
  			}
 			//获取微信支付嘚信息
  			String use_wx=pd.getString("use_wx");
 			if(Double.parseDouble(use_wx) > 0){
				//新增微支付完成订单
 				wxOrderService.saveOrder(pd);
 				data=WxPayOrder(use_wx, "1", order_id, wxmemberService.findById(pd).getString("open_id"));
  			}else{
				//新增已支付完成订单
				if(order_type.equals("2")){
					pd.put("order_status", "1");
				}else{
					pd.put("order_status", "2");
				}
				wxOrderService.saveOrder(pd);
 				addPurchaseRecord(pd);
 				data.put("out_trade_no", order_id);
  			}
 		}catch(Exception e){
			result="0";
			message="系统异常";
 			logger.error(e.toString(), e);
		}
		map.put("result", result);
		map.put("message", message);
		map.put("data", data);
 		return map;

	}
	
	
	
	/**
	 * 支付成功前往得页面
	 * wxmember/payok.do 
  	 */
	@RequestMapping(value="/payok")
	public ModelAndView payok()throws Exception{
		ModelAndView mv = this.getModelAndView();
   		PageData pd = new PageData();
    	try { 
    		pd=this.getPageData();
    		mv.addObject("pd", pd);
     		mv.setViewName("wx/payok");
        } catch (Exception e) {
   			e.printStackTrace();
 		}
  		return mv;
	}
	
	/**
	 * 处理跑腿费得分配问题
	 * @param order_id
	 * @param shopgoodsnumber
	 * @throws Exception 
	 */
	public synchronized static void DeliveryTime(PageData orderpd) throws Exception{
		DecimalFormat    df   = new DecimalFormat("######0.00"); 
		int shopgoodsnumber=0;
 		try {
 			if(orderpd.getString("shop_type").equals("2") && orderpd.getString("order_type").equals("1")){
 				String number=orderpd.getString("lunch_idstr").split("@")[1];
				shopgoodsnumber=Integer.parseInt(number);
   			}else{
  				String[] allshopcart_id=orderpd.getString("allshopcart_id").split(",");
  				PageData shoppd=null;
  				for (int i = 0; i < allshopcart_id.length; i++) {
					String string = allshopcart_id[i];
					shoppd=new PageData();
					shoppd.put("shopcart_id", string);
 					if(ServiceHelper.getWxmemberService().findShopCartById(shoppd) != null){
 						 shopgoodsnumber+=Integer.parseInt(ServiceHelper.getWxmemberService().findShopCartById(shoppd).getString("shop_number"));
 					}
					shoppd=null;
 				}
  			}
 			//判断当前是不是第一笔订单---需要数量以及订单ID
 			String order_id=orderpd.getString("order_id");
 			String address=ServiceHelper.getWxmemberService().findAddressDetail(orderpd).getString("address");
 			orderpd.put("address", address);
 			PageData timepd=ServiceHelper.getWxOrderService().isHavingOrderByNow(orderpd);
 			String order_idnumber="";
 			for (int i = 0; i < shopgoodsnumber; i++) {
 				order_idnumber+=order_id+",";
 			}
 			if(timepd == null){
 				timepd=new PageData();
 				String ordertime_id=BaseController.getTimeID();
 				timepd.put("ordertime_id", ordertime_id);
 				timepd.put("order_idstr", order_idnumber);
 				timepd.put("address", address);
 				timepd.put("createtime", DateUtil.getTime());
 				timepd.put("endtime", DateUtil.getAfterMinTime(DateUtil.getTime(), "10"));
 				ServiceHelper.getWxOrderService().saveOrderTime(timepd);
  				//添加定时器-10分钟订单未支付退还到账户
			 	 DeliveryFeeTime op=new DeliveryFeeTime(ordertime_id);
				 Timer tt=new Timer();
				 tt.schedule(op, 1000*60*10);
  			}else{
 				String order_idstr=timepd.getString("order_idstr")+order_idnumber;
 				timepd.put("version", timepd.getString("version"));
 				timepd.put("order_idstr", order_idstr);
 				if(order_idstr.split(",").length >= 5){
 					timepd.put("ok", "1");
 					int n=ServiceHelper.getWxOrderService().updateOrderTime(timepd);
 					if(n == 0){
 						DeliveryTime(orderpd);
 					}
 					//处理跑腿费用分配问题
   					int goods_number=order_idstr.split(",").length;
// 					double delivery_fee=Double.parseDouble(ServiceHelper.getDelivery_feeService().getMoneyByNumber(String.valueOf(goods_number)));
// 					//根据份数获取总共多少钱
// 					int order_deliver_fee=ServiceHelper.getWxOrderService().sumDeliveryFeeByOrder(order_idstr);
  					List<PageData> orderList=ServiceHelper.getWxOrderService().getOrderInfor(order_idstr);
  					//每笔订单总共可以优惠多少钱
// 					double discount_money_every=(double)order_deliver_fee-delivery_fee/(double)orderList.size();
 					for (PageData e : orderList) {
						e.put("now_integral", df.format(Double.parseDouble(e.getString("now_integral"))+Double.parseDouble(e.getString("delivery_fee"))));
						e.put("before_integral", e.getString("now_integral"));
						ServiceHelper.getWxmemberService().changeMoneyByMember(e);
						//新增财富记录
 						e.put("money", e.getString("delivery_fee"));
						e.put("income", "1");
						e.put("wealth_type", "2");
						ServiceHelper.getWxmemberService().saveWealthHistory(e);
					}
  				}else{
 					timepd.put("order_idstr", order_idstr+","+order_idnumber);
 					int n=ServiceHelper.getWxOrderService().updateOrderTime(timepd);
 					if(n == 0){
 						DeliveryTime(orderpd);
 					}
 				}
 			}
 			 //删除购物车
			 ServiceHelper.getWxmemberService().deleteShopCartById(orderpd);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			ServiceHelper.getWxmemberService().saveLog("03", "","DeliveryTime新增记录出现错误"+e.toString());
		}
 	}
	
 	//支付成功之后得一些记录处理
	public static void addPurchaseRecord(PageData pd) throws Exception{
		DecimalFormat    df   = new DecimalFormat("######0.00"); 
		try {
			if(pd.getString("use_integral") == null || pd.getString("use_integral").equals("")){
				pd.put("use_integral", "0");
			}
			if(pd.getString("send_integral") == null || pd.getString("send_integral").equals("")){
				pd.put("send_integral", "1");
			}
			//新增积分使用历史记录
			PageData wealpd=new PageData();
			wealpd.put("wxmember_wealthhistory_id", BaseController.getTimeID());
			wealpd.put("wxmember_id", pd.getString("wxmember_id"));
			wealpd.put("order_id", pd.getString("order_id"));
			wealpd.put("money", pd.getString("use_integral"));
			wealpd.put("isincome", "2");
			wealpd.put("wealth_type", "1");
			ServiceHelper.getWxmemberService().saveWealthHistory(wealpd);	
			//新增赠送积分记录
			wealpd=new PageData();
			wealpd.put("wxmember_wealthhistory_id", BaseController.getTimeID());
			wealpd.put("wxmember_id", pd.getString("wxmember_id"));
			wealpd.put("order_id", pd.getString("order_id"));
			wealpd.put("money", pd.getString("send_integral"));
			wealpd.put("isincome", "1");
			wealpd.put("wealth_type", "3");
			ServiceHelper.getWxmemberService().saveWealthHistory(wealpd);	
			//更新会员积分
			double _integral=Double.parseDouble(pd.getString("use_integral"))-Double.parseDouble(pd.getString("send_integral"));
			double now_integral=Double.parseDouble(ServiceHelper.getWxmemberService().getNowIntegral(pd));
 			wealpd.put("now_integral", df.format(now_integral-_integral));
			wealpd.put("before_integral", now_integral);
			ServiceHelper.getWxmemberService().changeMoneyByMember(wealpd);
			
			if(pd.getString("order_type").equals("1")){
				//处理跑腿费分配问题
				DeliveryTime(pd);
			}
 		} catch (Exception e) {
			// TODO: handle exception
 			e.printStackTrace();
			ServiceHelper.getWxmemberService().saveLog("03", "","addPurchaseRecord新增记录出现错误"+e.toString());
		}
	}

	
	
	
	
	
	
	/**
	 * 判断当前商品嘚库存是否充足
	 * @param lunch_id 商品ID
	 * @param number 购买嘚数量
	 * @return type 1-点餐，2-预定
	 */
	public synchronized static PageData isKunCunOK(String lunch_id,String number,String type){
		PageData messagepd=new PageData();
		messagepd.put("flag", true);
		messagepd.put("message", "");
		PageData kcpd=new PageData();
		try {
			kcpd.put("lunch_id", lunch_id);
			//获取当前库存以及版本号比对库存
			kcpd=ServiceHelper.getLunchService().findByIdForKunCun(kcpd);
			if(kcpd == null){
				messagepd.put("flag", false);
				messagepd.put("message", "商品不存在");
				return messagepd;
			}
			if(type.equals("1")){
				String dc_stocknumber=kcpd.get("dc_stocknumber").toString();
				if(Integer.parseInt(dc_stocknumber) < Integer.parseInt(number)){
					messagepd.put("flag", false);
					messagepd.put("message", "库存不足");
					return messagepd;
				}
				PageData newpd=new PageData();
				newpd.put("lunch_id", lunch_id);
 				String dc_version=kcpd.getString("dc_version");
 				newpd.put("dc_stocknumber", String.valueOf(Integer.parseInt(dc_stocknumber)-Integer.parseInt(number)));
 				newpd.put("dc_version", dc_version);
				int n=ServiceHelper.getLunchService().editStock(newpd);
				if( n == 0){
					isKunCunOK( lunch_id, number, type);
				}
  			}else{
// 				String yd_stocknumber=kcpd.getString("yd_stocknumber");
//				if(Integer.parseInt(yd_stocknumber) < Integer.parseInt(number)){
//					return false;
//				}
//				String yd_version=kcpd.getString("yd_version");
//  				PageData newpd=new PageData();
//				newpd.put("yd_stocknumber", String.valueOf(Integer.parseInt(yd_stocknumber)-Integer.parseInt(number)));
// 				if(number.equals("1")){
//					newpd.put("yd_version", String.valueOf(Integer.parseInt(yd_version)+1));
//					newpd.put("lunch_id", lunch_id);
//					if(lunchService.findByIdForKunCun(kcpd).getString("yd_version").equals(newpd.getString("yd_version"))){
//						return false;
//					}
//				}
// 				lunchService.editStock(newpd);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			messagepd.put("flag", false);
			messagepd.put("message", "系统错误");
		}
  		return messagepd;
  	}
	
	/**
	 * 公众号微信支付
	 * html_member/wxpayorder.do?total_fee=0.01&attach=1&body=购买商品
	 * 
	 * total_fee  金额
	 * attach     支付类型  1-支付，2-充值
	 * body       商品说明
	 * out_trade_no   订单ID
	 */
	public static Map<String, String> WxPayOrder(String _total_fee,String attach,String out_trade_no,String openid) throws Exception{
		Map<String, String> returnmap=new HashMap<String, String>();
   		try {
    		BigDecimal total_fee = new BigDecimal(Double.parseDouble(_total_fee)*100);
  	    	//开始调用微信支付接口
  			WXPayPath dodo = new WXPayPath();
 	    	Map<String, String> reqData=new HashMap<String, String>();
 	    	if(attach.equals("1")){
 	    		reqData.put("body", "支付订单");
 	    	}else{
 	    		reqData.put("body", "充值积分");
 	    	}
  	    	reqData.put("attach",attach);
 	    	reqData.put("out_trade_no", out_trade_no);
	    	reqData.put("fee_type", "CNY");
	    	reqData.put("total_fee", String.valueOf(total_fee.intValue()));
	    	reqData.put("spbill_create_ip", dodo.getSpbill_create_ip());
	    	reqData.put("notify_url", "http://www.jybd666.cn/back_chat/notify.do");
	     	//JSAPI--公众号支付、NATIVE--原生扫码支付、APP--app支付，统一下单接口trade_type的传参可参考这里
	    	//MICROPAY--刷卡支付，刷卡支付有单独的支付接口，不调用统一下单接口
	    	reqData.put("trade_type", "JSAPI");
	    	reqData.put("openid", openid);
	        reqData.put("sign_type", WXPayConstants.MD5);
  	    	Map<String, String> map2=dodo.unifiedOrder(reqData);
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
  	       returnmap.put("payment_type", attach);
  	       returnmap.put("out_trade_no", out_trade_no);
  	       returnmap.put("return_code", map2.get("return_code").toString());
	       returnmap.put("return_msg", map2.get("return_msg").toString());
   		} catch (Exception e) {
			// TODO: handle exception
 			e.printStackTrace();
		}
		return returnmap;
	}
	
	
	

   
	
	
 
	public static void main(String[] args) {
		String a="a,";
		System.out.println(a.split(",").length);
	}
	
	
}
