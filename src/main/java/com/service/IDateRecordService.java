package com.service;

import java.util.List;

import com.pojo.DateRecord;

public interface IDateRecordService {
	/**
	 *保存借出时间
	 * @param readerId
	 * @param bookId
	 * @param readerName
	 */
	void updateDate(Integer readerId,Integer bookId,String readerName);
	/**
	 * 根据bookId保存归还时间
	 * @param bookId
	 */
	void returnDate(Integer bookId);
	/**
	 * 查询借还日志
	 * @return
	 */
	List<DateRecord> dateRecord();
	/**
	 * 根据bookId删除读者
	 * @param bookId
	 */
	void delete(Integer bookId);
	/**
	 * 根据readerId查询借还信息
	 * @param ReaderId
	 * @return
	 */
	List<DateRecord> selectByReaderId(Integer ReaderId);
}
