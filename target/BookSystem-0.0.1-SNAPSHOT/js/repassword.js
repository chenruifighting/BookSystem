function show(f){
	if(!(/^\w{1,}$/.test(f.oldPwd.value))){
		$("#info").text("旧密码不能为空");
		return false;
	}
	if(!(/^\w{5,12}$/.test(f.password.value))){
		$("#info").text("新密码必须是5~12位");
		return false;
	}
	if(!(/^\w{5,12}$/.test(f.confirmPwd.value))){
		$("#info").text("确认密码必须是5~12位");
		return false;
	}
	if(!((f.password.value)==(f.confirmPwd.value))){
		$("#info").text("新密码和确认密码不一致");
		return false;
	}
	return true;
}