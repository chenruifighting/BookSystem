<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录首页</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/> 
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
   	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
    <script src="${pageContext.request.contextPath}/js/js.cookie.js"></script>
    <script src="${pageContext.request.contextPath}/js/model.js"></script>
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
    <script type="text/javascript">
	    $(function(){
			$("[href]").click(function(){
				const role=$("#role:checked").val();
		       	$.ajax({
		        url:"user/roleReg",
		        data:{"role":role},
		      }); 
		   });
	   });
	</script>
</head>
<body>
<h2 style="text-align: center;font-family: 'Adobe 楷体 Std R';color: palevioletred">图书管理系统</h2>
<div style="float:right;" id="github_iframe"></div>
<div id="myCarousel" class="carousel slide">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img src="${pageContext.request.contextPath}/images/one.png" alt="第一张">
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/images/two.png" alt="第二张">
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/images/three.png" alt="第三张">
        </div>
	</div>
    <a class="carousel-control left" href="#myCarousel"
       data-slide="prev">&lsaquo;
    </a>
    <a class="carousel-control right" href="#myCarousel"
       data-slide="next">&rsaquo;
    </a>
</div>
<div class="panel panel-default" id="login">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">请登录</h3>
    </div>
    <form action="${pageContext.request.contextPath}/user/doLogin" method="post" onSubmit="return show(this)">
	    <div class="panel-body">
	        <div class="form-group">
	            <label for="id">用户ID</label>
	           	<input type="text" class="form-control" name="id" placeholder="请输入用户ID">
	        </div>
	        <div class="form-group">
	            <label for="password">密码</label>
	            <input type="password" class="form-control" name="password" placeholder="请输入密码">
	        </div>
			<div class="radio text-left">
	            <label>
					<input type="radio" id="role" name="role" value="0" checked>借阅者 	
	            </label>
	            <label>
					<input type="radio" id="role" name="role" value="1">管理员	
	            </label>
	           	<label>
	           		<a style="text-align: right;color: red;position: absolute" id="info">${msg}</a>
	           	</label>
			</div>
			<div class="radio text-left">
	            <label>
	                <input type="submit" style="margin-left: 3px" class="btn btn-primary  btn-block" value="登录">	
	            </label>
	            <label>
        			<a href="${pageContext.request.contextPath}/user/reg" style="margin-right: 5px" class="btn btn-primary  btn-block">注册</a> 
        		</label>
        	</div>
	    </div>
    </form>
</div>
</body>
</html>