<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="reader_public.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>《 ${details.name}》</title>
</head>
<body>
<div class="col-xs-6 col-md-offset-3" style="position: relative;margin-top: 3%">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">《 ${details.name}》</h3>
        </div>
        <div class="panel-body">
        <form action="${pageContext.request.contextPath}/book/reader_allBooks?page=${pageInfo.pageNum}" method="post">
            <table class="table table-hover">
                <tr>
                    <th width="15%">书名</th>
                    <td>${details.name}</td>
                </tr>
                <tr>
                    <th>作者</th>
                    <td>${details.author}</td>
                </tr>
                <tr>
                    <th>出版社</th>
                    <td>${details.publish}</td>
                </tr>
                <tr>
                    <th>简介</th>
                    <td>${details.introduction}</td>
                </tr>
                <tr>
                    <th>语言</th>
                    <td>${details.language}</td>
                </tr>
                <tr>
                    <th>价格</th>
                    <td>${details.price}</td>
                </tr>
                <tr>
                    <th>状态</th>
                    <c:if test="${details.state==1}">
                        <td>在馆</td>
                    </c:if>
                    <c:if test="${details.state==0}">
                        <td>借出</td>
                    </c:if>
				</tr>
            </table>
            <input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left">
            </form>
        </div>
    </div>
</div>
</body>
</html>