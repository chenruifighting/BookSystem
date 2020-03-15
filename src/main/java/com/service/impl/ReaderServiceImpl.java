package com.service.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.IReaderDao;
import com.pojo.Books;
import com.pojo.Reader;
import com.service.IReaderService;
@Service("readerService")
public class ReaderServiceImpl implements IReaderService{
	@Autowired
	private IReaderDao readerDao;
	@Override
	public void insert(Reader reader) {
		// TODO Auto-generated method stub
		readerDao.insert(reader);
	}
	@Override
	public Reader returnReader(Integer bookId) {
		// TODO Auto-generated method stub
		return readerDao.returnReader(bookId);
	}
	@Override
	public PageInfo<Reader> selectReaders(Integer page) {
		PageHelper.startPage(page,4);
		List<Reader> list=readerDao.selectReaders();
		PageInfo pageInfo=new PageInfo(list);
		return pageInfo;
	}
	@Override
	public Reader selectOne(Integer readerId) {
		// TODO Auto-generated method stub
		return readerDao.selectOne(readerId);
	}
	@Override
	public void doUpdateReader(Reader reader) {
		// TODO Auto-generated method stub
		readerDao.doUpdateReader(reader);
	}
	@Override
	public List<Reader> returnReaders() {
		// TODO Auto-generated method stub
		return readerDao.returnReaders();
	}
	@Override
	public void addReader(Reader reader) {
		// TODO Auto-generated method stub
		readerDao.addReader(reader);
	}
	@Override
	public List<Books> selectBooks(Integer readerId) {
		// TODO Auto-generated method stub
		return readerDao.selectBooks(readerId);
	}
	@Override
	public Reader readerInfo(Integer readerId) {
		// TODO Auto-generated method stub
		return readerDao.readerInfo(readerId);
	}
}
