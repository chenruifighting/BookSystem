package com.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.pojo.Books;
import com.pojo.Reader;

public interface IBookService {
	/**
	 * 查询所有图书
	 * @return
	 */
	PageInfo<Books> selectBooks(Integer page);
	/**
	 * 添加图书
	 * @param books
	 */
	void insert(Books books);
	/**
	 * 根据id查询图书信息
	 * @param id
	 * @return
	 */
	Books selectOne(Integer id);
	/**
	 * 根据id更新图书信息
	 * @param books
	 */
	void update(Books books);
	/**
	 * 根据id删除图书信息
	 * @param id
	 */
	void delete(Integer id);
	/**
	 * 根据图书名查询图书信息
	 * @param name
	 * @return
	 */
	List<Books> queryBooks(String name);
	/**
	 * 根据id查询图书信息
	 * @param id
	 * @return
	 */
	Books borrowId(Integer id);
	/**
	 * 改变state状态
	 * @param reader
	 */
	void updateState(Reader reader);
	/**
	 * 根据图书id归还图书
	 * @param id
	 */
	void returnBook(Integer id);
}
