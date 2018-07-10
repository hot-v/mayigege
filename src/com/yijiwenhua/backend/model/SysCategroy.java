package com.yijiwenhua.backend.model;

import java.io.Serializable;
import java.util.List;

/**
 * 公司服务分类
 * @author lvliang
 * @since  2018-07-10
 */
public class SysCategroy implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**id*/
	private Long id;
	
	/**服务名称*/
	private String serviceName;
	
	/**服务描述*/
	private String serviceDesc;
	
	/**创建时间*/
	private java.util.Date createTime;
	
	private List<SysFile> pics;
	
	/**id*/
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	/**服务名称*/
	public String getServiceName() {
		return serviceName;
	}
	
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	
	/**服务描述*/
	public String getServiceDesc() {
		return serviceDesc;
	}
	
	public void setServiceDesc(String serviceDesc) {
		this.serviceDesc = serviceDesc;
	}
	
	/**创建时间*/
	public java.util.Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}

	public List<SysFile> getPics() {
		return pics;
	}

	public void setPics(List<SysFile> pics) {
		this.pics = pics;
	}
	
}
