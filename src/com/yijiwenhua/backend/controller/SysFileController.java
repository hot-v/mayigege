package com.yijiwenhua.backend.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.yijiwenhua.backend.model.SysFile;
import com.yijiwenhua.backend.service.SysFileService;
import com.yijiwenhua.backend.service.SysUserService;
import com.yijiwenhua.mayigege.core.ResponseData;

/**
 * 文件 Controller
 * @author lvliang
 * @since  2018-07-09
 */
@Controller
@RequestMapping("/admin/file")
public class SysFileController extends BaseController{
	
	@Autowired
	private SysFileService service;
	
	@Autowired
	private SysUserService sysUserService;

	@RequestMapping(value = "/index.html")
	public String index(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
        QueryFilter filter = new QueryFilter(request);
        model.put("pager", sysUserService.findPager(filter).getReturnObj());
		return "/backend/SysFile/index";
	}
	
	@RequestMapping(value = "/add.html")
	public String add(HttpServletRequest request, HttpServletResponse response) {
		return "/backend/SysFile/add";
	}
	
	@RequestMapping(value = "/save.json", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData save(ModelMap model, @ModelAttribute("entity") SysFile entity, 
						HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> errors = new HashMap<String,Object>();
        if (errors.size() != 0)
        {
            return new ResponseData(false, errors);
        }
        try{
		    Result result = service.save(entity);
		    if (!result.isSuccess()) {
		    	return new ResponseData(false, result);
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
    public String detail(Long id, HttpServletRequest request, HttpServletResponse response) {
    	QueryFilter filter = new QueryFilter();
        filter.put("id", id);
        request.setAttribute("entity", service.findOne(filter).getReturnObj());
        return "/backend/SysFile/detail";
    }

	@RequestMapping(value = "/edit.html")
    public String edit(Long id, HttpServletRequest request, HttpServletResponse response) {
    	QueryFilter filter = new QueryFilter();
        filter.put("id", id);
        request.setAttribute("entity", service.findOne(filter).getReturnObj());
        return "/backend/SysFile/edit";
    }
    
    @RequestMapping(value = "/update.json", method = RequestMethod.POST)
    @ResponseBody
	public ResponseData update(ModelMap model, @ModelAttribute("entity") SysFile entity, 
						HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> errors = new HashMap<String,Object>();
        if (errors.size() != 0)
        {
            return new ResponseData(false, errors);
        }
        try{
		    Result result = service.update(entity);
		    if (!result.isSuccess()) {
		    	return new ResponseData(false, result);
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
    public ResponseData delete(Long[] ids, HttpServletRequest request, HttpServletResponse response)
    {
    	for (Long id : ids)
      	{
        	service.delete(id);
      	}
    	
      	
      	return ResponseData.SUCCESS_NO_DATA;
    }
}
