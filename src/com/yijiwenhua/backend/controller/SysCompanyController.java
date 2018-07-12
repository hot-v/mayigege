package com.yijiwenhua.backend.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.likegene.framework.core.QueryFilter;
import com.likegene.framework.core.Result;
import com.likegene.framework.core.formvalidator.FormValidatorManager;
import com.yijiwenhua.backend.model.SysCompany;
import com.yijiwenhua.backend.model.SysFile;
import com.yijiwenhua.backend.model.SysUser;
import com.yijiwenhua.backend.service.SysCategroyService;
import com.yijiwenhua.backend.service.SysCompanyService;
import com.yijiwenhua.backend.service.SysFileService;
import com.yijiwenhua.mayigege.core.AppContextHolder;
import com.yijiwenhua.mayigege.core.Constant;
import com.yijiwenhua.mayigege.core.ResponseData;

/**
 * sys_company Controller
 * @author lvliang
 * @since  2018-07-09
 */
@Controller
@RequestMapping("/admin/company")
public class SysCompanyController extends BaseController{
	
	@Autowired
	private SysCompanyService service;
	
	@Autowired
	private SysFileService sysFileService;
	
	@Autowired
	private SysCategroyService sysCategroyService;

	@RequestMapping(value = "/index.html")
	public String index(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
        QueryFilter filter = new QueryFilter(request);
        model.put("pager", service.findPager(filter).getReturnObj());
		return "/backend/SysCompany/index";
	}
	
	@RequestMapping(value = "/services.html")
	public String services(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
        QueryFilter filter = new QueryFilter(request);
        model.put("pager", sysCategroyService.findPager(filter).getReturnObj());
		return "/backend/SysCompany/services";
	}
	
	@RequestMapping(value = "/add.html")
	public String add(HttpServletRequest request, HttpServletResponse response) {
		return "/backend/SysCompany/add";
	}
	
