package com.pojo;

import lombok.Data;

/**
 * 借还日志信息
 * @author 陈睿
 *
 */
@Data
public class DateRecord {
	private int id;
	private int bookId;
	private String readerName;
	private int readerId;
	private String borrowDate;
	private String returnDate;
}
