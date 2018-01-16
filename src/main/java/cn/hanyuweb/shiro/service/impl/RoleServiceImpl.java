package cn.hanyuweb.shiro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hanyuweb.shiro.bean.Role;
import cn.hanyuweb.shiro.dao.RoleDao;
import cn.hanyuweb.shiro.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;

	@Override
	public List<Role> queryRolesByLoginacct(String loginacct) {
		return roleDao.queryRolesByLoginacct(loginacct);
	}
}
