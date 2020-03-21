function show(f){
	if(!(/^.+$/.test(f.id.value))){
		$("#info").text("用户ID不能为空");
		return false;
	}
	if(!(/^\w{5,15}$/.test(f.password.value))){
		$("#info").text("密码必须是5~12位");
		return false;
	}
	return true;
}