package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.pojo.Books;
import com.pojo.Reader;
@Repository("readerDao")
public interface IReaderDao {
	/**
	 * 保存读者信息
	 * @param reader
	 */
	@Insert("insert ignore into reader(readerId,name,age,sex,telephone,address) values(#{readerId},#{name},#{age},#{sex},#{telephone},#{address})")
	void insert(Reader reader);
	/**
	 * 根据书名号查询读者信息
	 * @param bookId
	 * @return
	 */
	@Select("select reader.* from reader,daterecord where daterecord.bookId=#{bookId} and daterecord.readerId=reader.readerId")
	Reader returnReader(Integer bookId);
	/**
	 * 查询所有读者
	 * @return
	 */
	@Select("select * from reader")
	List<Reader> selectReaders();
	/**
	 * 根据bookId，readerId查询读者信息
	 * @param readerId
	 * @return
	 */
	@Select("select * from reader where readerId=#{readerId}")
	Reader selectOne(Integer readerId);
	/**
	 * 根据readerId更新读者信息
	 * @param reader
	 */
	@Update("update reader set name=#{name},age=#{age},sex=#{sex},address=#{address},telephone=#{telephone} where readerId=#{readerId}")
	void doUpdateReader(Reader reader);
	/**
	 * 查询还书读者
	 * @return
	 */
	@Select("select distinct reader.* from reader,books where reader.bookId=books.id and books.state=1")
	List<Reader> returnReaders();
	/**
	 * 增加读者
	 * @param
	@Insert("insert into reader(readerId,name,age,sex,telephone,address) values(#{readerId},#{name},#{age},#{sex},#{telephone},#{address})")
	void addReader(Reader reader);
	/**
	 * 根据readerId查询所借图书
	 * @param readerId
	 * @return
	 */
	@Select("select books.* from books,daterecord where  books.id=daterecord.bookId and daterecord.readerId=#{readerId}")
	List<Books> selectBooks(Integer readerId);


	@Select("select readerId,name,age,sex,telephone,address from reader where readerId=#{readerId}")
	Reader readerInfo(Integer readerId);
}
