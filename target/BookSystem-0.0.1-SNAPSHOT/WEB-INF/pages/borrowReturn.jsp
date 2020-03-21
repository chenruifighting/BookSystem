<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="public.jsp"%>
<html>
<head>
    <title>全部图书</title>
</head>
<body>
<div style="padding: 80px 350px 30px 600px">
    <form   method="post" action="${pageContext.request.contextPath}/book/queryBook" class="form-inline"  id="queryBook">
        <div class="input-group">
           <input type="text" placeholder="输入图书名" class="form-control" id="book" name="name" class="form-control">
            <span class="input-group-btn">
            	<input type="submit" value="搜索" class="btn btn-default">
            </span>
        </div>
    </form>
    <script>
        function mySubmit(flag){
            return flag;
        }
        $("#queryBook").submit(function () {
            const val = $("#book").val();
            if(val==''){
                alert("请输入图书名");
                return mySubmit(false);
            }
        })
    </script>
</div>
<div class="panel panel-default" style="width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
           	 全部图书
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
	                <th>借还状况</th>
	            </tr>
            </thead>
            <tbody>
	            <c:forEach items="${pageInfo.list}" var="book">
		            <tr>
		            	<td><c:out value="${book.id}"></c:out></td>
		                <td><c:out value="${book.name}"></c:out></td>
		                <td><c:out value="${book.author}"></c:out></td>
		                <td><c:out value="${book.publish}"></c:out></td>
		                <td><c:out value="${book.price}"></c:out></td>
		                <c:if test="${book.state==1}">
		                    <td><a href="${pageContext.request.contextPath}/book/borrow?id=<c:out value="${book.id}"></c:out>"><button type="button" class="btn btn-primary btn-xs">借阅</button></a></td>
		                </c:if>
		                <c:if test="${book.state==0}">
		                    <td><a href="${pageContext.request.contextPath}/reader/return?bookId=<c:out value="${book.id}"></c:out>"><button type="button" class="btn btn-primary btn-xs">归还</button></a></td>
		                </c:if>
		            </tr>
	            </c:forEach>
            </tbody>
        </table>
        <form action="${pageContext.request.contextPath}/date/borrowReturn" method="post" id="choicePage">
            <table border="1" align="right" >
                <tr>
                    <td>第${pageInfo.pageNum}页 共${pageInfo.pages}页 <a href="${pageContext.request.contextPath}/date/borrowReturn?page=${pageInfo.navigateFirstPage}">首页</a></td>
                    <td><a href="${pageContext.request.contextPath}/date/borrowReturn?page=${pageInfo.prePage>0?pageInfo.prePage:pageInfo.navigateFirstPage}">上一页</a></td>
                    <td><a href="${pageContext.request.contextPath}/date/borrowReturn?page=${pageInfo.nextPage>0?pageInfo.nextPage:pageInfo.navigateLastPage}">下一页</a></td>
                    <td><a href="${pageContext.request.contextPath}/date/borrowReturn?page=${pageInfo.navigateLastPage}">最后一页</a></td>
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