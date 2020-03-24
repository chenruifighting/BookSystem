$(function(){
	setLoginStatus();
	$("#loginButton").click(function () {
		let id=$("#id").val();
		let password=$("#password").val();
		let checked=$("#remember").prop('checked');
		if (!(/^.+$/.test(id))) {
			$("#info").text("用户ID不能为空");
			return false;
		}else if (!(/^\w{5,12}$/.test(password))) {
			$("#info").text("密码必须是5~12位");
			return false;
		}else if(checked){   //记住密码，保存在cookie
			Cookies.set("id",id, {expires: 30});
			Cookies.set("password",password, {expires: 30});
			Cookies.set("remember",checked, {expires: 30});
		}else {  //不记住密码，删除cookie
			Cookies.remove("id");
			Cookies.remove("password");
			Cookies.remove("remember");
		}
		return true;
	});
});
function setLoginStatus() {  //页面初始化时，如果是记住密码，给输入框赋值
	if(Cookies.get("remember") == "true"){
		$("#id").val(Cookies.get("id"));
		$("#password").val(Cookies.get("password"));
		$("#remember").prop("checked",true);
	}
}
