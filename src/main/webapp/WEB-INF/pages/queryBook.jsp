<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="public.jsp"%>
<html>
<head>
    <title>查询图书</title>
</head>
<body>
<div style="padding: 80px 350px 30px 600px"></div>
<div class="panel panel-default" style="width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
           	 查询图书
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
	            <tr>
	            	<th>流水号</th>
	                <th>书名</th>
	                <th>作者</th>
	                <th>出版社</th>
	                <th>价格</th>
	                <th>详情</th>
	                <th>编辑</th>
	                <th>删除</th>
	            </tr>
            </thead>
            <tbody>
	            <c:forEach items="${books}" var="book">
		            <tr>
		            	<td><c:out value="${book.id}"></c:out></td>
		                <td><c:out value="${book.name}"></c:out></td>
		                <td><c:out value="${book.author}"></c:out></td>
		                <td><c:out value="${book.publish}"></c:out></td>
		                <td><c:out value="${book.price}"></c:out></td>
		                <td><a href="${pageContext.request.contextPath}/book/queryOne?id=<c:out value="${book.id}"></c:out>"><button type="button" class="btn btn-success btn-xs">详情</button></a></td>
		                <td><a href="${pageContext.request.contextPath}/book/updateQuery?id=<c:out value="${book.id}"></c:out>"><button type="button" class="btn btn-info btn-xs">编辑</button></a></td>
		                <td><a href="${pageContext.request.contextPath}/book/delete?id=<c:out value="${book.id}"></c:out>"><button type="button" class="btn btn-danger btn-xs" onclick="return confirm('确定将此记录删除？')">删除</button></a></td>
		            </tr>
	            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>