package com.yijiwenhua.backend.model;

import java.io.Serializable;

/**
 * 联系我们
 * @author lvliang
 * @since  2018-07-10
 */
public class SysContact implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**已处理*/
	public static int IS_PROCESSED_YES = 1;
	/**未处理*/
	public static int IS_PROCESSED_NO = 0;
	
	/**id*/
	private Long id;
	
	/**咨询人*/
	private String username;
	
	/**咨询人-联系方式*/
	private String mobile;
	
	/**咨询人-邮箱*/
	private String email;
	
	/**咨询标题*/
	private String title;
	
	/**咨询内容*/
	private String content;
	
	/**是否处理(0:否、1:是)*/
	private int isProcessed;
	
	/**咨询时间*/
	private java.util.Date createTime;
	
	/**处理结果*/
	private String procResult;
	
	/**处理人*/
	private Long procUserId;
	
	/**处理时间*/
	private java.util.Date procTime;
	
	/**id*/
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	/**咨询人*/
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	/**咨询人-联系方式*/
	public String getMobile() {
		return mobile;
	}
	
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	/**咨询人-邮箱*/
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	/**咨询标题*/
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	/**咨询内容*/
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	/**是否处理(0:否、1:是)*/
	public int getIsProcessed() {
		return isProcessed;
	}

	public void setIsProcessed(int isProcessed) {
		this.isProcessed = isProcessed;
	}
	
	
	/**咨询时间*/
	public java.util.Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	
	/**处理结果*/
	public String getProcResult() {
		return procResult;
	}
	
	public void setProcResult(String procResult) {
		this.procResult = procResult;
	}
	
	/**处理人*/
	public Long getProcUserId() {
		return procUserId;
	}
	
	public void setProcUserId(Long procUserId) {
		this.procUserId = procUserId;
	}
	
	/**处理时间*/
	public java.util.Date getProcTime() {
		return procTime;
	}
	
	public void setProcTime(java.util.Date procTime) {
		this.procTime = procTime;
	}
	
}
