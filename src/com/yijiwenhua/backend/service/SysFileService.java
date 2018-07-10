package com.yijiwenhua.backend.service;

import com.likegene.framework.core.BaseService;
import com.yijiwenhua.backend.model.SysFile;

/**
 * 文件 Service
 * @author lvliang
 * @since  2018-07-09
 * 
 */
public interface SysFileService extends BaseService<SysFile, Long>{
	
	/**根据引用对象id删除*/
	String DELETE_BY_REFID = "deleteByRefId";
}
