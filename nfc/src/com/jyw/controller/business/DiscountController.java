package com.jyw.controller.business;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jyw.controller.base.BaseController;
import com.jyw.entity.Page;
import com.jyw.entity.system.Menu;
import com.jyw.service.business.AddressService;
import com.jyw.service.business.DiscountService;
import com.jyw.util.Const;
import com.jyw.util.PageData;
import com.jyw.util.ServiceHelper;

/** 
 * 类名称：AddressController
 * 创建人：魏汉文
 * 创建时间：2017-07-28
 */
@Controller
@RequestMapping(value="/discount")
public class DiscountController extends BaseController {
	
	@Resource(name="discountService")
	private DiscountService discountService;
	
	/**
	 * 新增
	 * discount/save.do
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
 		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			discountService.save(pd);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 * discount/delete.do
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
 		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			discountService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	 
	
	/**
	 * 修改
	 * discount/edit.do
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
 		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			discountService.edit(pd);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
 		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 * discount/list.do
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
 		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = discountService.list(page);	//列出W列表
			this.getHC(); //调用权限
			mv.setViewName("business/discount/discount_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 * discount/goAdd.do
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
 		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
 		try {
 			pd = this.getPageData();
 			List<PageData> categoryList=ServiceHelper.getCategoryService().listAll(pd);
			mv.addObject("categoryList", categoryList);
			mv.setViewName("business/discount/discount_save");
 			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 * discount/goEdit.do
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
 		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			List<PageData> categoryList=ServiceHelper.getCategoryService().listAll(pd);
			mv.addObject("categoryList", categoryList);
			pd = this.getPageData();
			pd = discountService.findById(pd);	//根据ID读取
			mv.setViewName("business/discount/discount_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	 
	/* ===============================权限================================== */
	public void getHC(){
		ModelAndView mv = this.getModelAndView();
		HttpSession session = this.getRequest().getSession();
		Map<String, String> map = (Map<String, String>)session.getAttribute(Const.SESSION_QX);
		mv.addObject(Const.SESSION_QX,map);	//按钮权限
		List<Menu> menuList = (List)session.getAttribute(Const.SESSION_menuList);
		mv.addObject(Const.SESSION_menuList, menuList);//菜单权限
	}
	/* ===============================权限================================== */
	
 
	
}

