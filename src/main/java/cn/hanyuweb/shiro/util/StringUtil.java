package cn.hanyuweb.shiro.util;

public interface StringUtil {

	public static String emptyMerge(String s, String defaultVal) {
		return isEmpty(s) ? defaultVal : s.trim();
	}
	
	public static boolean isEmpty(String s) {
		return s == null || "".equals(s.trim());
	}
	
	public static boolean isNotEmpty(String s) {
		return !isEmpty(s);
	}
}
