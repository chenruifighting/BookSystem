package com.service.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.IBookDao;
import com.pojo.Books;
import com.pojo.Reader;
import com.service.IBookService;

@Service("bookService")
public class BookServiceImpl implements IBookService{
	@Autowired
	private IBookDao bookDao;
	@Override
	public PageInfo<Books> selectBooks(Integer page) {
		PageHelper.startPage(page,4);
		List<Books> list=bookDao.selectBooks();
		PageInfo pageInfo=new PageInfo(list);
		return pageInfo;
	}
	@Override
	public void insert(Books books) {
		// TODO Auto-generated method stub
		bookDao.insert(books);
	}
	@Override
	public Books selectOne(Integer id) {
		// TODO Auto-generated method stub
		return bookDao.selectOne(id);
	}
	@Override
	public void update(Books books) {
		// TODO Auto-generated method stub
		bookDao.update(books);
	}
	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		bookDao.delete(id);
	}
	@Override
	public List<Books> queryBooks(String name) {
		// TODO Auto-generated method stub
		return bookDao.queryBooks(name);
	}
	@Override
	public Books borrowId(Integer id) {
		// TODO Auto-generated method stub
		return bookDao.borrowId(id);
	}
	@Override
	public void updateState(Reader reader) {
		// TODO Auto-generated method stub
		bookDao.updateState(reader);
	}
	@Override
	public void returnBook(Integer bookId) {
		// TODO Auto-generated method stub
		bookDao.returnBook(bookId);
	}
}
