package com.yijiwenhua.backend.service.impl;

import org.springframework.stereotype.Service;

import com.likegene.framework.core.BaseServiceImpl;
import com.yijiwenhua.backend.service.SysActivityService;
import com.yijiwenhua.backend.model.SysActivity;

/**
 * 活动案例 Service
 * @author lvliang
 * @since  2018-07-11
 * 
 */
@Service
public class SysActivityServiceImpl extends BaseServiceImpl<SysActivity, Long> implements SysActivityService{

	public String getNamespace()
    {
        return SysActivity.class.getSimpleName();
    }
}
