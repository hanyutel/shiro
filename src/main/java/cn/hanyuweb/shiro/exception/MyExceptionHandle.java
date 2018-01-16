package cn.hanyuweb.shiro.exception;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class MyExceptionHandle {

	@ExceptionHandler(value={UnauthorizedException.class})
	public String error() {
		return "redirect:/unauthorized";
	}
	
	@ExceptionHandler(value={Throwable.class})
	public String error500() {
		return "redirect:/500";
	}
}
