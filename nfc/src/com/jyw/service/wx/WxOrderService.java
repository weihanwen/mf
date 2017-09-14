package com.jyw.service.wx;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jyw.dao.DaoSupport;
import com.jyw.entity.Page;
import com.jyw.util.PageData;


@Service("wxOrderService")
public class   WxOrderService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	 
	
	
	/*
	 *在送餐费说明界面的展示订单 
	 */
	public List<PageData> getStatusIszero(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("WxOrderMapper.getStatusIszero", pd);
	}
	/*
	 *获取个人订单列表
	 */
	public List<PageData> listOrderForMember(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("WxOrderMapper.listOrderForMember", pd);
	}
	
	/*
	*订单列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("WxOrderMapper.datalistPage", page);
	}
 
	
	/*
	*订单详情
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("WxOrderMapper.findById", pd);
	}
	
	/*
	* 修改订单状态
	*/
	public void changeOrderStatus(PageData pd)throws Exception{
		dao.update("WxOrderMapper.changeOrderStatus", pd);
	}
	
	/*
	 * 新增订单
	 */
	public void saveOrder(PageData pd)throws Exception{
		dao.save("WxOrderMapper.saveOrder", pd);
	}
	/*
	 * 新增订单下得关联商品
	 */
	public void saveOrderLunch(PageData pd)throws Exception{
		dao.save("WxOrderMapper.saveOrderLunch", pd);
	}
	/*
	 *获取所有订单状态为2的订单
	 */
	public List<PageData> listByStatusOrderOne(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("WxOrderMapper.listByStatusOrderOne", pd);
	}
	/*
	 *获取所有订单状态为3的订单
	 */
	public List<PageData> listByStatusOrderTwo(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("WxOrderMapper.listByStatusOrderTwo", pd);
	}
 	/*
	 * 情况订单历史记录order_status=0
	 */
	public void deleteOrder(PageData pd)throws Exception{
		dao.delete("WxOrderMapper.deleteOrder", pd);
	}
	/*
	 * 情况订单历史记录order_id
	 */
	public void deleteOrderLunch(PageData pd)throws Exception{
		dao.delete("WxOrderMapper.deleteOrderLunch", pd);
	}
	/*
	 * 清空定时记录
	 */
	public void deleteOrderTime(PageData pd)throws Exception{
		dao.delete("WxOrderMapper.deleteOrderTime", pd);
	}
	 
	
	/*
	 *订单时间跑腿费处理
	 */
	public void saveOrderTime(PageData pd)throws Exception{
		dao.save("WxOrderMapper.saveOrderTime", pd);
	}
	/*
	 *订单时间跑腿费处理
	 */
	public void updateOrderTime(PageData pd)throws Exception{
		dao.update("WxOrderMapper.updateOrderTime", pd);
	}
	/*
	 *获取tb_ordertime详情
	 */
	public  PageData getOrderTimeForId(PageData pd)throws Exception{
		return ( PageData )dao.findForObject("WxOrderMapper.getOrderTimeForId", pd);
	}
  	/*
	*判断在十分钟之内相同的地址是所有订单
	*/
	public  PageData isHavingOrderByNow(PageData pd)throws Exception{
		return ( PageData )dao.findForObject("WxOrderMapper.isHavingOrderByNow", pd);
	}
	//统计跑腿费用+餐盒费得总费用
	public Integer sumDeliveryFeeByOrder(String order_idstr) throws Exception{
		return (Integer)dao.findForObject("WxOrderMapper.sumDeliveryFeeByOrder",order_idstr);
	}
	//获取订单得部分信息
	public List<PageData> getOrderInfor(String order_idstr) throws Exception{
		return (List<PageData>)dao.findForList("WxOrderMapper.getOrderInfor",order_idstr);
	}
	/*
	 *获取订单下得商品集合
	 */
	public List<PageData> listLunchByOrder(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("WxOrderMapper.listLunchByOrder", pd);
	}
	 
	
}

