<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div class="col-md-12"><h1><em>SSM_CRUD</em></h1></div>
		</div>
	<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-11">
				<button class="btn btn-success btn-sm">添加</button>
				<button class="btn btn-danger btn-sm">删除</button>
			</div>
		</div>
	<!-- 表格 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</th>
					</tr>
					
					<c:forEach items="${pageInfo.list }" var="emp">
					<tr>
						<td>${emp.empId }</td>
						<td>${emp.empName }</td>
						<td>${emp.gender=="M"?"男":"女" }</td>
						<td>${emp.email }</td>
						<td>${emp.tblDept.deptName }</td>
						<td>
							<button class="btn btn-success btn-sm">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								编辑
							</button>
							<button class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								删除
							</button>
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	<!-- 分页信息 -->
		<div class="row">
			<div class="col-md-6">
				当前页数：${pageInfo.pageNum},总页数：${pageInfo.pages},总条数：${pageInfo.total}
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  
				    <li><a href="${APP_PATH}/emps?current=1">首页</a></li>
				    <li>
				    <c:if test="${pageInfo.hasPreviousPage}">
				      <a href="${APP_PATH}/emps?current=${pageInfo.pageNum-1 }" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				     </c:if>
				    </li>
				    <c:forEach items="${pageInfo.navigatepageNums }" var="page_num">
				  	<c:if test="${page_num==pageInfo.pageNum}">
				  		 <li class="active"><a href="#">${pageInfo.pageNum }</a></li>
				  	</c:if>
				  	<c:if test="${page_num!=pageInfo.pageNum}">
				  		 <li><a href="${APP_PATH}/emps?current=${page_num}">${page_num}</a></li>
				  	</c:if>
				  </c:forEach>
				    <li>
				      <c:if test="${pageInfo.hasNextPage }">
				      	<a href="${APP_PATH}/emps?current=${pageInfo.pageNum+1}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      	</a>
				      </c:if>
				    </li>
				     <li><a href="${APP_PATH}/emps?current=${pageInfo.pages}">尾页</a></li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>