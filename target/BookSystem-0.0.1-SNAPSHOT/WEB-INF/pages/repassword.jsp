<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
    <script src="${pageContext.request.contextPath}/js/js.cookie.js"></script>
    <script src="${pageContext.request.contextPath}/js/model.js"></script>
    <script src="${pageContext.request.contextPath}/js/repassword.js"></script>
</head>
<body>
<div class="col-xs-6 col-md-offset-3" style="position: relative;margin-top: 3%">
	<div class="panel panel-primary">
		<div class="panel-body">
			<div class="panel-heading" style="background-color: #fff">
				<h3 class="panel-title">修改密码</h3>
			</div>
			<div class="panel panel-default" id="repassword">
			    <form action="${pageContext.request.contextPath}/user/doRepassword" method="post" onSubmit="return show(this)">
				    <div class="panel-body">
				        <div class="form-group">
				            <label for="oldPwd">旧密码</label>
				           	<input type="password" class="form-control" name="oldPwd" placeholder="请输入旧密码">
				        </div>
				        <div class="form-group">
				            <label for="password">新密码</label>
				            <input type="password" class="form-control" name="password" placeholder="请输入新密码">
				        </div>
				       <div class="form-group">
				            <label for="confirmPwd">确认密码</label>
				            <input type="password" class="form-control" name="confirmPwd" placeholder="请输入确认密码">
				        </div>
				        <p style="text-align: right;color: red;position: absolute" id="info">${msg}</p><br/>
			        </div>
				    <input type="submit" class="btn btn-primary  btn-block" value="确认">
			    </form>
    		</div>
    	</div>
    </div>
</div>
</body>
</html>
