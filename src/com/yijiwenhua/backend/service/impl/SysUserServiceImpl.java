package com.yijiwenhua.backend.service.impl;

import org.springframework.stereotype.Service;

import com.likegene.framework.core.BaseServiceImpl;
import com.yijiwenhua.backend.model.SysUser;
import com.yijiwenhua.backend.service.SysUserService;

/**
 * 平台管理员 Service
 * 
 * 
 */
@Service
public class SysUserServiceImpl extends BaseServiceImpl<SysUser, Long>
		implements SysUserService {

	public String getNamespace() {
		return SysUser.class.getSimpleName();
	}
}
