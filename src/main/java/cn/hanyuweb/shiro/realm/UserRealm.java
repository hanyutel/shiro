package cn.hanyuweb.shiro.realm;

import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import cn.hanyuweb.shiro.bean.Permission;
import cn.hanyuweb.shiro.bean.Role;
import cn.hanyuweb.shiro.bean.User;
import cn.hanyuweb.shiro.service.PermissionService;
import cn.hanyuweb.shiro.service.RoleService;
import cn.hanyuweb.shiro.service.UserService;
import cn.hanyuweb.shiro.util.StringUtil;

public class UserRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private PermissionService permissionService;
	
    /** 
     * 添加角色 
     * @param username 
     * @param info 
     */  
    private void addRole(String loginacct, SimpleAuthorizationInfo info) {  
        List<Role> roles = roleService.queryRolesByLoginacct(loginacct);  
        if(roles != null && roles.size() > 0){  
            for (Role role : roles) {
            	String code = role.getCode();
            	if ( code.indexOf(",") != -1 ) {
            		for ( String c : code.split(",") ) {
            			info.addRole(c);
            		}
            	} else {
            		info.addRole(code);	
            	}
            }
            addPermission(roles, info);
        }
    }  
  
    /** 
     * 添加权限 
     * @param username 
     * @param info 
     * @return 
     */  
    private void addPermission(List<Role> roles, SimpleAuthorizationInfo info) {
    	List<Permission> permissions = permissionService.queryPermissionsByRoles(roles);  
        for (Permission permission : permissions) {
        	if ( StringUtil.isNotEmpty(permission.getCode()) ) {
        		for ( String code : permission.getCode().split(",") ) {
        			info.addStringPermission(code);//添加权限    
        		}
        	}
        }  
    }  
	
    /**
     * 此方法获取用户权限信息
     * 当请求经过认证过滤器，注解，认证方法，标签时，此方法会被调用，
     * 可增加缓存，将权限信息进行保存。
     */
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
	    String loginacct = (String)principals.getPrimaryPrincipal();
		if ( StringUtil.isNotEmpty(loginacct) ) {
			SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
			addRole(loginacct, authorizationInfo);
			return authorizationInfo;
		}

	    return null;
	}

	/**
	 * 此方法验证用户登录
	 * 方法会根据验证结果抛出不同的异常信息
	 * 
	 * org.apache.shiro.authc.pam.UnsupportedTokenException
	 *     身份令牌异常，不支持的身份令牌
	 * org.apache.shiro.authc.UnknownAccountException
	 *     未知账户/没找到帐号,登录失败
	 * org.apache.shiro.authc.LockedAccountException
	 *     帐号锁定
	 * org.apache.shiro.authc.DisabledAccountException  
	 *     用户禁用
	 * org.apache.shiro.authc.ExcessiveAttemptsException
	 *     登录重试次数，超限。只允许在一段时间内允许有一定数量的认证尝试
	 * org.apache.shiro.authc.ConcurrentAccessException
	 *     一个用户多次登录异常：不允许多次登录，只能登录一次 。即不允许多处登录
	 * org.apache.shiro.authc.AccountException
	 *     账户异常
	 * org.apache.shiro.authc.IncorrectCredentialsException
	 *     错误的凭据异常
	 * org.apache.shiro.authz.UnauthorizedException
	 *     没有访问权限，访问异常
	 * 
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
	    
		// 从令牌中获取认证主体身份信息（登陆账号）
	    String loginacct = (String)token.getPrincipal();
	    
	    // 根据账号查询用户信息
	    User user = userService.queryUserByLoginacct( loginacct );

	    if ( user == null ) {
	    	// 用户信息不存在。
	    	return null;
	    }
	    
	    // 将用户信息封装认证对象，底层会执行密码校验，默认为MD5校验
	    SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
	            user.getLoginacct(),
	            user.getUserpswd(),
	            ByteSource.Util.bytes(user.getCredentialsSalt()),
	            getName()
	    );
	    return authenticationInfo;
	}

}
