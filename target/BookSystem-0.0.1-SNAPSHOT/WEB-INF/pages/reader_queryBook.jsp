<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="reader_public.jsp"%>
<html>
<head>
    <title>查询图书</title>
</head>
<body>
<div class="panel panel-default" style="width: 90%;margin-left: 5%;margin-top: 5%">
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
	                <th>借还</th>
	                <th>详情</th>
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
		                <c:if test="${book.state==1}">
		                    <td>在馆</td>
		                </c:if>
		                <c:if test="${book.state==0}">
		                    <td>借出</td>
		                </c:if>
		                <td><a href="${pageContext.request.contextPath}/book/reader_queryDetails?id=<c:out value="${book.id}"></c:out>"><button type="button" class="btn btn-success btn-xs">详情</button></a></td>
		            </tr>
	            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>