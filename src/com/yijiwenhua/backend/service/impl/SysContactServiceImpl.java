package com.yijiwenhua.backend.service.impl;

import org.springframework.stereotype.Service;

import com.likegene.framework.core.BaseServiceImpl;
import com.yijiwenhua.backend.service.SysContactService;
import com.yijiwenhua.backend.model.SysContact;

/**
 * 联系我们 Service
 * @author lvliang
 * @since  2018-07-10
 * 
 */
@Service
public class SysContactServiceImpl extends BaseServiceImpl<SysContact, Long> implements SysContactService{

	public String getNamespace()
    {
        return SysContact.class.getSimpleName();
    }
}
