package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.IDateRecordDao;
import com.pojo.DateRecord;
import com.service.IDateRecordService;
@Service("dateRecordService")
public class DateRecordServiceImpl implements IDateRecordService{
	@Autowired
	private IDateRecordDao dateRecordDao;
	@Override
	public void updateDate(Integer readerId,Integer bookId,String readerName) {
		// TODO Auto-generated method stub
		dateRecordDao.updateDate(readerId,bookId,readerName);
	}
	@Override
	public void returnDate(Integer bookId) {
		// TODO Auto-generated method stub
		dateRecordDao.returnDate(bookId);
	}
	@Override
	public List<DateRecord> dateRecord() {
		// TODO Auto-generated method stub
		return dateRecordDao.dateRecord();
	}
	@Override
	public void delete(Integer bookId) {
		// TODO Auto-generated method stub
		dateRecordDao.delete(bookId);
	}
	@Override
	public List<DateRecord> selectByReaderId(Integer ReaderId) {
		// TODO Auto-generated method stub
		return dateRecordDao.selectByReaderId(ReaderId);
	}
}
