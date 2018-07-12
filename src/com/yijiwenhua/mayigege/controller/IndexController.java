package com.yijiwenhua.mayigege.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.likegene.framework.core.QueryFilter;
import com.yijiwenhua.backend.model.SysActivity;
import com.yijiwenhua.backend.model.SysCategroy;
import com.yijiwenhua.backend.model.SysCompany;
import com.yijiwenhua.backend.model.SysConfig;
import com.yijiwenhua.backend.model.SysFile;
import com.yijiwenhua.backend.model.SysMember;
import com.yijiwenhua.backend.service.SysActivityService;
import com.yijiwenhua.backend.service.SysCategroyService;
import com.yijiwenhua.backend.service.SysCompanyService;
import com.yijiwenhua.backend.service.SysConfigService;
import com.yijiwenhua.backend.service.SysFileService;
import com.yijiwenhua.backend.service.SysMemberService;
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
	
	@Autowired
	private SysConfigService sysConfigService;
	
	@Autowired
	private SysMemberService sysMemberService;
	
	@Autowired
	private SysActivityService sysActivityService;

	@RequestMapping(value = {"","index.html"})
	public String index(Model model, HttpServletRequest request, HttpServletResponse response){
		//获取网站封面图片
		QueryFilter filter = new QueryFilter();
		filter.put("refObj", Constant.SysFile.RefObj.Keys.SYS_COMPANY);
		List<SysFile> coverList = sysFileService.findList(filter).getReturnObj();
		
		//获取公司信息
		filter = new QueryFilter();
		filter.put("order", " id desc ");
		SysCompany company = sysCompanyService.findOne(filter).getReturnObj();
		
		//获取公司周边
        filter = new QueryFilter();
        filter.put("refId", company.getId());
		filter.put("refObj",Constant.SysFile.RefObj.Keys.SYS_PERIPHERY);
		filter.setStart(0);
		filter.setLimit(4);
        List<SysFile> peripheryFiles = sysFileService.findList(filter).getReturnObj();
		
		
		//获取公司服务
		filter = new QueryFilter();
		filter.put("order", " id desc ");
		List<SysCategroy> serviceList = sysCategroyService.findList(filter).getReturnObj();
		//处理服务类图片问题
		/*List<SysCategroy> categroyList = new ArrayList<SysCategroy>();
		for (SysCategroy sysCategroy : serviceList) {
			filter = new QueryFilter();
			filter.put("refId", sysCategroy.getId());
			filter.put("refObj", Constant.SysFile.RefObj.Keys.SYS_CATEGROY);
			pic = sysFileService.findList(filter).getReturnObj();
			sysCategroy.setPics(pic);
			categroyList.add(sysCategroy);
		}*/
		List<SysFile> pic = null;
		
		//获取案例说明
		filter = new QueryFilter();
		//filter.put("category", Constant.SysConfig.Categroy.CATEGROY_WEBSITE);
		List<SysConfig> configList =  sysConfigService.findList(filter).getReturnObj();
		Map<String,Object> configMap = new HashMap<String,Object>();
		for (SysConfig sysConfig : configList) {
			configMap.put(sysConfig.getKeyname(), sysConfig);
		}
		
		//获取团队成员信息
		filter = new QueryFilter();
		filter.put("order", " id asc ");
		filter.setStart(0);
		filter.setLimit(8);
		List<SysMember> memberList = sysMemberService.findList(filter).getReturnObj();
		
		//获取案例信息
		filter = new QueryFilter();
		filter.put("order", " id asc ");
		filter.setStart(0);
		filter.setLimit(6);
		List<SysActivity> activities = sysActivityService.findList(filter).getReturnObj();
		List<SysActivity> activityList = new ArrayList<SysActivity>();
		for (SysActivity sysActivity : activities) {
			filter = new QueryFilter();
			filter.put("refId", sysActivity.getId());
			filter.put("refObj", Constant.SysFile.RefObj.Keys.SYS_ACTIVITY);
			pic = sysFileService.findList(filter).getReturnObj();
			sysActivity.setFiles(pic);
			activityList.add(sysActivity);
		}
		
		model.addAttribute("coverList", coverList);
		model.addAttribute("company", company);
		model.addAttribute("peripheryFiles", peripheryFiles);
		model.addAttribute("categroyList", serviceList);
		model.addAttribute("configMap", configMap);
		model.addAttribute("memberList", memberList);
		model.addAttribute("activityList", activityList);
		
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
