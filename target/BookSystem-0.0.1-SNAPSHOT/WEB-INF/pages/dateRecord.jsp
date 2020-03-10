<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="public.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>借还日志</title>
</head>
<body>
<div class="panel panel-default" style="position:relative;top: 110px;width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            	借还日志
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
	            <tr>
	                <th>流水号</th>
	                <th>读者姓名</th>
	                <th>读者ID</th>
	                <th>借出日期</th>
	                <th>归还日期</th>
	                <th>删除</th>
	            </tr>
            </thead>
            <tbody>
	            <c:forEach items="${dateRecord}" var="date">
	                <tr>
	                    <td><c:out value="${date.bookId}"></c:out></td>
	                    <td><c:out value="${date.readerName}"></c:out></td>
	                    <td><c:out value="${date.readerId}"></c:out></td>
	                    <td><c:out value="${date.borrowDate}"></c:out></td>
	                    <td><c:out value="${date.returnDate}"></c:out></td>
	                    <c:if test="${!empty date.returnDate}">
	                	 	<td><a href="${pageContext.request.contextPath}/date/deleteReturnReader?bookId=<c:out value="${date.bookId}"></c:out>"><button type="button" class="btn btn-success btn-xs" onclick="return confirm('确定将此记录删除？')">删除</button></a></td>     
	                	</c:if>
	                	<c:if test="${empty date.returnDate}">
	                	    <td><button type="button" class="btn btn-danger btn-xs" onclick="return confirm('该图书未归还，不能删除！')">删除</button></td> 
	                	</c:if>
	                </tr>
	            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
