package com.yijiwenhua.backend.model;

import java.io.Serializable;

/**
 * 用户角色
 */
public class SysUserRole implements Serializable {
	private static final long serialVersionUID = 1L;

	/** 角色ID */
	private Long roleId;

	/** 用户ID */
	private Long userId;

	/** 角色ID */
	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	/** 用户ID */
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

}
