function show(f){
	if(!(/^.+$/.test(f.id.value))){
		$("#info").text("用户ID不能为空");
		return false;
	}
	if(!(/^.+$/.test(f.name.value))){
		$("#info").text("用户名不能为空");
		return false;
	}
	if(!(/^\w{5,12}$/.test(f.password.value))){
		$("#info").text("密码必须是5~12位");
		return false;
	}
	if(!(/^\w{5,12}$/.test(f.confirmPwd.value))){
		$("#info").text("确认密码必须是5~12位");
		return false;
	}
	if(!((f.password.value)==(f.confirmPwd.value))){
		$("#info").text("密码和确认密码不一致");
		return false;
	}
	return true;
}