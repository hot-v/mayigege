package com.yijiwenhua.backend.model;

import java.io.Serializable;
import java.util.List;

/**
 * 活动案例
 * @author lvliang
 * @since  2018-07-11
 */
public class SysActivity implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**id*/
	private Long id;
	
	/**活动名称*/
	private String caseName;
	
	/**所属策划方案*/
	private Long programmeId;
	
	/**活动价格*/
	private Double activityPrice;
	
	/**举办单位*/
	private String customerCompany;
	
	/**活动分类*/
	private Integer categroyId;
	
	/**开始时间*/
	private java.util.Date startTime;
	
	/**结束时间*/
	private java.util.Date endTime;
	
	/**团队名称*/
	private String teamName;
	
	/**团队口号*/
	private String teamSlogan;
	
	/**活动地点*/
	private String activityAddress;
	
	/**活动描述*/
	private String activityDesc;
	
	/**组织人数*/
	private Integer organizationNum;
	
	/**组织人*/
	private Long organizationPerson;
	
	/**创建时间*/
	private java.util.Date createTime;
	
	private List<SysFile> files;
	
	/**id*/
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	/**活动名称*/
	public String getCaseName() {
		return caseName;
	}
	
	public void setCaseName(String caseName) {
		this.caseName = caseName;
	}
	
	/**所属策划方案*/
	public Long getProgrammeId() {
		return programmeId;
	}
	
	public void setProgrammeId(Long programmeId) {
		this.programmeId = programmeId;
	}
	
	/**活动价格*/
	public Double getActivityPrice() {
		return activityPrice;
	}
	
	public void setActivityPrice(Double activityPrice) {
		this.activityPrice = activityPrice;
	}
	
	/**举办单位*/
	public String getCustomerCompany() {
		return customerCompany;
	}
	
	public void setCustomerCompany(String customerCompany) {
		this.customerCompany = customerCompany;
	}
	
	/**活动分类*/
	public Integer getCategroyId() {
		return categroyId;
	}
	
	public void setCategroyId(Integer categroyId) {
		this.categroyId = categroyId;
	}
	
	/**开始时间*/
	public java.util.Date getStartTime() {
		return startTime;
	}
	
	public void setStartTime(java.util.Date startTime) {
		this.startTime = startTime;
	}
	
	/**结束时间*/
	public java.util.Date getEndTime() {
		return endTime;
	}
	
	public void setEndTime(java.util.Date endTime) {
		this.endTime = endTime;
	}
	
	/**团队名称*/
	public String getTeamName() {
		return teamName;
	}
	
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	
	/**团队口号*/
	public String getTeamSlogan() {
		return teamSlogan;
	}
	
	public void setTeamSlogan(String teamSlogan) {
		this.teamSlogan = teamSlogan;
	}
	
	/**活动地点*/
	public String getActivityAddress() {
		return activityAddress;
	}
	
	public void setActivityAddress(String activityAddress) {
		this.activityAddress = activityAddress;
	}
	
	/**活动描述*/
	public String getActivityDesc() {
		return activityDesc;
	}
	
	public void setActivityDesc(String activityDesc) {
		this.activityDesc = activityDesc;
	}
	
	/**组织人数*/
	public Integer getOrganizationNum() {
		return organizationNum;
	}
	
	public void setOrganizationNum(Integer organizationNum) {
		this.organizationNum = organizationNum;
	}
	
	/**组织人*/
	public Long getOrganizationPerson() {
		return organizationPerson;
	}
	
	public void setOrganizationPerson(Long organizationPerson) {
		this.organizationPerson = organizationPerson;
	}
	
	/**创建时间*/
	public java.util.Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}

	public List<SysFile> getFiles() {
		return files;
	}

	public void setFiles(List<SysFile> files) {
		this.files = files;
	}
	
}
