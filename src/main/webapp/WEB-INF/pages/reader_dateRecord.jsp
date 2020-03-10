<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="reader_public.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的借还</title>
</head>
<div class="panel panel-default" style="width: 90%;margin-left: 5%;margin-top: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            	我的借还日志
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
	            <tr>
	                <th>流水号</th>
	                <th>借出日期</th>
	                <th>归还日期</th>
	                <th>借还状况</th>
	            </tr>
            </thead>
            <tbody>
	            <c:forEach items="${dateRecord}" var="date">
	                <tr>
	                    <td><c:out value="${date.bookId}"></c:out></td>
	                    <td><c:out value="${date.borrowDate}"></c:out></td>
	                    <td><c:out value="${date.returnDate}"></c:out></td>
	                    <c:if test="${empty date.returnDate}">
	                        <td><a class="btn btn-danger btn-xs">未归还</a></td>
	                    </c:if>
	                    <c:if test="${!empty date.returnDate}">
	                        <td><a class="btn btn-success btn-xs">已归还</a></td>
	                    </c:if>
	                    <%-- <c:if test="">
	                        <td>超期</td>
	                    </c:if> --%>
	                </tr>
	            </c:forEach>
            </tbody>
        </table>
    </div>
</div>	
</body>
</html>