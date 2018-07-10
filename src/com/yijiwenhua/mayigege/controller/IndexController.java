package com.yijiwenhua.mayigege.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.likegene.framework.core.QueryFilter;
import com.yijiwenhua.backend.model.SysCategroy;
import com.yijiwenhua.backend.model.SysCompany;
import com.yijiwenhua.backend.model.SysFile;
import com.yijiwenhua.backend.service.SysCategroyService;
import com.yijiwenhua.backend.service.SysCompanyService;
import com.yijiwenhua.backend.service.SysFileService;
import com.yijiwenhua.mayigege.core.Constant;


@Controller
@RequestMapping(value="/")
public class IndexController {
	
	@Autowired
	private SysFileService sysFileService;
	
	@Autowired
	private SysCompanyService sysCompanyService;
	
	@Autowired
	private SysCategroyService sysCategroyService;

	@RequestMapping("index.html")
	public String index(Model model, HttpServletRequest request, HttpServletResponse response){
		//获取网站封面图片
		QueryFilter filter = new QueryFilter();
		filter.put("refObj", Constant.SysFile.RefObj.Keys.SYS_COMPANY);
		List<SysFile> coverList = sysFileService.findList(filter).getReturnObj();
		
		//获取公司信息
		filter = new QueryFilter();
		filter.put("order", " id desc ");
		SysCompany company = sysCompanyService.findOne(filter).getReturnObj();
		
		//获取公司服务
		filter = new QueryFilter();
		filter.put("order", " id desc ");
		List<SysCategroy> serviceList = sysCategroyService.findList(filter).getReturnObj();
		//处理服务类图片问题
		List<SysCategroy> categroyList = new ArrayList<SysCategroy>();
		List<SysFile> pic = null;
		for (SysCategroy sysCategroy : serviceList) {
			filter = new QueryFilter();
			filter.put("refId", sysCategroy.getId());
			pic = sysFileService.findList(filter).getReturnObj();
			sysCategroy.setPics(pic);
			categroyList.add(sysCategroy);
		}
		
		model.addAttribute("coverList", coverList);
		model.addAttribute("company", company);
		model.addAttribute("categroyList", categroyList);
		
		return "/index";
	}
	
	@RequestMapping("commons/404.html")
	public String fourZeroFour(){
		return "/commons/404";
	}
	
	@RequestMapping("commons/500.html")
	public String fiveZeroZero(){
		return "/commons/500";
	}
}
