package com.service;

import java.util.List;

import com.pojo.Books;
import com.pojo.Reader;

public interface IReaderService {
	/**
	 * 保存读者信息
	 * @param reader
	 */
	void insert(Reader reader);
	/**
	 * 根据书名号查询读者信息
	 * @param bookId
	 * @return
	 */
	Reader returnReader(Integer bookId);
	/**
	 * 查询所有读者
	 * @return
	 */
	List<Reader> selectReaders(Integer page);
	/**
	 * 查询读者总数量
	 * @return
	 */
	Integer pageCount();
	/**
	 * 根据readerId查询读者信息
	 * @param readerId
	 * @return
	 */
	Reader selectOne(Integer readerId);
	/**
	 * 根据readerId更新读者信息
	 * @param reader
	 */
	void doUpdateReader(Reader reader);
	/**
	 * 查询还书读者
	 * @return
	 */
	List<Reader> returnReaders();
	/**
	 * 增加读者
	 * @param reader
	 */
	void addReader(Reader reader);
	/**
	 * 根据readerId查询所借图书
	 * @param readerId
	 * @return
	 */
	List<Books> selectBooks(Integer readerId);
	/**
	 * 根据姓名查询个人信息
	 * @param readerId
	 * @return
	 */
	Reader readerInfo(Integer readerId);
}
