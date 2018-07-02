package com.yijiwenhua.mayigege.secutity;

import java.util.HashSet;
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

public class AuthorizeRealm extends AuthorizingRealm{
    
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
        roles.add("ADMIN");
        //roles.add("NONE");
        info.setRoles(roles);
		
		return info;
	}

}
