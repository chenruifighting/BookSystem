<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>${reader.name}的主页</title>
</head>
<body>
<div class="col-xs-6 col-md-offset-3" style="position: relative;margin-top: 7%">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">确认读者信息</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tr>
                    <th width="20%">读者ID</th>
                    <td>${reader.readerId}</td>
                </tr>
                <tr>
                    <th>姓名</th>
                    <td>${reader.name}</td>
                </tr>
                <tr>
                    <th>性别</th>
                    <td>${reader.sex}</td>
                </tr>
                <tr>
                    <th>年龄</th>
                    <td>${reader.age}</td>
                </tr>
                <tr>
                    <th>地址</th>
                    <td>${reader.address}</td>
                </tr>
                <tr>
                    <th>电话</th>
                    <td>${reader.telephone}</td>
                </tr>
                </tbody>
            </table>
            <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/book/returnBook?id=${bookId}" role="button">确认归还</a>
        </div>
    </div>
</div>
</body>
</html>