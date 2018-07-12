package com.yijiwenhua.backend.model;

import java.io.Serializable;

/**
 * 参数配置
 * @author lvliang
 * @since  2018-07-09
 */
public class SysConfig implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**id*/
	private Long id;
	
	/**描述*/
	private String desc;
	
	/**变量名*/
	private String keyname;
	
	/**变量值*/
	private String val;
	
	/**分类*/
	private String category;
	
	/**分类描述*/
	private String categoryDesc;
	
	/**排序*/
	private Integer orderNo;
	
	/**id*/
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	/**描述*/
	public String getDesc() {
		return desc;
	}
	
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	/**变量名*/
	public String getKeyname() {
		return keyname;
	}
	
	public void setKeyname(String keyname) {
		this.keyname = keyname;
	}
	
	/**变量值*/
	public String getVal() {
		return val;
	}
	
	public void setVal(String val) {
		this.val = val;
	}
	
	/**分类*/
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	/**分类描述*/
	public String getCategoryDesc() {
		return categoryDesc;
	}
	
	public void setCategoryDesc(String categoryDesc) {
		this.categoryDesc = categoryDesc;
	}
	
	/**排序*/
	public Integer getOrderNo() {
		return orderNo;
	}
	
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	
}
