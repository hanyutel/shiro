package cn.hanyuweb.shiro.controller;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping("/index")
	public String index() {
		return "user/index";
	}
	
	@RequestMapping("/delete")
	@RequiresRoles("pm")
	public String deleteUser() {
		return "user/delete";
	}
	
	@RequestMapping("/edit")
	@RequiresRoles(value={"se", "pm"}, logical=Logical.OR)
	public String editUser() {
		return "user/edit";
	}
	
	/**
	 * RequiresRoles注解表示当前方法需要什么样的角色可以访问，默认多个角色关系为And，
	 * 也可以增加logical属性设定为or
	 * 
	 * 其他相关的注解：
	 *     @RequiresPermissions
	 *         当前Subject需要拥有某些特定的权限时，才能执行被该注解标注的方法
	 *     @RequiresAuthentication
	 *         方法在访问或调用时，当前Subject必须在当前session中已经过认证。
	 *     @RequiresUser
	 *         当前Subject必须是应用的用户(包括记住我)，才能访问或调用被该注解标注的类，实例，方法。
	 *     @RequiresGuest
	 *         方法在访问或调用时，不需要经过认证或者在原先的session中存在记录。
	 * @return
	 */
	@RequestMapping("/add")
	@RequiresRoles(value={"pg", "se", "pm"}, logical=Logical.OR)
	public String addUser() {
		return "user/add";
	}
}
