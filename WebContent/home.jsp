<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/style/public/title_setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>home</title>
   <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
   <link href="${ctx}/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
   <link href="${ctx}/css/custom.css" rel="stylesheet" type="text/css">
   <script src="${ctx}/js/jquery-3.1.1.min.js"></script>
   <script src="${ctx}/js/bootstrap.min.js"></script>
   <script language="javascript" type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
   <script type="text/javascript">
   $(document).ready(function(){
	    dropdownOpen();//调用
	});
	/**
	 * 鼠标划过就展开子菜单，免得需要点击才能展开
	 */
	function dropdownOpen() {
	 
	    var $dropdownLi = $('li.dropdown');
	 
	    $dropdownLi.mouseover(function() {
	        $(this).addClass('open');
	    }).mouseout(function() {
	        $(this).removeClass('open');
	    });
	}
	function userUpdate(form){
		if (confirm("确定要更新此记录吗？")){
			form.action = "${ctx}/user/userUpdate";
			form.submit();
		}
	}
	function userDelete(form){
		if (confirm("确定要删除此记录吗？")){
			form.action = "${ctx}/user/userDelete";
			form.submit();
		}
	}
	function test(orderBy){
		window.location.href="${ctx}/user/userOrder?orderBy="+orderBy;
	}
	function checkAll(allcheck){
		if(allcheck.checked){
			$('input[type=checkbox]').each(function() {
		        $(this).prop('checked', true);
			});
		}
		else{
			$('input[type=checkbox]').each(function() {
		        $(this).prop('checked', false);
			});
		}
	
	}
	
	setInterval(function(){
		var ischecked = false;
		$("input[type=checkbox]:checked").each(function(){ //由于复选框一般选中的是多个,所以可以循环输出 
			ischecked = true;
			}); 

        	$("#deleteChecked").attr('disabled',!ischecked);
        
    },200);
   </script>
</head>
<body>
<input class="Wdate" type="text" id="d15" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid"> 
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
			<span class="sr-only">切换导航</span>
			<span class="icon-bar">1</span>
			<span class="icon-bar">2</span>
			<span class="icon-bar">3</span>
		</button>
		<a class="navbar-brand" href="#">软件项目实施过程管理</a>
	</div>
	<div class="collapse navbar-collapse" id="example-navbar-collapse">
		<ul class="nav navbar-nav">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					a616710 <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#">个人信息</a></li>
					<li class="divider"></li>
					<li><a href="#">修改密码</a></li>
					<li class="divider"></li>
					<li><a href="#">退出</a></li>
				</ul>
			</li>
			
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					信息管理 <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#">客户管理</a></li>
					<li><a href="${ctx}/user/userList">团队管理</a></li>
					<li class="divider"></li>
					<li><a href="#">项目管理</a></li>
					<li><a href="#">日报管理</a></li>
				</ul>
			</li>
			
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					软件版本管理 <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#">部署软件版本管理</a></li>
					<li class="divider"></li>
					<li><a href="#">软件安装部署的申请与审批</a></li>
				</ul>
			</li>
			
			<li><a href="#">工作计划</a></li>
			<li><a href="#">用户反馈</a></li>
			<li><a href="#">成果评价</a></li>
			
			
		</ul>
	</div>
	</div>
