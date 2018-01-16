package cn.hanyuweb.shiro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hanyuweb.shiro.bean.Permission;
import cn.hanyuweb.shiro.bean.Role;
import cn.hanyuweb.shiro.dao.PermissionDao;
import cn.hanyuweb.shiro.service.PermissionService;

@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionDao permissionDao;

	@Override
	public List<Permission> queryPermissionsByRoles(List<Role> roles) {
		return permissionDao.queryPermissionsByRoles(roles);
	}
}
