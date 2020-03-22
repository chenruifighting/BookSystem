<%--
  Created by IntelliJ IDEA.
  User: 陈睿
  Date: 2020/3/17
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>忘记密码</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
    <script src="${pageContext.request.contextPath}/js/model.js"></script>
    <script src="${pageContext.request.contextPath}/js/forgetPwd.js"></script>
    <script src="${pageContext.request.contextPath}/js/code.js"></script>
</head>
<body>
<div class="col-xs-6 col-md-offset-3" style="position: relative;margin-top: 3%">
    <div class="panel panel-primary">
        <div class="panel-body">
            <div class="panel-heading" style="background-color: #fff">
                <h3 class="panel-title">忘记密码</h3>
            </div>
            <div class="panel panel-default" id="forgetPwd">
                <form action="${pageContext.request.contextPath}/user/doForgetPwd" method="post" onSubmit="return show(this)">
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="id">用户ID</label>
                            <input type="text" class="form-control" name="id" placeholder="请输入用户ID">
                        </div>
                        <div class="form-group">
                            <label for="name">用户名</label>
                            <input type="text" class="form-control" name="name" placeholder="请输入用户名">
                        </div>
                        <div class="form-group">
                            <label for="telephone">手机号码</label>
                            <input type="text" class="form-control" id="telephone" name="telephone" placeholder="请输入手机号码">
                        </div>
                        <div class="form-group">
                            <label for="code"><input type="text" class="form-control" name="code" placeholder="请输入手机验证码"></label>
                            <a href="#" id="getCode">获取验证码</a>
                        </div>
                        <div class="form-group">
                            <label for="password">新密码</label>
                            <input type="password" class="form-control" name="password" placeholder="请输入新密码">
                        </div>
                        <div class="form-group">
                            <label for="confirmPwd">确认密码</label>
                            <input type="password" class="form-control" name="confirmPwd" placeholder="请输入确认密码">
                        </div>
                        <p style="text-align: right;color: red;position: absolute" id="info">${msg}</p><br>
                    </div>
                    <input type="submit" class="btn btn-primary  btn-block" value="确认">
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
