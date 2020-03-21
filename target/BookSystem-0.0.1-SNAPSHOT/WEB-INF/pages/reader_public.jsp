<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
    <style>
        body{
            background-color: rgb(240,242,245);
        }
    </style>
</head>
<body background="${pageContext.request.contextPath}/images/reader_show.jpg">
	<nav class="navbar navbar-default" role="navigation" style="background-color:#fff" style="background-color:#fff">
	    <div class="container-fluid">
	        <div class="navbar-header" style="margin-left: 8%;margin-right: 1%">
	            <a class="navbar-brand ">我的图书馆</a>
	        </div>
	        <div class="collapse navbar-collapse" id="example-navbar-collapse">
	            <ul class="nav navbar-nav navbar-left">
	                <li class="active">
	                    <a href="${pageContext.request.contextPath}/book/reader_allBooks?page=1" >
	                        	图书查询
	                    </a>
	                </li>
	                <li class="dropdown">
	                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                       	 	个人信息
	                        <b class="caret"></b>
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="${pageContext.request.contextPath}/reader/readerInfo?readerId=${user.id}">查看信息</a></li>
	                        <li class="divider"></li>
	                        <li><a href="${pageContext.request.contextPath}/reader/reader_updateInfo?readerId=${user.id}">修改信息</a></li>
	                    </ul>
                	</li>
	                <li>
	                    <a href="${pageContext.request.contextPath}/date/reader_dateRecord?readerId=${user.id}" >
	                        	我的借还
	                    </a>
	                </li>
	                <li>
	                    <a href="${pageContext.request.contextPath}/user/repassword" >
	                        	修改密码
	                    </a>
	                </li>
	            </ul>
	            <ul class="nav navbar-nav navbar-right">
	                <li><a><span class="glyphicon glyphicon-user"></span>&nbsp;借阅者：${user.name}，已登录</a></li>
	                <li><a href="${pageContext.request.contextPath}/user/login"><span class="glyphicon glyphicon-log-in"></span>&nbsp;退出</a></li>
	            </ul>
	        </div>
	    </div>
	</nav>
</body>
</html>
