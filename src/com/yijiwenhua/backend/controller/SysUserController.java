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
import com.likegene.framework.util.SettingUtil;
import com.yijiwenhua.backend.model.SysUser;
import com.yijiwenhua.backend.model.SysUserRole;
import com.yijiwenhua.backend.service.SysRoleService;
import com.yijiwenhua.backend.service.SysUserRoleService;
import com.yijiwenhua.backend.service.SysUserService;
import com.yijiwenhua.mayigege.core.Constant;
import com.yijiwenhua.mayigege.core.ResponseData;

/**
 * 平台管理员 Controller
 */
@Controller
@RequestMapping("/admin/user")
public class SysUserController extends BaseController {
	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private SysRoleService sysRoleService;

	@Autowired
	private SysUserRoleService sysUserRoleService;

	@RequestMapping(value = "/index.html")
	public String index(ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		QueryFilter filter = new QueryFilter(request);
		model.put("pager", sysUserService.findPager(filter).getReturnObj());
		return "/backend/SysUser/index";
	}

	@RequestMapping(value = "/add.html")
	public String add(HttpServletRequest request, HttpServletResponse response) {
		return "/backend/SysUser/add";
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
		return "/backend/SysUser/detail";
	}

	@RequestMapping(value = "/edit.html")
	public String edit(Long id, HttpServletRequest request,
			HttpServletResponse response) {
		QueryFilter filter = new QueryFilter();
		filter.put("id", id);
		request.setAttribute("entity", sysUserService.findOne(filter)
				.getReturnObj());
		return "/backend/SysUser/edit";
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

	/** 重置密码 */
	@RequestMapping(value = "/reset.json")
	@ResponseBody
	public ResponseData reset(Long[] ids, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			for (Long id : ids) {
				SysUser entity = new SysUser();
				entity.setId(id);
				entity.setPassword(new Md5Hash(Constant.SysUser.DEFAULT_PASSWORD).toHex());
				sysUserService.update(entity);
			}
			return ResponseData.SUCCESS_NO_DATA;
		} catch (Exception e) {
			logger.error("重置密码异常", e);
			return ResponseData.FAILED_NO_DATA;
		}
	}

	/** 用户授权操作页面 */
	@RequestMapping(value = "/authc.html")
	public String authorization(Long userid, HttpServletRequest request,
			HttpServletResponse response) {
		QueryFilter filter = new QueryFilter();
		filter.put("id", userid);
		SysUser entity = sysUserService.findOne(filter).getReturnObj();
		request.setAttribute("entity", entity);

		filter = new QueryFilter();
		filter.put("userId", entity.getId());
		request.setAttribute("sysUserRole", sysUserRoleService.findOne(filter).getReturnObj());

		filter = new QueryFilter();
		filter.put("enabled", 1);// 选取有效角色
		request.setAttribute("roleList", sysRoleService.findList(filter).getReturnObj());

		return "/backend/SysUser/authc";
	}

	/** 授权操作 */
	@RequestMapping(value = "/authc.json")
	@ResponseBody
	public ResponseData authorization(ModelMap model,
			@ModelAttribute("entity") SysUser entity, Long roleId,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			if (entity == null || entity.getId() == null) {
				return new ResponseData(false, "授权失败");
			} else if (roleId == null || "".equals(roleId)) {
				return new ResponseData(false, "请选择用户角色");
			} else {
				// 判断该用户是否已分配角色 若分配 则修改
				QueryFilter checkFilter = new QueryFilter();
				checkFilter.put("userId", entity.getId().toString());
				SysUserRole checkUserRole = sysUserRoleService.findOne(
						checkFilter).getReturnObj();
				Result result = null;
				if (checkUserRole != null) {
					checkUserRole.setRoleId(roleId);
					result = sysUserRoleService.update(checkUserRole);
				} else {
					checkUserRole = new SysUserRole();
					checkUserRole.setRoleId(roleId);
					checkUserRole.setUserId(entity.getId());
					result = sysUserRoleService.save(checkUserRole);
				}
				if (!result.isSuccess()) {
					model.putAll(result);
					return new ResponseData(false, result);
				}
			}
		} catch (Exception e) {
			return new ResponseData(false, "授权失败");
		}
		return ResponseData.SUCCESS_NO_DATA;
	}

	@RequestMapping(value = "/modify.html")
	public String changePwd(HttpServletRequest request,
			HttpServletResponse response) {
		QueryFilter filter = new QueryFilter(request);
		SysUser user = sysUserService.findOne(filter).getReturnObj();
		request.setAttribute("entity", user);
		return "/backend/SysUser/modify";
	}

	@RequestMapping(value = "/modify.json", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData changePwd(ModelMap model,
			@ModelAttribute("entity") SysUser entity, String oldPassword,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			Map<String, Object> errors = new HashMap<String, Object>();
			if (errors.size() != 0) {
				return new ResponseData(false, errors.keySet().toString());
			}
			String passwoed = new Md5Hash(entity.getPassword()).toHex();// 新密码Md5加密

			QueryFilter filter = new QueryFilter();
			filter.put("id", entity.getId());
			entity = sysUserService.findOne(filter).getReturnObj();
			String oldPwd = entity.getPassword();// 数据库里的原密码
			oldPassword = new Md5Hash(oldPassword).toHex();// 原密码Md5加密
			if (oldPassword.equals(oldPwd)) {// 判断密码是否正确
				entity.setPassword(passwoed);
				Result result = sysUserService.update(entity);
				if (!result.isSuccess()) {
					return new ResponseData(false, result.getErrormsg());
				}
			} else {
				Result result = new Result();
				result.addErrormsg("原密码不正确");
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

}