	@RequestMapping(value = "/save.json", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData save(ModelMap model, @ModelAttribute("entity") SysCompany entity, 
						HttpServletRequest request, HttpServletResponse response) {
		SysUser user = AppContextHolder.getCurrentUser();
		
		Map<String,Object> errors = FormValidatorManager.validate("saveSysCompanyConfig", request);
        if (errors.size() != 0)
        {
            return new ResponseData(false, errors);
        }
        try{
		    Result result = service.save(entity);
		    if (!result.isSuccess()) {
		    	return new ResponseData(false, result);
	        }
		    //封面
		    String covers = request.getParameter("covers");
		    if(!StringUtils.isBlank(covers)){
		    	entity = result.getReturnObj();
		    	Date date = new Date();
		    	String[] cover = covers.split(";");
		    	SysFile file = null;
		    	for (String path : cover) {
		    		if(!StringUtils.isBlank(path)){
						file = new SysFile();
						file.setCreateTime(date);
						file.setDescn(Constant.SysFile.RefObj.Desc.SYS_COMPANY_DESC);
						file.setPath(path);
						file.setRefId(entity.getId().toString());
						file.setRefObj(Constant.SysFile.RefObj.Keys.SYS_COMPANY);
						file.setUserId(user.getId());
						sysFileService.save(file);
		    		}
				}
		    }
		    //周边
		    String peripherys = request.getParameter("peripherys");
		    if(!StringUtils.isBlank(peripherys)){
		    	entity = result.getReturnObj();
		    	Date date = new Date();
		    	String[] periphery = peripherys.split(";");
		    	SysFile file = null;
		    	for (String path : periphery) {
		    		if(!StringUtils.isBlank(path)){
						file = new SysFile();
						file.setCreateTime(date);
						file.setDescn(Constant.SysFile.RefObj.Desc.SYS_PERIPHERY_DESC);
						file.setPath(path);
						file.setRefId(entity.getId().toString());
						file.setRefObj(Constant.SysFile.RefObj.Keys.SYS_PERIPHERY);
						file.setUserId(user.getId());
						sysFileService.save(file);
		    		}
				}
		    }
        }catch(DuplicateKeyException e){
        	Result result = new Result();
            if (e.getRootCause().getMessage().toUpperCase().contains("PRIMARY")){
                result.addErrormsg("id  重复");
            }
            return new ResponseData(false, result);
        }
        return ResponseData.SUCCESS_NO_DATA;
	} 
	
	@RequestMapping(value = "/detail.html")
    public String detail(Integer id, HttpServletRequest request, HttpServletResponse response) {
    	QueryFilter filter = new QueryFilter();
        filter.put("id", id);
        request.setAttribute("entity", service.findOne(filter).getReturnObj());
        
        filter = new QueryFilter();
        filter.put("refId", id);
		filter.put("refObj",Constant.SysFile.RefObj.Keys.SYS_COMPANY);
        List<SysFile> files = sysFileService.findList(filter).getReturnObj();
        request.setAttribute("imgFiles", files);

        //周边
        filter = new QueryFilter();
        filter.put("refId", id);
		filter.put("refObj",Constant.SysFile.RefObj.Keys.SYS_PERIPHERY);
        List<SysFile> peripheryFiles = sysFileService.findList(filter).getReturnObj();
        request.setAttribute("peripheryFiles", peripheryFiles);
        
        return "/backend/SysCompany/detail";
    }

	@RequestMapping(value = "/edit.html")
    public String edit(Integer id, HttpServletRequest request, HttpServletResponse response) {
    	QueryFilter filter = new QueryFilter();
        filter.put("id", id);
        request.setAttribute("entity", service.findOne(filter).getReturnObj());
        
        filter = new QueryFilter();
        filter.put("refId", id);
		filter.put("refObj",Constant.SysFile.RefObj.Keys.SYS_COMPANY);
        List<SysFile> files = sysFileService.findList(filter).getReturnObj();
        StringBuilder paths = null;
        if(files.size() > 0){
	        for (SysFile sysFile : files) {
	        	if(paths == null){
	        		paths = new StringBuilder(sysFile.getPath()).append(";");
	        	}else{
	        		paths.append(sysFile.getPath()).append(";");
	        	}
			}
        }
        request.setAttribute("imgFiles", files);
        request.setAttribute("paths", paths);
        
        //周边
        filter = new QueryFilter();
        filter.put("refId", id);
		filter.put("refObj",Constant.SysFile.RefObj.Keys.SYS_PERIPHERY);
        List<SysFile> peripheryFiles = sysFileService.findList(filter).getReturnObj();
        StringBuilder peripheryPaths = null;
        if(peripheryFiles.size() > 0){
	        for (SysFile sysFile : peripheryFiles) {
	        	if(peripheryPaths == null){
	        		peripheryPaths = new StringBuilder(sysFile.getPath()).append(";");
	        	}else{
	        		peripheryPaths.append(sysFile.getPath()).append(";");
	        	}
			}
        }
        request.setAttribute("peripheryFiles", peripheryFiles);
        request.setAttribute("peripheryPaths", peripheryPaths);
        
        return "/backend/SysCompany/edit";
    }
    
    @RequestMapping(value = "/update.json", method = RequestMethod.POST)
    @ResponseBody
	public ResponseData update(ModelMap model, @ModelAttribute("entity") SysCompany entity, 
						HttpServletRequest request, HttpServletResponse response) {
		SysUser user = AppContextHolder.getCurrentUser();

		Map<String,Object> errors = FormValidatorManager.validate("saveSysCompanyConfig", request);
        if (errors.size() != 0)
        {
            return new ResponseData(false, errors);
        }
        try{
		    Result result = service.update(entity);
		    if (!result.isSuccess()) {
		    	return new ResponseData(false, result);
	        }
		    //封面
		    String covers = request.getParameter("covers");
		    if(!StringUtils.isBlank(covers)){
		    	//先删除图片
				if(entity.getId() != null){
					QueryFilter filter = new QueryFilter();
					filter.setStatementKey(SysFileService.DELETE_BY_REFID);
					filter.put("refId", entity.getId());
					filter.put("refObj",Constant.SysFile.RefObj.Keys.SYS_COMPANY);
					sysFileService.delete(filter);
				}
				
				//再新增图片
		    	Date date = new Date();
		    	String[] cover = covers.split(";");
		    	SysFile file = null;
		    	for (String path : cover) {
		    		if(!StringUtils.isBlank(path)){
						file = new SysFile();
						file.setCreateTime(date);
						file.setDescn(Constant.SysFile.RefObj.Desc.SYS_COMPANY_DESC);
						file.setPath(path);
						file.setRefId(entity.getId().toString());
						file.setRefObj(Constant.SysFile.RefObj.Keys.SYS_COMPANY);
						file.setUserId(user.getId());
						sysFileService.save(file);
		    		}
				}
		    }
		    //周边
		    String peripherys = request.getParameter("peripherys");
		    if(!StringUtils.isBlank(peripherys)){
		    	//先删除图片
				if(entity.getId() != null){
					QueryFilter filter = new QueryFilter();
					filter.setStatementKey(SysFileService.DELETE_BY_REFID);
					filter.put("refId", entity.getId());
					filter.put("refObj",Constant.SysFile.RefObj.Keys.SYS_PERIPHERY);
					sysFileService.delete(filter);
				}
				
				//再新增图片
		    	Date date = new Date();
		    	String[] periphery = peripherys.split(";");
		    	SysFile file = null;
		    	for (String path : periphery) {
		    		if(!StringUtils.isBlank(path)){
						file = new SysFile();
						file.setCreateTime(date);
						file.setDescn(Constant.SysFile.RefObj.Desc.SYS_PERIPHERY_DESC);
						file.setPath(path);
						file.setRefId(entity.getId().toString());
						file.setRefObj(Constant.SysFile.RefObj.Keys.SYS_PERIPHERY);
						file.setUserId(user.getId());
						sysFileService.save(file);
		    		}
				}
		    }
        }catch(DuplicateKeyException e){
        	Result result = new Result();
            if (e.getRootCause().getMessage().toUpperCase().contains("PRIMARY")){
                result.addErrormsg("id  重复");
            }
            return new ResponseData(false, result);
        }
	    return ResponseData.SUCCESS_NO_DATA;
	}
	
	@RequestMapping(value="/delete.json")
	@ResponseBody
    public ResponseData delete(Integer[] ids, HttpServletRequest request, HttpServletResponse response)
    {
		Result result = null;
    	for (Integer id : ids)
      	{
    		result = service.delete(id);
    		if(result.isSuccess()){
	        	QueryFilter filter = new QueryFilter();
				filter.setStatementKey(SysFileService.DELETE_BY_REFID);
				filter.put("refId", id);
				sysFileService.delete(filter);
    		}
      	}
    	
      	
      	return ResponseData.SUCCESS_NO_DATA;
    }
}
