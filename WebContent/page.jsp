<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/style/public/title_setting.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户信息</title>
   <link href="${ctx}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link href="${ctx}/bootstrapcss/templatemo-style.css" rel="stylesheet"> 
   <script src="${ctx}/scripts/jquery-3.1.1.min.js"></script>
   <script src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
   
	<script type="text/javascript">
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
			$('input:checkbox').each(function() {
		        $(this).attr('checked', true);
			});
		}
		else{
			$('input:checkbox').each(function() {
		        $(this).attr('checked', false);
			});
		}
	
	}

	
	</script>
</head>
<body>
<input type="button" name="show" value="show" onClick="window.location.href='${ctx}/user/userList'" />
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
				<th>全选<input type="checkbox" onclick="checkAll(this)"></th>
				<th><input type="button" value ="职工ID" onclick="test('userId')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="职工姓名" onclick="test('userName')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="职工岗位" onclick="test('type')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="手机号码" onclick="test('phone')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="电子邮箱" onclick="test('email')" class="btn" style="width:100%"/></th>
				<th>操作</th>
			</tr>
			<c:forEach items="${requestScope.userList}" var="u" varStatus="">
				<tr class="active">
					<td><input type="checkbox" name="userCheck" value="${u.id }"></td>
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
		<input type="submit" class="btn btn-primary"  title="删除" value="删除">
	</form>

	</c:if>
	
</body>
</html>