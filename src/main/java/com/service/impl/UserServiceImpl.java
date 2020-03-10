package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.IUserDao;
import com.pojo.User;
import com.service.IUserService;
@Service("userService")
public class UserServiceImpl implements IUserService{
	@Autowired
	private IUserDao userdao;
	@Override
	public void insert(User user) {
		// TODO Auto-generated method stub
		userdao.insert(user);
	}
	@Override
	public List<User> selectUser() {
		// TODO Auto-generated method stub
		return userdao.selectUser();
	}
	@Override
	public String selectOne(Integer id) {
		// TODO Auto-generated method stub
		return userdao.selectOne(id);
	}
	@Override
	public void update(Integer id, String password) {
		// TODO Auto-generated method stub
		userdao.update(id,password);
	}
}
