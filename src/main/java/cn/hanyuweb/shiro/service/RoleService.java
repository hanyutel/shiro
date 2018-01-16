package cn.hanyuweb.shiro.service;

import java.util.List;

import cn.hanyuweb.shiro.bean.Role;

public interface RoleService {

	List<Role> queryRolesByLoginacct(String loginacct);

}
