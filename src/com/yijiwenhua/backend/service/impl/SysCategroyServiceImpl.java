package com.yijiwenhua.backend.service.impl;

import org.springframework.stereotype.Service;

import com.likegene.framework.core.BaseServiceImpl;
import com.yijiwenhua.backend.service.SysCategroyService;
import com.yijiwenhua.backend.model.SysCategroy;

/**
 * 公司服务分类 Service
 * @author lvliang
 * @since  2018-07-10
 * 
 */
@Service
public class SysCategroyServiceImpl extends BaseServiceImpl<SysCategroy, Long> implements SysCategroyService{

	public String getNamespace()
    {
        return SysCategroy.class.getSimpleName();
    }
}
