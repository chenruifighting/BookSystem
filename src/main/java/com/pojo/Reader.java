package com.pojo;

import lombok.Data;

/**
 * 读者信息的实体类
 * @author 陈睿
 *
 */
@Data
public class Reader {
	private int readerId;
	private int bookId;
	private String name;
	private int age;
	private String sex;
	private String telephone;
	private String address;
}
