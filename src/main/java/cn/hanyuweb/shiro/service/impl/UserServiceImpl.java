package cn.hanyuweb.shiro.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hanyuweb.shiro.bean.User;
import cn.hanyuweb.shiro.dao.UserDao;
import cn.hanyuweb.shiro.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	public User queryUserByLoginacct(String loginacct) {
		return userDao.queryUserByLoginacct(loginacct);
	}
}
