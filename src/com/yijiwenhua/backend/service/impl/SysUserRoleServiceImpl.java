package com.yijiwenhua.backend.service.impl;

import org.springframework.stereotype.Service;

import com.likegene.framework.core.BaseServiceImpl;
import com.yijiwenhua.backend.model.SysUserRole;
import com.yijiwenhua.backend.service.SysUserRoleService;

/**
 * 用户角色 Service
 * 
 */
@Service
public class SysUserRoleServiceImpl extends
		BaseServiceImpl<SysUserRole, SysUserRole> implements SysUserRoleService {

	public String getNamespace() {
		return SysUserRole.class.getSimpleName();
	}
}
