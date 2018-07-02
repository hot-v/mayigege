package com.yijiwenhua.backend.service.impl;

import org.springframework.stereotype.Service;

import com.likegene.framework.core.BaseServiceImpl;
import com.yijiwenhua.backend.model.SysRole;
import com.yijiwenhua.backend.service.SysRoleService;

/**
 * 系统角色 Service
 * 
 */
@Service
public class SysRoleServiceImpl extends BaseServiceImpl<SysRole, Long> implements SysRoleService{

	public String getNamespace()
    {
        return SysRole.class.getSimpleName();
    }
}
