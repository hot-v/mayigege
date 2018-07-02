package com.yijiwenhua.mayigege.secutity;

import java.io.Serializable;
import java.util.UUID;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionIdGenerator;
import org.springframework.web.context.request.RequestContextHolder;

public class SidSessionIdGenerator implements SessionIdGenerator
{

    @Override
    public Serializable generateId(Session arg0)
    {
        String sid = (String) RequestContextHolder.getRequestAttributes().getAttribute("sid", 0);
        if (sid == null)
            return UUID.randomUUID().toString();
        return (Serializable) sid;
    }

}
