package cn.hanyuweb.shiro.dao;

import java.util.List;

import cn.hanyuweb.shiro.bean.Role;

public interface RoleDao {

	List<Role> queryRolesByLoginacct(String loginacct);

}
