/*package com.yijiwenhua.mayigege.core;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.apache.commons.lang.BooleanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.context.ServletContextAware;

public class LoadFilterChainDefinitions implements ServletContextAware {

	@Autowired
	private ServletContext servletContext;

	private List<String> resourceList;

	private String fixedAuthRule;

	public String loadAll() {
		StringBuffer sb = new StringBuffer();
		sb.append(getFixedAuthRule()).append(loadSecurityMetadataSource());
		return sb.toString();
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String loadSecurityMetadataSource() {
		StringBuffer sb = new StringBuffer("");
		List<Function> functionList = new ArrayList<Function>();
		Map functionMap = new HashMap();
		Map functionChildMap = new HashMap();
		Map functionParentMap = new HashMap();
		Map functionChildNavigateMap = new HashMap();
		for (String fun : resourceList) {
			String[] props = fun.split(",");
			Function function = new Function();
			if (StringUtils.isNotBlank(props[0])) {
				function.setParentId(StringUtils
						.trim(props[0]));
			}
			if (StringUtils.isNotBlank(props[1])) {
				function.setId(StringUtils.trim(props[1]));
			}
			if (StringUtils.isNotBlank(props[2])) {
				function.setName(StringUtils.trim(props[2]));
			}
			if (StringUtils.isNotBlank(props[3])) {
				function.setUrl(StringUtils.trim(props[3]));
			}
			if (StringUtils.isNotBlank(props[4])) {
				String[] aa = StringUtils.trim(props[4]).split("|");
				if (aa.length >= 2) {
					function.setOwnerRole(aa[1]);
				}
				function.setRolenames(StringUtils.trim(props[4]).replace("|",
						","));
			}
			function.setNavigate(BooleanUtils.toBoolean(props[5]));
			functionList.add(function);
			functionMap.put(function.getId() + "", function);
			if (StringUtils.isNotBlank(function.getUrl())) {
				sb.append(function.getUrl()).append("=authc, roles[");
				// for(int i = 0; i < function.getRolenames().size();i++){
				// String role = function.getRolenames().get(i);
				// sb.append("\"").append(StringUtils.trim(role)).append("\"");
				// if (i != function.getRolenames().size() - 1) {
				// sb.append(",");
				// }
				// }
				sb.append(function.getRolenames());
				sb.append("]\r\n");
			}
		}

		for (Function f : functionList) {
			if (functionChildMap.get("" + f.getId()) == null) {
				functionChildMap.put("" + f.getId(), new ArrayList());
			}
			List childList = (List) functionChildMap.get("" + f.getParentId());
			if (childList == null) {
				childList = new ArrayList();
				functionChildMap.put("" + f.getParentId(), childList);
			}
			childList.add(f);
		}
		Set childKeySet = functionChildMap.keySet();
		for (Iterator iterator = childKeySet.iterator(); iterator.hasNext();) {
			String key = (String) iterator.next();
			List<Function> childList = (List<Function>) functionChildMap
					.get(key);
			boolean childdisplay = false;
			for (Function fun : childList) {
				if (fun.isNavigate()) {
					childdisplay = true;
					break;
				}
			}
			Function fun = ((Function) functionMap.get(key));
			if (fun != null) {
				//fun.setChilddisplay(childdisplay);
			}
		}
		for (Function f : functionList) {
			List parent = (List) functionParentMap.get("" + f.getId());
			if (parent == null) {
				parent = new ArrayList();
				parent.add(f.getUrl());
				functionParentMap.put("" + f.getId(), parent);
				functionParentMap.put(f.getUrl(), parent);
			}
			Function pFunction = (Function) functionMap.get(f.getParentId()
					+ "");
			if (pFunction != null) {
				parent.add(pFunction.getUrl());
				pFunction = (Function) functionMap.get(pFunction.getParentId()
						+ "");
				if (pFunction != null) {
					parent.add(pFunction.getUrl());
				}
			}
		}
		this.servletContext.setAttribute("FunctionChildMap", functionChildMap);
		this.servletContext.setAttribute("FunctionParentMap", functionParentMap);
		this.servletContext.setAttribute("FunctionMap", functionMap);
		this.servletContext.setAttribute("FunctionChildNavigateMap", functionChildNavigateMap);
		return sb.toString();
	}

	public List<String> getResourceList() {
		return resourceList;
	}

	public void setResourceList(List<String> resourceList) {
		this.resourceList = resourceList;
	}

	public String getFixedAuthRule() {
		return fixedAuthRule;
	}

	public void setFixedAuthRule(String fixedAuthRule) {
		this.fixedAuthRule = fixedAuthRule;
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

}
*/