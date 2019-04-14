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


<!-- 添加按钮模态框 -->
<div class="modal fade" id="emp_add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">empName</label>
		    <div class="col-sm-10">
		      <input type="text" name="empName" class="form-control" id="emp_add_empName" placeholder="empName">
		   	   <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">email</label>
		    <div class="col-sm-10">
		      <input type="text" name="email" class="form-control" id="emp_add_email" placeholder="email@xiaochen.com">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label class="col-sm-2 control-label">gender</label>
		    <div class="col-sm-10">
		       <label class="radio-inline">
				  <input type="radio" name="gender" id="emp_add_gender1" value="M" checked="checked"> 男
			  </label>
			  <label class="radio-inline">
				<input type="radio" name="gender" id="emp_add_gender2" value="F"> 女
			  </label>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">deptName</label>
		    <div class="col-sm-3">
		    	<select class="form-control" name="dId" id="emp_add_dept">
		    	</select>
		    </div>
		  </div>
		
		</form>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save_btn">添加</button>
      </div>
    </div>
  </div>
</div>

<!-- 搭建显示页面 -->
	<div class="container">
	<!-- 标题 -->
		<div class="row">
			<div class="col-md-12"><h1><em>SSM_CRUD</em></h1></div>
		</div>
	<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-11">
				<button class="btn btn-success btn-sm" id="emp_add_modal_btn">添加</button>
				<button class="btn btn-danger btn-sm">删除</button>
			</div>
		</div>
	<!-- 表格 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
				<thead>
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>	
				</table>
			</div>
		</div>
	<!-- 分页信息 -->
		<div class="row">
			<div class="col-md-6" id="page_info_area">
				<p></p>
			</div>
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var totalRecord;
		$(function(){
			//去首页
			to_page(1);
		});
		function to_page(current){
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"current="+current,
				type:"get",
				success:function(data){
					//console.log(data);
					//解析并显示员工数据
					 build_emps_table(data);
					//解析并显示分页信息
					build_page_info(data);
					//解析并显示分页条信息
					bulid_page_nav(data);
				}
			});
		}
		function build_emps_table(data){
			$("#emps_table tbody").empty();
			var emps=data.map.pageInfo.list;
			$.each(emps,function(index,item){
				var empIdTd=$("<td></td>").append(item.empId);
				var empNameTd=$("<td></td>").append(item.empName);
				var genderTd=$("<td></td>").append(item.gender=='M'?"男":"女");
				var emailTd=$("<td></td>").append(item.email);
				var deptName=$("<td></td>").append(item.tblDept.deptName);
				var editBtn=$("<button></button>").addClass("btn btn-success btn-sm")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm")
							.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				var butId=$("<td></td>").append(editBtn).append("  ").append(delBtn);
				$("<tr></tr>").append(empIdTd)
				.append(empNameTd)
				.append(genderTd)
				.append(emailTd)
				.append(deptName)
				.append(butId)
				.appendTo("#emps_table tbody");
			});
		}
		 //显示分页信息
		function build_page_info(data){
			$("#page_info_area p").empty();
			$("#page_info_area p").append("当前页数："+data.map.pageInfo.pageNum+",总页数:"+data.map.pageInfo.pages+",总条数："+data.map.pageInfo.total);
			totalRecord=data.map.pageInfo.pages;
		}
		//显示分页条信息
		function bulid_page_nav(data){ 
			$("#page_nav_area").empty();
			var nav=$("<nav></nav>");
			var ul=$("<ul></ul>").addClass("pagination");
			var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
			if(data.map.pageInfo.hasPreviousPage==false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}
			firstPageLi.click(function(){
				to_page(1);
			});
			prePageLi.click(function(){
				to_page(data.map.pageInfo.pageNum-1);
			});
			var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
			var lastPageLi=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
			if(data.map.pageInfo.hasNextPage==false){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}
			nextPageLi.click(function(){
				to_page(data.map.pageInfo.pageNum+1);
			});
			lastPageLi.click(function(){
				to_page(data.map.pageInfo.pages);
			});
			
			ul.append(firstPageLi).append(prePageLi);
			$.each(data.map.pageInfo.navigatepageNums,function(index,item){
				var numLi=$("<li></li>").append($("<a></a>").append(item).attr("href","#"));
				if(data.map.pageInfo.pageNum==item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);
				});
				ul.append(numLi);
			});
			ul.append(nextPageLi).append(lastPageLi);
			nav.append(ul);
			nav.appendTo("#page_nav_area");
		}
		//点击新增按钮弹出模态框
		$("#emp_add_modal_btn").click(function(){
			//点击之前就清空form
			$("#emp_add_modal form")[0].reset();
			//清空添加的class属性和span标签内容
			$("#emp_add_empName").parent().removeClass("has-success has-error");
			$("#emp_add_empName").next("span").text("");
			$("#emp_add_email").parent().removeClass("has-success has-error");
			$("#emp_add_email").next("span").text("");
			//发送ajax请求，查询部门信息，显示在模态框
			getDepts();
			//弹出模态框
			$("#emp_add_modal").modal({
				backdrop:"static"
			});
		});
		//查出所有部门信息
		function getDepts(){
			$.ajax({
				url:"${APP_PATH}/depts",
				type:"get",
				success:function(data){
					//console.log(data);
					//显示部门信息在下拉列表
					$.each(data.map.depts,function(){
						var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
						optionEle.appendTo("#emp_add_dept");
					});
				}
			});
		}
		//添加校验
		function validate_add_form(){
			//拿到需要校验的值；
			var empName=$("#emp_add_empName").val();
			var empEmail=$("#emp_add_email").val();
			var regName=/(^[a-zA-Z][a-zA-Z0-9_]{6,15}$)|(^[\u2E80-\u9FFF]{2,5})/;
			var regEmail=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			//校验empName
			if(!regName.test(empName)){
				show_validate_msg("#emp_add_empName","error","用户名必须是2-5位中文或者6-15位英文或数字的组合");
			/* 	$("#emp_add_empName").parent().addClass("has-error");
				$("#emp_add_empName").next("span").text("用户名可以是2-5位中午或者6-15位英文或数字的组合"); */
				return false;
			}else{
				show_validate_msg("#emp_add_empName","success","");
				/* $("#emp_add_empName").parent().addClass("has-success");
				$("#emp_add_empName").next("span").text(""); */
			} 
			//校验email
			if(!regEmail.test(empEmail)){
				show_validate_msg("#emp_add_email","error","邮箱格式不正确");
				/* $("#emp_add_email").parent().addClass("has-error");
				$("#emp_add_email").next("span").text("邮箱格式不正确"); */
				return false;
			}else{
				show_validate_msg("#emp_add_email","success","");
				/* $("#emp_add_email").parent().addClass("has-success");
				$("#emp_add_email").next("span").text(""); */
			}
			return true;
		}
		//显示校验是否成功
		function show_validate_msg(ele,status,msg){
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error"==status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		//检查用户名是否可用
		$("#emp_add_empName").change(function(){
			var empName=this.value;
			//发送ajax校验
			$.ajax({
				url:"${APP_PATH}/checkuser",
				data:"empName="+empName,
				type:"POST",
				success:function(data){
					if(data.code==100){
						show_validate_msg("#emp_add_empName","success","用户名可用");
						$("#emp_save_btn").attr("ajax_va","success");
					}else if(data.code==200){
						show_validate_msg("#emp_add_empName","error",data.map.va_msg);
						$("#emp_save_btn").attr("ajax_va","error");
					}
				}
			});
		});
		$("#emp_save_btn").click(function(){
			//将模态框填写的表单数据交给服务器
			//如果姓名一样就不进行保存
			if($(this).attr("ajax_va")=="error"){
				return false;
			}
			//发送ajax请求前先进行校验
			if(!validate_add_form()){
				return false;
			}
			//发送ajax请求保存员工
			$.ajax({
				url:"${APP_PATH}/emp",
				type:"POST",
				data:$("#emp_add_modal form").serialize(),
				success:function(data){
					//关闭模态框
					$("#emp_add_modal").modal('hide');
					//来到最后一页
					to_page(totalRecord);
				}
			});
		});
	</script>
</body>
</html>