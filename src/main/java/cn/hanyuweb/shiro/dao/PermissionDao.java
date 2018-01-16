package cn.hanyuweb.shiro.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.hanyuweb.shiro.bean.Permission;
import cn.hanyuweb.shiro.bean.Role;

public interface PermissionDao {

	List<Permission> queryPermissionsByRoles(@Param("roles")List<Role> roles);

}
