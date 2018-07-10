package com.yijiwenhua.backend.service.impl;

import org.springframework.stereotype.Service;

import com.likegene.framework.core.BaseServiceImpl;
import com.yijiwenhua.backend.model.SysConfig;
import com.yijiwenhua.backend.service.SysConfigService;

/**
 * 参数配置 Service
 * @author lvliang
 * @since  2018-07-09
 * 
 */
@Service
public class SysConfigServiceImpl extends BaseServiceImpl<SysConfig, Long> implements SysConfigService{

	public String getNamespace()
    {
        return SysConfig.class.getSimpleName();
    }
}
