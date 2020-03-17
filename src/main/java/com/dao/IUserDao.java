package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.pojo.User;
@Repository("userDao")
public interface IUserDao {
	/**
	 * 查询用户
	 * @return
	 */
	@Select("select id,name,password,role from user")
	List<User> selectUser();
	/**
	 * 将用户名，密码保存到数据库中
	 * @param user
	 */
	@Insert("insert into user(id,name,password,role) values(#{id},#{name},#{password},#{role})")
	void insert(User user);
	/**
	 * 根据姓名查询密码
	 * @param id
	 * @return
	 */
	@Select("select * from user where id=#{id}")
	User selectOne(Integer id);
	/**
	 * 根据姓名修改密码
	 * @param id
	 * @param password
	 */
	@Update("update user set password=#{password} where id=#{id}")
	void update(@Param("id") Integer id,@Param("password") String password);
}
