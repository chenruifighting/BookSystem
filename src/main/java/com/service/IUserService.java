package com.service;

import java.util.List;

import com.pojo.User;

public interface IUserService {
	/**
	 * 将用户名，密码保存到数据库中
	 * @param user
	 */
	void insert(User user);
	/**
	 * 查询用户
	 * @return
	 */
	List<User> selectUser();
	/**
	 * 根据姓名查询密码
	 * @param id
	 * @return
	 */
	String selectOne(Integer id);
	/**
	 * 根据姓名修改密码
	 * @param id
	 * @param password
	 */
	void update(Integer id,String password);
}
