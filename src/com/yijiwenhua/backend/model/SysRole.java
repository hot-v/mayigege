package com.yijiwenhua.backend.model;

import java.io.Serializable;

/**
 * 系统角色
 */
public class SysRole implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 角色有效
	 */
	public static final int ROLE_ENABLED = 1;

	/**
	 * 角色无效
	 */
	public static final int ROLE_UN_ENABLED = 0;

	/** role_id */
	private Long roleId;

	/** 上级角色ID,0为顶级 */
	private Long parentId;

	/** 角色名称 */
	private String roleName;

	/** 描述 */
	private String descn;

	/** 是否生效(0:无效,1:有效) */
	private Integer enabled;

	/** role_id */
	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	/** 上级角色ID,0为顶级 */
	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	/** 角色名称 */
	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	/** 描述 */
	public String getDescn() {
		return descn;
	}

	public void setDescn(String descn) {
		this.descn = descn;
	}

	/** 是否生效(0:无效,1:有效) */
	public Integer getEnabled() {
		return enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

}
