package com.yijiwenhua.backend.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.likegene.framework.core.QueryFilter;
import com.yijiwenhua.backend.model.SysUser;
import com.yijiwenhua.backend.service.SysUserService;
import com.yijiwenhua.mayigege.core.AppContextHolder;
import com.yijiwenhua.mayigege.core.ResponseData;

@Component
@RequestMapping("/admin")
public class BackendController extends BaseController {

	@Autowired
	private SysUserService sysUserService;

	@RequestMapping("")
	public String home() {
		return "/backend/login";
	}

	@RequestMapping("login.html")
	public String login() {
		return "/backend/login";
	}

	@RequestMapping("/index.html")
	public String index() {
		return "/backend/index";
	}

	/**
	 * 平台用户登录
	 * 
	 * @return ResponseData
	 */
	@RequestMapping(value = "/login.json")
	@ResponseBody
	public ResponseData doLogin(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password))
			return new ResponseData(false, "账号信息不能为空");

		QueryFilter filter = new QueryFilter();
		filter.setStatementKey(SysUserService.SELECT_USER_INFO);
		filter.put("username", username);
		SysUser sysUser = sysUserService.findOne(filter).getReturnObj();

		if (null == sysUser)
			return new ResponseData(false, "账号信息不正确");

		String encodePassword = new Md5Hash(password).toHex();
		if (StringUtils.equals(encodePassword.toUpperCase(), sysUser
				.getPassword().toUpperCase())) {

			if (sysUser.getUsername().toUpperCase()
					.equals("admin".toUpperCase())
					|| sysUser.getIsDisabled().intValue() == SysUser.IS_ENABLED
							.intValue()) {// 判断当前登录用户是否允许登录
				UsernamePasswordToken token = new UsernamePasswordToken(
						username, encodePassword);
				SecurityUtils.getSubject().login(token);
				SecurityUtils.getSubject().getSession()
						.setAttribute(AppContextHolder.USER_INFO, sysUser);

				return ResponseData.SUCCESS_NO_DATA;
			} else {
				return new ResponseData(false, "当前账号已删除或已禁用");
			}
		}
		return new ResponseData(false, "账号信息不正确");
	}

	/**
	 * 退出登录
	 * 
	 * @author lvliang
	 */
	@RequestMapping(value = "/logout.html")
	public String logout(HttpSession session) {
		session.invalidate();
		SecurityUtils.getSubject().logout();

		return "redirect:/admin/login.html";
	}
}
