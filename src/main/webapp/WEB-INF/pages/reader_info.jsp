<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="reader_public.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人信息</title>
</head>
<body>
<div class="col-xs-6 col-md-offset-3" style="position: relative;margin-top: 3%">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                	我的信息
            </h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tr>
                    <th width="20%">读者ID</th>
                    <td>${readerInfo.readerId}</td>
                </tr>
                <tr>
                    <th>姓名</th>
                    <td>${readerInfo.name}</td>
                </tr>
                <tr>
                    <th>性别</th>
                    <td>${readerInfo.sex}</td>
                </tr>
                <tr>
                    <th>年龄</th>
                    <td>${readerInfo.age}</td>
                </tr>
                <tr>
                    <th>地址</th>
                    <td>${readerInfo.address}</td>
                </tr>
                <tr>
                    <th>电话</th>
                    <td>${readerInfo.telephone}</td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>
