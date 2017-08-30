package com.jyw.controller.business;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jyw.controller.base.BaseController;
import com.jyw.entity.Page;
import com.jyw.entity.system.Menu;
import com.jyw.entity.system.User;
import com.jyw.service.business.Scheduled_timeService;
import com.jyw.util.Const;
import com.jyw.util.PageData;
import com.jyw.util.ServiceHelper;

/** 
 * 类名称：scheduled_timeController
 * 创建人：魏汉文
 * 创建时间：2017-07-28
 */
@Controller
@RequestMapping(value="/scheduled_time")
public class Scheduled_timeController extends BaseController {
	
	@Resource(name="scheduled_timeService")
	private Scheduled_timeService scheduled_timeService;
	
	/**
	 * 新增
	 * scheduled_time/save.do
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
 		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			scheduled_timeService.save(pd);
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
	 * scheduled_time/delete.do
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
 		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			scheduled_timeService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
 
	 
	
	/**
	 * 修改
	 * scheduled_time/edit.do
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
 		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			scheduled_timeService.edit(pd);
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
	 * scheduled_time/list.do
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
 		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = scheduled_timeService.list(page);	//列出W列表
			for (PageData e : varList) {
				String category_namestr="";
				String category_idstr=e.getString("category_idstr");
				String[] str=category_idstr.split(",");
				for (int i = 0; i < str.length; i++) {
					pd.put("category_id", str[i]);
					if(ServiceHelper.getCategoryService().findById(pd) != null){
						category_namestr+=ServiceHelper.getCategoryService().findById(pd).getString("title")+"/";
					}
  				}
				e.put("category_namestr", category_namestr);
			}
 			this.getHC(); //调用权限
			mv.setViewName("business/scheduled_time/scheduled_time_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 * scheduled_time/goAdd.do
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
 		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
 		try {
 			pd = this.getPageData();
 			List<PageData> categoryList=ServiceHelper.getCategoryService().listAll(pd);
			mv.addObject("categoryList", categoryList);
			mv.setViewName("business/scheduled_time/scheduled_time_save");
 			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 * scheduled_time/goEdit.do
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
 		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
 		try {
 			pd = this.getPageData();
 			List<PageData> categoryList=ServiceHelper.getCategoryService().listAll(pd);
			mv.addObject("categoryList", categoryList);
			pd = scheduled_timeService.findById(pd);	//根据ID读取
			mv.addObject("pd", pd);
			mv.setViewName("business/scheduled_time/scheduled_time_edit");
			mv.addObject("msg", "edit");
			
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

