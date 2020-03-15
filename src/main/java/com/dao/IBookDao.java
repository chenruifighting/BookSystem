package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.pojo.Books;
import com.pojo.Reader;
@Repository("bookDao")
public interface IBookDao {
	/**
	 * 按分页查询所有图书
	 * @return
	 */
	@Select("select * from books")
	List<Books> selectBooks();
	/**
	 * 添加图书，并设置state状态为1，表示在馆
	 * @param books
	 */
	@Insert("insert into books(name,author,publish,introduction,language,price,state) values(#{name},#{author},#{publish},#{introduction},#{language},#{price},1)")
	void insert(Books books);
	/**
	 * 根据id查询图书信息
	 * @param id
	 * @return
	 */
	@Select("select * from books where id=#{id}")
	Books selectOne(Integer id);
	/**
	 * 根据id更新图书信息
	 * @param books
	 */
	@Update("update books set name=#{name},author=#{author},publish=#{publish},introduction=#{introduction},language=#{language},price=#{price} where id=#{id}")
	void update(Books books);
	/**
	 * 根据id删除图书信息
	 * @param id
	 */
	@Delete("delete from books where id=#{id}")
	void delete(Integer id);
	/**
	 * 根据图书名查询图书信息
	 * @param name
	 * @return
	 */
	@Select("select * from books where name=#{name}")
	List<Books> queryBooks(String name);
	/**
	 * 根据id查询图书信息
	 * @param id
	 * @return
	 */
	@Select("select * from books where id=#{id}")
	Books borrowId(Integer id);
	/**
	 * 改变state状态，当保存读者时，state变为0
	 * @param reader
	 */
	@Update("update books set state=0 where id=#{bookId}")
	void updateState(Reader reader);
	/**
	 * 根据图书id归还图书，并将state改为1
	 * @param bookId
	 */
	@Update("update books set state=1 where id=#{bookId}")
	void returnBook(@Param("bookId") Integer bookId);
}
