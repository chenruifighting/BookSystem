package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pojo.User;
import com.service.IUserService;
import com.util.Md5Class;

@SessionAttributes({"user","code"})
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private IUserService userService;
	/**
	 * 验证用户，正确跳转到用户页面或者管理员页面
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/doLogin")
	public String doLogin(User user, Model model) {
		List<User> users=userService.selectUser();
		for (User u : users) {
			if(user.getId().equals(u.getId())&& Md5Class.stringToMd5(user.getPassword()).equals(u.getPassword())&&u.getRole()==1){
				model.addAttribute("user",u);
				return "show";
			}else if(user.getId().equals(u.getId())&& Md5Class.stringToMd5(user.getPassword()).equals(u.getPassword())&&u.getRole()==0){
				model.addAttribute("user",u);
				return "reader_show";
			}
		}
		model.addAttribute("msg","用户名或者密码错误");
		return "login";
	}
	/**
	 * 跳转到注册页面
	 * @return
	 */
	@RequestMapping("/reg")
	public String register() {
		return "register";
	}
	/**
	 * 利用ajax验证用户ID是否可用
	 * @param user
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/checkUser")
	public void checkName(User user,HttpServletResponse response) throws Exception {
		List<User> users=userService.selectUser();
		response.setContentType("application/json;charset=utf-8");
		Map<String,Object> map=new HashMap<String,Object>();
		for (User u : users) {
			if(user.getId().equals(u.getId())){
				map.put("userExsit",true);
				map.put("msg","此用户ID太受欢迎，请更换一个");
				break;
			}else if(user.getId().toString().trim()!=null){
				map.put("userExsit",false);
				map.put("msg","此用户ID可用");
			}else {
				break;
			}
		}
		ObjectMapper mapper=new ObjectMapper();
		mapper.writeValue(response.getWriter(),map);
	}
	/**
	 * 注册用户，用户密码进行加密处理
	 * @param user
	 * @return
	 */
	@RequestMapping("/doReg")
	public String doRegister(User user) {
		user.setPassword(Md5Class.stringToMd5(user.getPassword()));
		userService.insert(user);
		return "forward:/user/login";
	}
	/**
	 * 跳转到修改密码界面
	 * @return
	 */
	@RequestMapping("/repassword")
	public String repassword() {
		return "repassword";
	}
	/**
	 * 修改密码
	 * @param oldPwd
	 * @param password
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/doRepassword")
	public String doRepassword(String oldPwd,String password,ModelMap modelMap) {
		User user= (User) modelMap.get("user");
		User u=userService.selectOne(user.getId());
		if(Md5Class.stringToMd5(oldPwd).equals(u.getPassword())&&user.getRole()==1) {
			userService.update(user.getId(),Md5Class.stringToMd5(password));
			return "show";
		}else if(Md5Class.stringToMd5(oldPwd).equals(u.getPassword())&&user.getRole()==0){
			userService.update(user.getId(),Md5Class.stringToMd5(password));
			return "reader_show";
		}else {
			modelMap.addAttribute("msg","旧密码输入错误");
			return "repassword";
		}
	}
	/**
	 * 退出登录，跳转到用户登录页面
	 * @return
	 */
	@RequestMapping("/login")
	public String login(SessionStatus status) {
		status.setComplete();
		return "login";
	}
	/**
	 * 跳转到忘记密码界面
	 * @return
	 */
	@RequestMapping("/forgetPwd")
	public String forgetPwd() {
		return "forgetPwd";
	}
	@RequestMapping("/doForgetPwd")
	public String doForgetPwd(User user,String code, ModelMap modelMap) {
		if(modelMap.get("code")==null){
			modelMap.addAttribute("msg","请先获取验证码");
			return "forgetPwd";
		}
		User u=userService.selectOne(user.getId());
		if(u!=null){
			if(user.getName().equals(u.getName())&&code.equals(modelMap.get("code"))){
				userService.update(user.getId(),Md5Class.stringToMd5(user.getPassword()));
				return "login";
			}else if(!user.getName().equals(u.getName())){
				modelMap.addAttribute("msg","用户名输入错误");
				return "forgetPwd";
			}else {
				modelMap.addAttribute("msg","验证码输入错误");
				return "forgetPwd";
			}
		}
		modelMap.addAttribute("msg","用户ID不存在");
		return "forgetPwd";
	}

	/**
	 *	通过短信将验证码发送到手机
	 * @param telephone
	 * @param model
	 */
	@RequestMapping("/code")
	@ResponseBody
	public void code(String telephone, Model model){
		String code="";
		for(int i = 1 ; i <= 6;i++){
			code+=(int)Math.floor(Math.random()*10);
		}
		model.addAttribute("code",code);
		DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAI4FmNSpNLY6gtmxBU2GpF", "2OYsoj8WTRqDOhM2wKpCrdENlpCiFE");
		IAcsClient client = new DefaultAcsClient(profile);

		CommonRequest request = new CommonRequest();
		request.setMethod(MethodType.POST);
		request.setDomain("dysmsapi.aliyuncs.com");
		request.setVersion("2017-05-25");
		request.setAction("SendSms");
		request.putQueryParameter("RegionId","cn-hangzhou");
		request.putQueryParameter("PhoneNumbers",telephone);
		request.putQueryParameter("SignName","图书管理系统");
		request.putQueryParameter("TemplateCode","SMS_186395978");
		request.putQueryParameter("TemplateParam","{'code':"+code+"}");
		try {
			client.getCommonResponse(request);
		} catch (ServerException e) {
			e.printStackTrace();
		} catch (ClientException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 短信过期，将code删除
	 * @param status
	 */
	@RequestMapping("/timeOut")
	public void timeOut(SessionStatus status){
		status.setComplete();
	}
}
