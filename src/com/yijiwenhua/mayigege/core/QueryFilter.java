/*package com.yijiwenhua.mayigege.core;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;

public class QueryFilter extends HashMap<String, Object> implements Serializable
{
    private static final long serialVersionUID = 1L;
    
    protected transient Logger        logger = Logger.getLogger(QueryFilter.class);
    
    private boolean escapeParam = true;
	
    public QueryFilter(){
    }
    public QueryFilter(boolean escapeParam){
    	this.escapeParam = escapeParam;
    }
    public QueryFilter(int pageNum, int limit){
        put("pageNum", pageNum);
        put("start", (pageNum-1) * limit);
        put("pageSize", limit);
    }
    
    public QueryFilter(Object obj){
        try
        {
            Map properties = BeanUtils.describe(obj);
            putAll(properties);
            logger.debug("QueryFilter(Object obj) "+properties);
        }
        catch (Exception e)
        {
            logger.debug("QueryFilter(Object obj)", e);
        }
    }
    
    public QueryFilter(Object obj, int pageNum, int limit){
        this(obj);
        put("pageNum",  pageNum);
        put("start", (pageNum-1) * limit);
        put("pageSize", limit);
    }
    
    public Integer getPageSize(){
        Object pageSize = super.get("pageSize");
        if (pageSize == null)
            return null;
        if (!(pageSize instanceof Integer)){
            pageSize = NumberUtils.toInt(""+pageSize);
            put("pageSize", pageSize);
            if (pageSize == null)
                return null;
            return (Integer) pageSize;
        }
        return (Integer) pageSize;
    }
    
    public void setPageSize(Integer pageSize){
        put("pageSize", pageSize);
    }
    
    public Integer getPageNum(){
        Object pageNum = super.get("pageNum");
        if (pageNum == null)
            return null;
        if (!(pageNum instanceof Integer)){
            pageNum = NumberUtils.toInt(""+pageNum);
            put("pageNum", pageNum);
            if (pageNum == null)
                return null;
            return (Integer) pageNum;
        }
        return (Integer) pageNum;
    }
    
    public void setPageNum(Integer pageNum){
        put("pageNum", pageNum);
    }

    @Override
    public Object get(Object key)
    {
        if ("pageNum".equals(key)){
            return getPageNum();
        }
        if ("pageSize".equals(key)){
            return getPageSize();
        }
        
        Object o = super.get(key);
        if (escapeParam && o instanceof String)
            return ((String)o).replace("%", "\\%");
        return o;
    }
}

*/