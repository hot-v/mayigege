package com.yijiwenhua.backend.service.impl;

import org.springframework.stereotype.Service;

import com.likegene.framework.core.BaseServiceImpl;
import com.yijiwenhua.backend.service.SysMemberService;
import com.yijiwenhua.backend.model.SysMember;

/**
 * 团队用户 Service
 * @author lvliang
 * @since  2018-07-11
 * 
 */
@Service
public class SysMemberServiceImpl extends BaseServiceImpl<SysMember, Long> implements SysMemberService{

	public String getNamespace()
    {
        return SysMember.class.getSimpleName();
    }
}