</nav>


				<div class="modal fade" id="addUser" tabindex="-1" role="dialog" 
				   aria-labelledby="myModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" 
				               data-dismiss="modal" aria-hidden="true">
				                  &times;
				            </button>
				            <h4 class="modal-title" id="myModalLabel">
				               	添加用户
				            </h4>
				         </div>
				         <form  action="${ctx}/user/userAdd" method="post" >
				         <div class="modal-body">
				         	<table class="table table-borderless table-data">
				         	<tr>
      							<th>职工ID</th>
      							<td><input type="text" name="userId"></td>
							</tr>
							<tr>
      							<th>职工姓名</th>
      							<td><input type="text" name="userName"></td>
							</tr>
							<tr>
      							<th>密码</th>
      							<td><input type="password" name="password"></td>
							</tr>
							<tr>
								<th>用户类型</th>
      							<td><select name="type">
									  <option value ="dev" >开发</option>
									  <option value ="sqa" >测试</option>
									  <option value="pm" >项目经理</option>
									  <option value="customer" >客户</option>
									</select></td>
							</tr>
							<tr>
								<th>手机号码</th>
								<td><input type="text" name="phone"></td>
							</tr>
							<tr>
								<th>电子邮箱</th>
								<td><input type="text" name="email"></td>
							</tr>
							</table>
							
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="submit" class="btn btn-primary" name="add" value="添加"/>
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
	<c:if test="${!empty requestScope.userList }">
	
			<c:forEach items="${requestScope.userList}" var="u" varStatus="">
				<div class="modal fade" id="${u.id }" tabindex="-1" role="dialog" 
				   aria-labelledby="myModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" 
				               data-dismiss="modal" aria-hidden="true">
				                  &times;
				            </button>
				            <h4 class="modal-title" id="myModalLabel">
				               	用户详细信息
				            </h4>
				         </div>
				         <form  method="post" >
				         <div class="modal-body">
				         	<table class="table table-borderless table-data">
				  				 <input type="hidden" name="id" value="${u.id }">
				         	<tr>
      							<th>职工ID</th>
      							<td><input type="text" name="userId" class="userId" value="${u.userId }"></td>
							</tr>
							<tr>
      							<th>职工姓名</th>
      							<td><input type="text" name="userName" class="userName" value="${u.userName }"></td>
							</tr>
							<tr>
      							<th>密码</th>
      							<td><input type="password" name="password" class="password" value="${u.password }"></td>
							</tr>
							<tr>
								<th>用户类型</th>
      							<td><select name="type">
									  <option value ="dev" ${u.type=="dev"?'selected':''}>开发</option>
									  <option value ="sqa" ${u.type=="sqa"?'selected':''}>测试</option>
									  <option value="pm" ${u.type=="pm"?'selected':''}>项目经理</option>
									  <option value="customer" ${u.type=="customer"?'selected':''}>客户</option>
									</select></td>
							</tr>
							<tr>
								<th>手机号码</th>
								<td><input type="text" name="phone"  value="${u.phone }"></td>
							</tr>
							<tr>
								<th>电子邮箱</th>
								<td><input type="text" name="email" value="${u.email }"></td>
							</tr>
							</table>
							
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="submit" class="btn btn-primary" name="update" value="提交更改" onClick="userUpdate(this.form);" />
				            <input type="submit" class="btn btn-primary" name="delete" value="删除" onClick="userDelete(this.form);" />
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
			</c:forEach>
	<form name="deleteCheck" action="${ctx}/user/userDeleteCheck" method="post">
		<table  class="table table-borderless table-data">
			<tr>
				<th><input type="checkbox" onclick="checkAll(this)">全选</th>
				<th><input type="button" value ="职工ID" onclick="test('userId')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="职工姓名" onclick="test('userName')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="职工岗位" onclick="test('type')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="手机号码" onclick="test('phone')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="电子邮箱" onclick="test('email')" class="btn" style="width:100%"/></th>
				<th>操作</th>
			</tr>
			<c:forEach items="${requestScope.userList}" var="u" varStatus="">
				<tr class="active">
					<td><input type="checkbox" name="userCheck" value="${u.id }" /></td>
					<td>${u.userId }</td>
					<td>${u.userName }</td>
					<td>${u.type }</td>
					<td>${u.phone }</td>
					<td>${u.email }</td>
					<td><input type="button" class="btn btn-primary" data-toggle="modal" data-target="#${u.id }" title="编辑" value="编辑"></td>
				</tr>
			</c:forEach>


		</table>
						<input type="button" class="btn btn-primary" data-toggle="modal" data-target="#addUser" title="添加" value="添加">
		<input type="submit" class="btn btn-primary"  title="删除" value="删除" disabled="true" id="deleteChecked">
	</form>

	</c:if>
</body>
</html>