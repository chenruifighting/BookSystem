package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.pojo.DateRecord;
@Repository("dateRecordDao")
public interface IDateRecordDao {
	/**
	 * 保存借书时间
	 * @param readerId
	 * @param bookId
	 * @param readerName
	 */
	@Insert("insert into daterecord(bookId,readerId,readerName,borrowDate) values(#{bookId},#{readerId},#{readerName},Now())")
	void updateDate(@Param("readerId") Integer readerId,@Param("bookId") Integer bookId,@Param("readerName")String readerName);
	/**
	 * 根据bookId更新还书时间
	 * @param bookId
	 */
	@Update("update daterecord set returnDate=now() where bookId=#{bookId}")
	void returnDate(@Param("bookId") Integer bookId);
	/**
	 * 查询借还日志
	 * @return
	 */
	@Select("select * from daterecord")
	List<DateRecord> dateRecord();
	/**
	 * 根据bookIdId删除读者
	 * @param bookId
	 */
	@Delete("delete from daterecord where bookId=#{bookId}")
	void delete(Integer bookId);
	/**
	 * 根据readerId查询借还信息
	 * @param ReaderId
	 * @return
	 */
	@Select("select * from daterecord where readerId=#{readerId}")
	List<DateRecord> selectByReaderId(Integer ReaderId);
}
