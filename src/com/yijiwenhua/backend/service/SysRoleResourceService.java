package com.yijiwenhua.backend.service;

import com.likegene.framework.core.BaseService;
import com.yijiwenhua.backend.model.SysRoleResource;

/**
 * 角色资源 Service
 * 
 */
public interface SysRoleResourceService extends
		BaseService<SysRoleResource, SysRoleResource> {
	
	/**查询用户权限*/
	String SELECT_AUTHORIZATION = "selectAuthorization";
}
