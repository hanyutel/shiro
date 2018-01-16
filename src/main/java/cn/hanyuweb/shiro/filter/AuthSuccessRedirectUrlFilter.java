package cn.hanyuweb.shiro.filter;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

/**
 * 自定义拦截器
 * @author 18801
 *
 */
public class AuthSuccessRedirectUrlFilter extends FormAuthenticationFilter {

	/**
	 * 用户请求时往往直接访问系统中某一个功能，发现未登录，自动跳转到登陆页面
	 * 那么在登陆后，系统应该可以直接回到之前的页面。
	 */
	protected void redirectToLogin(ServletRequest request,
			ServletResponse response) throws IOException {
		String loginUrl = getLoginUrl();
		HttpServletRequest req = (HttpServletRequest)request;
		String queryString = req.getQueryString();
		StringBuffer url = req.getRequestURL();
		if ( queryString != null ) {
			url.append("?").append(queryString);	
		}
		String encodeUrl = URLEncoder.encode(url.toString(), "UTF-8");
		if ( loginUrl.indexOf("?") != -1 ) {
			loginUrl += "&";
		} else {
			loginUrl += "?";
		}
		loginUrl += "redirect_url="+encodeUrl;
		WebUtils.issueRedirect(request, response, loginUrl);
	}
}
