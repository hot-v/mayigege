package com.yijiwenhua.backend.service.impl;

import org.springframework.stereotype.Service;

import com.likegene.framework.core.BaseServiceImpl;
import com.yijiwenhua.backend.model.SysUserResource;
import com.yijiwenhua.backend.service.SysUserResourceService;

/**
 * 用户资源 Service
 * 
 */
@Service
public class SysUserResourceServiceImpl extends
		BaseServiceImpl<SysUserResource, Long> implements
		SysUserResourceService {

	public String getNamespace() {
		return SysUserResource.class.getSimpleName();
	}
}
