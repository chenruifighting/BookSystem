package com.pojo;

import lombok.Data;

/**
 * 图书信息的实体类
 * @author 陈睿
 *
 */
@Data
public class Books {
	private Integer id;
	private String name;
	private String author;
	private String publish;
	private String introduction;
	private String language;
	private double price;
	private int state;
}
