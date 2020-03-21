<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>编辑读者信息《 ${update.readerId}》</title>
</head>
<body>
	<div class="col-xs-6 col-md-offset-3" style="position: relative;margin-top: 7%">
	    <div class="panel panel-primary">
	        <div class="panel-heading">
	            <h3 class="panel-title">编辑读者信息《 ${update.readerId}》</h3>
	        </div>
	        <div class="panel-body">
	            <form action="${pageContext.request.contextPath}/reader/doUpdateReader" method="post" id="updateReader" >
					<div class="input-group">
	                    <span  class="input-group-addon">读者ID</span>
	                    <input readonly="readonly" type="text" class="form-control" name="readerId" id="readerId" value="${update.readerId}">
	                </div>
	                <div class="input-group">
	                    <span class="input-group-addon">姓名</span>
	                    <input type="text" class="form-control" name="name" id="name" value="${update.name}" >
	                </div>
	                <div class="input-group">
	                    <span  class="input-group-addon">性别</span>
	                    <input type="text" class="form-control" name="sex" id="sex"  value="${update.sex}" >
	                </div>
	                <div class="input-group">
	                    <span class="input-group-addon">年龄</span>
	                    <input type="text" class="form-control" name="age" id="age"  value="${update.age}" >
	                </div>
	                <div class="input-group">
	                    <span  class="input-group-addon">地址</span>
	                    <input type="text" class="form-control" name="address" id="address"  value="${update.address}" >
	                </div>
	                <div class="input-group">
	                    <span class="input-group-addon">电话</span>
	                    <input type="text" class="form-control" name="telephone" id="telephone" value="${update.telephone}" >
	                </div>
	                <input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left">
	                <script>
	                    function mySubmit(flag){
	                        return flag;
	                    }
	                    $("#updateReader").submit(function () {
	                    	if($("readerId").val()==''||$("#name").val()==''||$("#sex").val()==''||$("#age").val()==''||$("address").val()==''||$("telephone").val()==''){
	                            alert("请填入完整读者信息！");
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
