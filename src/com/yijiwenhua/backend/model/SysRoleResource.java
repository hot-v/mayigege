package com.yijiwenhua.backend.model;

import java.io.Serializable;

/**
 * 角色资源
 */
public class SysRoleResource implements Serializable {
	private static final long serialVersionUID = 1L;

	/** 角色ID */
	private Long roleId;

	/** 资源名 */
	private String resource;

	/** 角色ID */
	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	/** 资源名 */
	public String getResource() {
		return resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

}
