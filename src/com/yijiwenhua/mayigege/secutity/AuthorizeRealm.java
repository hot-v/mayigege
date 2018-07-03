package com.yijiwenhua.mayigege.secutity;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.likegene.framework.core.QueryFilter;
import com.yijiwenhua.backend.model.SysRoleResource;
import com.yijiwenhua.backend.model.SysUser;
import com.yijiwenhua.backend.service.SysRoleResourceService;
import com.yijiwenhua.backend.service.SysUserService;


@Service("authorizeRealm")
public class AuthorizeRealm extends AuthorizingRealm{
	
    @Autowired
    private SysRoleResourceService sysRoleResourceService;
    
    @Autowired
    private SysUserService sysUserService;
    
    public AuthorizeRealm()
    {
        setName("AuthorizeProvider");
        setCredentialsMatcher(new HashedCredentialsMatcher(
                Sha256Hash.ALGORITHM_NAME));
    }

	/**
	 * 
	 * TODO 验证用户信息
	 * @see org.apache.shiro.realm.AuthenticatingRealm#doGetAuthenticationInfo(org.apache.shiro.authc.AuthenticationToken)
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        String pwd = new Sha256Hash(new String(token.getPassword())).toHex();
        String username = token.getUsername();
        
        return new SimpleAuthenticationInfo(username, pwd, getName());
	}

	/**
	 * 
	 * TODO 读取登录用户权限
	 * @see org.apache.shiro.realm.AuthorizingRealm#doGetAuthorizationInfo(org.apache.shiro.subject.PrincipalCollection)
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		Set<String> roles = new HashSet<String>();
		try {
			String username = (String) principals.fromRealm(getName())
					.iterator().next();
			QueryFilter filter = new QueryFilter();
			filter.setStatementKey(SysUserService.SELECT_USER_INFO);
			filter.put("username", username);
			SysUser checkUser = sysUserService.findOne(filter).getReturnObj();
			if (checkUser.getUsername().equals("admin") || checkUser.getIsSuperadmin().intValue() == 1) {
				roles.add("ADMIN");
			} else {
				// 查询用户权限
				filter = new QueryFilter();
				filter.setStatementKey(SysRoleResourceService.SELECT_AUTHORIZATION);
				filter.put("username", username);
				List<SysRoleResource> resourceList = sysRoleResourceService
						.findList(filter).getReturnObj();
				for (SysRoleResource re : resourceList) {
					roles.add(re.getResource());
				}
			}
			roles.add("NONE");
			info.setRoles(roles);
		} catch (Exception e) {
			e.printStackTrace();
			roles.add("NONE");
		}
		return info;
	}

}
