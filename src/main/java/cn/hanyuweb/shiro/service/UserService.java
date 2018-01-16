package cn.hanyuweb.shiro.service;

import cn.hanyuweb.shiro.bean.User;

public interface UserService {

	User queryUserByLoginacct(String loginacct);

}
