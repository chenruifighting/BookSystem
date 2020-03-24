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
</head>
<body>
<h2 style="text-align: center;font-family: 'Adobe 楷体 Std R';color: palevioletred">图 书 馆</h2>
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
        <label>
            <h3 class="panel-title">请登录</h3>
        </label>
        <a style="margin-left: 200px" href="${pageContext.request.contextPath}/user/reg">用户注册</a>
    </div>
    <form action="${pageContext.request.contextPath}/user/doLogin" method="post">
	    <div class="panel-body">
	        <div class="form-group">
	            <label for="id">用户ID</label>
	           	<input type="text" class="form-control" name="id" id="id" placeholder="请输入用户ID">
	        </div>
	        <div class="form-group">
	            <label for="password">密码</label>
	            <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
	        </div>
			<div class="checkbox text-left">
                <label>
                   <input type="checkbox" id="remember">记住密码
                </label>
                <a style="margin-left: 170px" href="${pageContext.request.contextPath}/user/forgetPwd">忘记密码?</a>
			</div>
            <p style="text-align: right;color: red;position: absolute" id="info">${msg}</p><br>
            <button id="loginButton"  class="btn btn-primary  btn-block">登录</button>
	    </div>
    </form>
</div>
</body>
</html>