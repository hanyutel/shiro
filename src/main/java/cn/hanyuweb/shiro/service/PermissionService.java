package cn.hanyuweb.shiro.service;

import java.util.List;

import cn.hanyuweb.shiro.bean.Permission;
import cn.hanyuweb.shiro.bean.Role;

public interface PermissionService {

	List<Permission> queryPermissionsByRoles(List<Role> roles);

}
