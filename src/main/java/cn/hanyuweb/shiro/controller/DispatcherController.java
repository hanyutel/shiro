package cn.hanyuweb.shiro.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.hanyuweb.shiro.bean.User;
import cn.hanyuweb.shiro.util.MD5Util;

@Controller
public class DispatcherController {
	
	@RequestMapping("/demo")
	public String doc() {
		return "demo";
	}
	
	@RequestMapping("/500")
	public String error500() {
		return "500";
	}
	
	@RequestMapping(value={"", "/", "/index", "/index/"})
	public String index() {
		return "index";
	}
	
	@RequestMapping("/unauthorized")
	public String unauthorized() {
		return "unauthorized";
	}
	
	@RequestMapping("/login")
	public String login() {
		Subject currentUser = SecurityUtils.getSubject();
		if ( currentUser.isAuthenticated() ) {
			return "redirect:/user/index";
		}
		return "login";
	}
	
	@RequestMapping("**/logout")
	public String logout() {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "redirect:/";
	}
	
	/**
	 * 用户登录
	 * 
	 * 记住我  的参数名称固定为rememberMe， 和Shiro框架中的记住我cookie名保持一致
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/dologin")
	public Object dologin( User user, @RequestParam(value="rememberMe", required=false, defaultValue="0")String rememberme ) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			Subject currentUser = SecurityUtils.getSubject();
			// 构建令牌（账号，加密后的密码）
			UsernamePasswordToken token =
				new UsernamePasswordToken(user.getLoginacct(), user.getUserpswd());
			token.setRememberMe("1".equals(rememberme));
			// 创建认证主体
			
			// 登陆认证，此时，会调用配置的Realm进行校验。
			currentUser.login(token);
			resultMap.put("success", true);
		} catch ( UnknownAccountException e ) {
			resultMap.put("errorMsg", "登陆账号不存在，请重新登陆");
			resultMap.put("success", false);
		} catch ( IncorrectCredentialsException e ) {
			resultMap.put("errorMsg", "登陆密码不正确，请重新登陆");
			resultMap.put("success", false);
		}
		
		return resultMap;
	}
}

