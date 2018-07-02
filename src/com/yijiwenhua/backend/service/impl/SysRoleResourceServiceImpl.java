package com.yijiwenhua.backend.service.impl;

import org.springframework.stereotype.Service;

import com.likegene.framework.core.BaseServiceImpl;
import com.yijiwenhua.backend.model.SysRoleResource;
import com.yijiwenhua.backend.service.SysRoleResourceService;

/**
 * 角色资源 Service
 * 
 */
@Service
public class SysRoleResourceServiceImpl extends BaseServiceImpl<SysRoleResource, SysRoleResource> implements SysRoleResourceService{

	public String getNamespace()
    {
        return SysRoleResource.class.getSimpleName();
    }
}
