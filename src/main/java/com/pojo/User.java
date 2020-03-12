package com.pojo;

import lombok.Data;

/**
 * 用户的登录
 * @author 陈睿
 *
 */
@Data
public class User {
	private Integer id;
	private String name;
	private String password;
	private Integer role;
}
