package com.jyw.service.business;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jyw.dao.DaoSupport;
import com.jyw.entity.Page;
import com.jyw.util.PageData;


@Service("scheduled_timeService")
public class  Scheduled_timeService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("Scheduled_timeMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("Scheduled_timeMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("Scheduled_timeMapper.edit", pd);
	}
	 
	
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Scheduled_timeMapper.datalistPage", page);
	}
	 
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Scheduled_timeMapper.findById", pd);
	}
	
	

	//微信端开始使用的接口-====================================================================================
	
	/*
	* 通过id获取数据
	*/
	public PageData findByNowDay(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Scheduled_timeMapper.findByNowDay", pd);
	}
	
	/*
	*获取今天的便当菜谱列表
	*/
	public List<PageData> listAllNowDay(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Scheduled_timeMapper.listAllNowDay", pd);
	}
	
	
	 
	
}

