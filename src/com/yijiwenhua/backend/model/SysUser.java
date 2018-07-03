package com.yijiwenhua.backend.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 平台管理员
 */
public class SysUser implements Serializable {
	private static final long serialVersionUID = 1L;

	/** 类型(普通管理员) **/
	public static final Integer ISSUPERADMIN_NORMAL = 0;
	/** 类型(超级管理员) **/
	public static final Integer ISSUPERADMIN_SUPER = 1;

	public static final String ADMIN = "admin";

	/** 启用禁用(禁用) */
	public static final Integer IS_DISABLED = 1;
	/** 启用禁用(启用) */
	public static final Integer IS_ENABLED = 0;

	/** id */
	private Long id;

	/** 姓名 */
	private String fullname;

	/** 账号(手机号) */
	private String username;

	/** 密码(MD5加密后) */
	private String password;

	/** 创建时间 */
	private Date createTime;

	/** 类型(0:普通管理员,1:超级管理员) */
	private Integer isSuperadmin;

	/** 备注 */
	private String remark;

	/** 账户启用禁用（0：启用，1：禁用） */
	private Integer isDisabled;
	
	/**用户角色名称*/
	private String roleName;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getIsSuperadmin() {
		return isSuperadmin;
	}

	public void setIsSuperadmin(Integer isSuperadmin) {
		this.isSuperadmin = isSuperadmin;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getIsDisabled() {
		return isDisabled;
	}

	public void setIsDisabled(Integer isDisabled) {
		this.isDisabled = isDisabled;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
