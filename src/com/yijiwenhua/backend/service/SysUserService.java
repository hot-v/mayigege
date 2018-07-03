package com.yijiwenhua.backend.service;

import com.likegene.framework.core.BaseService;
import com.yijiwenhua.backend.model.SysUser;

/**
 * 平台管理员 Service
 * 
 */
public interface SysUserService extends BaseService<SysUser, Long> {

	/** 关联查询用户角色 */
	String SELECT_USER_ROLE_LIST = "selectUserRoleList";
	
	/**查询用户*/
	String SELECT_USER_INFO = "selectUserInfo";
	
}
