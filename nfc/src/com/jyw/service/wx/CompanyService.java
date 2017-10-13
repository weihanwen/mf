package com.jyw.service.wx;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jyw.dao.DaoSupport;
import com.jyw.entity.Page;
import com.jyw.util.PageData;


@Service("wxOrderService")
public class   CompanyService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	

	/*
	 * 新增 
	 */
	public void saveCompany(PageData pd)throws Exception{
		dao.save("CompanyMapper.saveCompany", pd);
	}
	
	
	/*
	* 修改 
	*/
	public void updateCompany(PageData pd)throws Exception{
		dao.update("CompanyMapper.updateCompany", pd);
	}
	/*
	 * 删除
	 */
	public void deleteCompany(PageData pd)throws Exception{
		dao.save("CompanyMapper.deleteCompany", pd);
	}
	
	/*
	 *公司详情 
	 */
	public PageData companyById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CompanyMapper.companyById", pd);
	}
	
	
	/*
	 *最大的ID
	 */
	public String getMaxId(PageData pd)throws Exception{
		return (String)dao.findForObject("CompanyMapper.getMaxId", pd);
	}
	
	
	/*
	 *公司列表 
	 */
	public List<PageData> companyList(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CompanyMapper.companyList", pd);
	}
	 
	//===================================公司成员==========================================
	
	

	/*
	 * 新增 
	 */
	public void saveCompanyUser(PageData pd)throws Exception{
		dao.save("CompanyMapper.saveCompanyUser", pd);
	}
	
	
	/*
	* 修改 
	*/
	public void updateCompanyUser(PageData pd)throws Exception{
		dao.update("CompanyMapper.updateCompanyUser", pd);
	}
	/*
	 * 删除
	 */
	public void deleteCompanyUser(PageData pd)throws Exception{
		dao.save("CompanyMapper.deleteCompanyUser", pd);
	}
	/*
	 *公司成员列表 
	 */
	public List<PageData> companyUserList(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CompanyMapper.companyUserList", pd);
	}
	
	
}

