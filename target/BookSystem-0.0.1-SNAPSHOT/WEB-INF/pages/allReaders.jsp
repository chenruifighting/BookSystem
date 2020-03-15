<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="public.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>全部读者</title>
</head>
<body>
<div class="panel panel-default" style="position:relative;top: 110px;width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            	全部读者
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
	            <tr>
	                <th>读者ID</th>
	                <th>姓名</th>
	                <th>性别</th>
	                <th>年龄</th>
	                <th>地址</th>
	                <th>电话</th>
	                <th>编辑</th>
	                <th>借阅详情</th>
	            </tr>
            </thead>
            <tbody>
	            <c:forEach items="${pageInfo.list}" var="reader">
	                <tr>
	                    <td><c:out value="${reader.readerId}"></c:out></td>
	                    <td><c:out value="${reader.name}"></c:out></td>
	                    <td><c:out value="${reader.sex}"></c:out></td>
	                    <td><c:out value="${reader.age}"></c:out></td>
	                    <td><c:out value="${reader.address}"></c:out></td>
	                    <td><c:out value="${reader.telephone}"></c:out></td>
	                    <td><a href="${pageContext.request.contextPath}/reader/updateReader?readerId=<c:out value="${reader.readerId}"></c:out>"><button type="button" class="btn btn-info btn-xs">编辑</button></a></td>
	                    <td><a href="${pageContext.request.contextPath}/reader/selectBooks?readerId=<c:out value="${reader.readerId}"></c:out>"><button type="button" class="btn btn-success btn-xs">借阅详情</button></a></td>
					</tr>
	            </c:forEach>
            </tbody>
        </table>
        <form action="${pageContext.request.contextPath}/reader/allReaders" method="post" id="choicePage">
            <table border="1" align="right" >
                <tr>
					<td>第${pageInfo.pageNum}页 共${pageInfo.pages}页 <a href="${pageContext.request.contextPath}/reader/allReaders?page=${pageInfo.navigateFirstPage}">首页</a></td>
					<td><a href="${pageContext.request.contextPath}/reader/allReaders?page=${pageInfo.prePage>0?pageInfo.prePage:pageInfo.navigateFirstPage}">上一页</a></td>
					<td><a href="${pageContext.request.contextPath}/reader/allReaders?page=${pageInfo.nextPage>0?pageInfo.nextPage:pageInfo.navigateLastPage}">下一页</a></td>
					<td><a href="${pageContext.request.contextPath}/reader/allReaders?page=${pageInfo.navigateLastPage}">最后一页</a></td>
					<td>转到第:<input type="text" name="page" id="page" size="1">页<input type="submit" value="GO"></td>
                </tr>
            </table>
            <script>
            	function mySubmit(flag){
            		return flag;
	            }
            	$("#choicePage").submit(function () {
                    if($("#page").val()==''){
                        alert("请填入页号！");
                        return mySubmit(false);
                    }
                })        
	       </script> 
 		</form>
    </div>
</div>
</body>
</html>

