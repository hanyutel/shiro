package cn.hanyuweb.shiro.dao;

import org.apache.ibatis.annotations.Select;

import cn.hanyuweb.shiro.bean.User;

public interface UserDao {

	@Select("select * from t_user where loginacct = #{loginacct}")
	User queryUserByLoginacct(String loginacct);

}
