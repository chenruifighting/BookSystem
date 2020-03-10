<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>编辑《 ${update.name}》</title>
</head>
<body>
<div class="col-xs-6 col-md-offset-3" style="position: relative;margin-top: 7%">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">编辑《 ${update.name}》</h3>
        </div>
        <div class="panel-body">
            <form action="${pageContext.request.contextPath}/book/update?id=${update.id}" method="post" id="updateBook" >
				<div class="input-group">
                    <span  class="input-group-addon">书名</span>
                    <input type="text" class="form-control" name="name" id="name" value="${update.name}">
                </div>
                <div class="input-group">
                    <span class="input-group-addon">作者</span>
                    <input type="text" class="form-control" name="author" id="author" value="${update.author}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">出版社</span>
                    <input type="text" class="form-control" name="publish" id="publish"  value="${update.publish}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">简介</span>
                    <input type="text" class="form-control" name="introduction" id="introduction"  value="${update.introduction}" >
                </div>
                <div class="input-group">
                    <span class="input-group-addon">语言</span>
                    <input type="text" class="form-control" name="language" id="language" value="${update.language}" >
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">价格</span>
                    <input type="text" class="form-control" name="price"  id="price" value="${update.price}">
                </div>
                <div class="input-group">
                    <span  class="input-group-addon">状态</span>			
                    <input readonly="readonly" type="text" class="form-control" name="state"  id="state" value="${update.state}">
                </div>
                <input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left">
                <script>
                    function mySubmit(flag){
                        return flag;
                    }
                    $("#updateBook").submit(function () {
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
