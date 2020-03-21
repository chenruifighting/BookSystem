<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>增加图书</title>
</head>
<body>
<div class="col-xs-6 col-md-offset-3" style="position: relative;margin-top: 7%">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">增加图书</h3>
        </div>
	        <div class="panel-body">
			<form action="${pageContext.request.contextPath}/book/insert" method="post" id="addBook">
			<div class="form-group">
	            <label for="name">图书名</label>
	            <input type="text" class="form-control" name="name" id="name" placeholder="请输入书名">
	        </div>
	        <div class="form-group">
	            <label for="author">作者</label>
	            <input type="text" class="form-control" name="author" id="author"  placeholder="请输入作者名">
	        </div>
	        <div class="form-group">
	            <label for="publish">出版社</label>
	            <input type="text" class="form-control"  name="publish" id="publish"  placeholder="请输入出版社">
	        </div>
	        <div class="form-group">
	            <label for="introduction">简介</label>
	            <textarea class="form-control" rows="3"  name="introduction" id="introduction" placeholder="请输入简介"></textarea>
	        </div>
	        <div class="form-group">
	            <label for="language">语言</label>
	            <input type="text" class="form-control" name="language" id="language"  placeholder="请输入语言">
	        </div>
	        <div class="form-group">
	            <label for="price">价格</label>
	            <input type="text" class="form-control"  name="price"  id="price" placeholder="请输入价格">
	        </div>
				<input type="submit" value="确认" class="btn btn-success btn-sm" class="text-left">
	        <script>
			     function mySubmit(flag){
			         return flag;
			     }
			     $("#addBook").submit(function () {
			         if($("#name").val()==''||$("#author").val()==''||$("#publish").val()==''||$("#introduction").val()==''||$("#language").val()==''||$("#price").val()==''){
			             alert("请填入完整图书信息！");
			             return mySubmit(false);
			         }
			     })
	 		</script>
			</form>
		</div>
	</div>
</div>
</body>
</html>
