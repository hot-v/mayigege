package com.yijiwenhua.backend.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.Md5Hash;
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
import com.yijiwenhua.backend.model.SysUser;
import com.yijiwenhua.backend.service.SysUserService;
import com.yijiwenhua.mayigege.core.Constant;
import com.yijiwenhua.mayigege.core.ResponseData;

/**
 * 团队管理 Controller
 */
@Controller
@RequestMapping("/admin/team")
public class SysTeamController extends BaseController {
	@Autowired
	private SysUserService sysUserService;

	@RequestMapping(value = "/index.html")
	public String index(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		QueryFilter filter = new QueryFilter(request);
		filter.setStatementKey(SysUserService.SELECT_USER_ROLE_LIST);
		model.put("pager", sysUserService.findPager(filter).getReturnObj());
		return "/backend/SysTeam/index";
	}

	@RequestMapping(value = "/add.html")
	public String add(HttpServletRequest request, HttpServletResponse response) {
		return "/backend/SysTeam/add";
	}

	@RequestMapping(value = "/save.json", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData save(ModelMap model,
			@ModelAttribute("entity") SysUser entity,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			Map<String, Object> errors = new HashMap<String, Object>();
			if (errors.size() != 0) {
				return new ResponseData(false, errors.keySet().toString());
			}
			entity.setCreateTime(new Date());
			entity.setIsDisabled(SysUser.IS_ENABLED);
			// 用户密码MD5加密
			entity.setPassword(new Md5Hash(Constant.SysUser.DEFAULT_PASSWORD)
					.toHex());
			Result result = sysUserService.save(entity);
			if (!result.isSuccess()) {
				return new ResponseData(false, result.getErrormsg());
			}
		} catch (DuplicateKeyException e) {
			Result result = new Result();
			if (e.getRootCause().getMessage().toUpperCase().contains("PRIMARY")) {
				result.addErrormsg("id  重复");
			}
			return new ResponseData(false, result.getErrormsg());
		} catch (Exception e) {
			return new ResponseData(false, e.getMessage());
		}
		return ResponseData.SUCCESS_NO_DATA;
	}

	@RequestMapping(value = "/detail.html")
	public String detail(Long id, HttpServletRequest request,
			HttpServletResponse response) {
		QueryFilter filter = new QueryFilter();
		filter.put("id", id);
		request.setAttribute("entity", sysUserService.findOne(filter)
				.getReturnObj());
		return "/backend/SysTeam/detail";
	}

	@RequestMapping(value = "/edit.html")
	public String edit(Long id, HttpServletRequest request,
			HttpServletResponse response) {
		QueryFilter filter = new QueryFilter();
		filter.put("id", id);
		request.setAttribute("entity", sysUserService.findOne(filter)
				.getReturnObj());
		return "/backend/SysTeam/edit";
	}

	@RequestMapping(value = "/update.json", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData update(ModelMap model,
			@ModelAttribute("entity") SysUser entity,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			Result result = sysUserService.update(entity);
			if (!result.isSuccess()) {
				return new ResponseData(false, result.getErrormsg());
			}
		} catch (DuplicateKeyException e) {
			Result result = new Result();
			if (e.getRootCause().getMessage().toUpperCase().contains("PRIMARY")) {
				result.addErrormsg("id  重复");
			}
			return new ResponseData(false, result.getErrormsg());
		} catch (Exception e) {
			return new ResponseData(false, e.getMessage());
		}
		return ResponseData.SUCCESS_NO_DATA;
	}

	@RequestMapping(value = "/delete.json")
	@ResponseBody
	public ResponseData delete(Long id, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			if (id != null) {
				sysUserService.delete(id);
			}
		} catch (Exception e) {
			return new ResponseData(false, e.getMessage());
		}

		return ResponseData.SUCCESS_NO_DATA;
	}
}
