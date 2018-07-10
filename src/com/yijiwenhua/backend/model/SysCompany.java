package com.yijiwenhua.backend.model;

import java.io.Serializable;

/**
 * sys_company
 * @author lvliang
 * @since  2018-07-09
 */
public class SysCompany implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**id*/
	private Integer id;
	
	/**公司名称*/
	private String name;
	
	/**公司地址*/
	private String address;
	
	/**公司logo*/
	private String logo;
	
	/**电话*/
	private String mobile;
	
	/**邮箱*/
	private String email;
	
	/**公司描述*/
	private String desc;
	
	/**id*/
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	/**公司名称*/
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	/**公司地址*/
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	/**公司logo*/
	public String getLogo() {
		return logo;
	}
	
	public void setLogo(String logo) {
		this.logo = logo;
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
	
	/**公司描述*/
	public String getDesc() {
		return desc;
	}
	
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
}
