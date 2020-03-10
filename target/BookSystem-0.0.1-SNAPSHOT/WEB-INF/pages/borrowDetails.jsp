<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="public.jsp"%>
<html>
<head>
    <title>所借全部图书</title>
    <style>
		h1 {
            margin: 0 10px;
            font-size: 50px;
            text-align: center;
        }
        h1 span {
            color: #bbb;
        }
	</style>
</head>
<body>
<div class="panel panel-default" style="position:relative;top: 110px;width: 90%;margin-left: 5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">
           	 所借全部图书
        </h3>
    </div>
    <c:choose>
	    <c:when test="${books.size()==0}">
	    	<div class="panel-body">
	        	<h1><span>It's Nothing!!!</span></h1>
	        </div>
	    </c:when>
		<c:otherwise>
	       	<div class="panel-body">
		        <table class="table table-hover">
		            <thead>
			            <tr>
			                <th>流水号</th>
				            <th>书名</th>
				            <th>作者</th>
				            <th>出版社</th>
				            <th>语言</th>
				            <th>价格</th>
				            <th>归还状况</th>
			            </tr>
		            </thead>
		            <tbody>
			            <c:forEach items="${books}" var="book">
					       <tr>
				                <td><c:out value="${book.id}"></c:out></td>
					 			<td><c:out value="${book.name}"></c:out></td>
				               	<td><c:out value="${book.author}"></c:out></td>
				               	<td><c:out value="${book.publish}"></c:out></td>
				               	<td><c:out value="${book.language}"></c:out></td>
				               	<td><c:out value="${book.price}"></c:out></td>
				               	<c:if test="${book.state==1}">
				                    <td><a class="btn btn-success btn-xs">已归还</a></td>
				                </c:if>
				                <c:if test="${book.state==0}">
				                   	<td><a class="btn btn-danger btn-xs">未归还</a></td>
				                </c:if>
				           </tr>
				        </c:forEach>
		            </tbody>
		        </table>
	    	</div>
	    </c:otherwise>
	</c:choose>
</div>
</body>
</html>
