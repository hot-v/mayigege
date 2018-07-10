package com.yijiwenhua.backend.service.impl;

import org.springframework.stereotype.Service;

import com.likegene.framework.core.BaseServiceImpl;
import com.yijiwenhua.backend.model.SysCompany;
import com.yijiwenhua.backend.service.SysCompanyService;

/**
 * sys_company Service
 * @author lvliang
 * @since  2018-07-09
 * 
 */
@Service
public class SysCompanyServiceImpl extends BaseServiceImpl<SysCompany, Integer> implements SysCompanyService{

	public String getNamespace()
    {
        return SysCompany.class.getSimpleName();
    }
}
