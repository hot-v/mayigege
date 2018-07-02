package com.yijiwenhua.backend.model;

import java.io.Serializable;

/**
 * 用户资源
 */
public class SysUserResource implements Serializable {
	private static final long serialVersionUID = 1L;

	/** id */
	private Long id;

	/** 用户ID */
	private Long userId;

	/** 资源名 */
	private String resource;

	/** id */
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/** 用户ID */
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	/** 资源名 */
	public String getResource() {
		return resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

}
