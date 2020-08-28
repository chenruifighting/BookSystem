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
		dateRecordDao.updateDate(readerId,bookId,readerName);
	}
	@Override
	public void returnDate(Integer bookId) {
		dateRecordDao.returnDate(bookId);
	}
	@Override
	public List<DateRecord> dateRecord() {
		return dateRecordDao.dateRecord();
	}
	@Override
	public void delete(Integer bookId) {
		dateRecordDao.delete(bookId);
	}
	@Override
	public List<DateRecord> selectByReaderId(Integer ReaderId) {
		return dateRecordDao.selectByReaderId(ReaderId);
	}
}
