<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/js.cookie.js"></script>
    <script src="${pageContext.request.contextPath}/js/model.js"></script>
    <script src="${pageContext.request.contextPath}/js/register.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$("#id").blur(function(){
    			var id=$(this).val();
    			$.get("checkUser",{id:id},function(data){
    				var span=$("#userId");
    				if(data.userExsit){
    					span.css("color","red");
    					span.html(data.msg);
    				}else{
    					span.css("color","green");
    					span.html(data.msg);
    				}
    			},"json");
    		});
    	});
    </script>
</head>
<body>
<div class="col-xs-6 col-md-offset-3" style="position: relative;margin-top: 3%">
	<div class="panel panel-primary">
		<div class="panel-body">
			<div class="panel panel-default" id="register">
			    <div class="panel-heading" style="background-color: #fff">
			    	<c:if test="${role==1}">
	                	 <h3 class="panel-title">管理员注册</h3>     
	                </c:if>
	                <c:if test="${role==0}">
	                	 <h3 class="panel-title">借阅者注册</h3>     
	                </c:if>
			    </div>
			    <form action="${pageContext.request.contextPath}/user/doReg?role=${role}" method="post" onSubmit="return show(this)">
				    <div class="panel-body">
				        <div class="form-group">
				            <label for="id">用户ID</label>
				           	<input type="text" class="form-control" id="id" name="id" placeholder="请输入用户ID"><span id="userId"></span>
				        </div>
				        <div class="form-group">
				            <label for="name">姓名</label>
				            <input type="text" class="form-control" name="name" placeholder="请输入姓名">
				        </div>
				        <div class="form-group">
				            <label for="password">密码</label>
				            <input type="password" class="form-control" name="password" placeholder="请输入密码">
				        </div>
				       <div class="form-group">
				            <label for="confirmPwd">确认密码</label>
				            <input type="password" class="form-control" name="confirmPwd" placeholder="请输入确认密码">
				        </div>
				        <p style="text-align: right;color: red;position: absolute" id="info">${msg}</p><br/>	
			        </div>			
				    <input type="submit" class="btn btn-primary  btn-block" value="注册">
 				</form>
    		</div>
    	</div>
    </div>
</div>
</body>
</html>