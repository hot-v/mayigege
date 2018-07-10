package com.yijiwenhua.backend.service.impl;

import org.springframework.stereotype.Service;

import com.likegene.framework.core.BaseServiceImpl;
import com.yijiwenhua.backend.model.SysFile;
import com.yijiwenhua.backend.service.SysFileService;

/**
 * 文件 Service
 * @author lvliang
 * @since  2018-07-09
 * 
 */
@Service
public class SysFileServiceImpl extends BaseServiceImpl<SysFile, Long> implements SysFileService{

	public String getNamespace()
    {
        return SysFile.class.getSimpleName();
    }
}
