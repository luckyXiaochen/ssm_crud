<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<!-- 引入jQuery -->
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
<!-- 引入样式 -->
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 搭建显示页面 -->
	<div class="container">
	<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">SSM_CRUD</div>
		</div>
	<!-- 按钮 -->
		<div class="row"></div>
	<!-- 表格 -->
		<div class="row"></div>
	<!-- 分页信息 -->
		<div class="row"></div>
	</div>
</body>
</html>