package cn.hanyuweb.shiro.bean;

import java.io.Serializable;

public class Role implements Serializable {

	private Integer id;
	private String name;
	private String code;

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "角色 [" + code + "]";
	}
	
}
