<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>借阅《 ${books.name}》</title>
</head>
<body>
<div class="col-xs-6 col-md-offset-3" style="position: relative;margin-top: 7%">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">借阅《 ${books.name}》</h3>
        </div>
        <div class="panel-body">
            <form action="${pageContext.request.contextPath}/reader/insert?bookId=${books.id}" method="post" id="borrowBook" >
			 	<div class="form-group">
                    <label for="name">读者ID</label>
                    <input type="text" class="form-control" name="readerId" id="readerId" placeholder="请输入学号">
                </div>
                <div class="form-group">
                    <label for="name">姓名</label>
                    <input type="text" class="form-control" name="name" id="name" placeholder="请输入姓名">
                </div>
                <div class="form-group">
                    <label for="name">性别</label>
                    <input type="text" class="form-control" name="sex" id="sex" placeholder="请输入性别">
                </div>
                <div class="form-group">
                    <label for="name">年龄</label>
                    <input type="text" class="form-control" name="age" id="age" placeholder="请输入年龄">
                </div>
                <div class="form-group">
                    <label for="name">地址</label>
                    <input type="text" class="form-control" name="address" id="address" placeholder="请输入所在地址">
                </div>
                <div class="form-group">
                    <label for="name">电话</label>
                    <input type="text" class="form-control" name="telephone" id="telephone" placeholder="请输入电话号码">
                </div>
                <input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left">
                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#borrowBook").submit(function () {
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
