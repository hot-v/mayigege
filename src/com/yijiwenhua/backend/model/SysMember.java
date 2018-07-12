package com.yijiwenhua.backend.model;

import java.io.Serializable;

/**
 * 团队用户
 * @author lvliang
 * @since  2018-07-11
 */
public class SysMember implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**id*/
	private Long id;
	
	/**用户名*/
	private String username;
	
	/**性别*/
	private String sex;
	
	/**头像*/
	private String face;
	
	/**所属职务*/
	private String positionId;
	
	/**等级*/
	private Integer level;
	
	/**电话*/
	private String mobile;
	
	/**邮箱*/
	private String email;
	
	/**创建时间*/
	private java.util.Date createTime;
	
	/**id*/
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	/**用户名*/
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	/**性别*/
	public String getSex() {
		return sex;
	}
	
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	/**头像*/
	public String getFace() {
		return face;
	}
	
	public void setFace(String face) {
		this.face = face;
	}
	
	/**所属职务*/
	public String getPositionId() {
		return positionId;
	}
	
	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}
	
	/**等级*/
	public Integer getLevel() {
		return level;
	}
	
	public void setLevel(Integer level) {
		this.level = level;
	}
	
	/**电话*/
	public String getMobile() {
		return mobile;
	}
	
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	/**邮箱*/
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	/**创建时间*/
	public java.util.Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	
}
