package com.yijiwenhua.backend.model;

import java.io.Serializable;

/**
 * 文件
 * @author lvliang
 * @since  2018-07-09
 */
public class SysFile implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**id*/
	private Long id;
	
	/**文件名*/
	private String name;
	
	/**描述*/
	private String descn;
	
	/**文件路径*/
	private String path;
	
	/**文件类型*/
	private String type;
	
	/**扩展名*/
	private String extension;
	
	/**文件大小*/
	private Long size;
	
	/**对象主键*/
	private String refId;
	
	/**引用对象*/
	private String refObj;
	
	/**上传人ID*/
	private Long userId;
	
	/**创建时间*/
	private java.util.Date createTime;
	
	/**id*/
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	/**文件名*/
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	/**描述*/
	public String getDescn() {
		return descn;
	}
	
	public void setDescn(String descn) {
		this.descn = descn;
	}
	
	/**文件路径*/
	public String getPath() {
		return path;
	}
	
	public void setPath(String path) {
		this.path = path;
	}
	
	/**文件类型*/
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	/**扩展名*/
	public String getExtension() {
		return extension;
	}
	
	public void setExtension(String extension) {
		this.extension = extension;
	}
	
	/**文件大小*/
	public Long getSize() {
		return size;
	}
	
	public void setSize(Long size) {
		this.size = size;
	}
	
	/**对象主键*/
	public String getRefId() {
		return refId;
	}
	
	public void setRefId(String refId) {
		this.refId = refId;
	}
	
	/**引用对象*/
	public String getRefObj() {
		return refObj;
	}
	
	public void setRefObj(String refObj) {
		this.refObj = refObj;
	}
	
	/**上传人ID*/
	public Long getUserId() {
		return userId;
	}
	
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	/**创建时间*/
	public java.util.Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	
}
