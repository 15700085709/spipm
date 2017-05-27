<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/style/public/title_setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>用户信息</title>
   <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
   <link href="${ctx}/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
   <link href="${ctx}/css/custom.css" rel="stylesheet" type="text/css">
   <script src="${ctx}/js/jquery-3.1.1.min.js"></script>
   <script src="${ctx}/js/bootstrap.min.js"></script>
   <script language="javascript" type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
   <script type="text/javascript" src="${ctx}/js/userJs.js">
   
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
					${userSession.userId} <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#">个人信息</a></li>
					<li class="divider"></li>
					<li><a href="#">修改密码</a></li>
					<li class="divider"></li>
					<li><a href="${ctx}/user/logout">退出</a></li>
				</ul>
			</li>
			
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					信息管理 <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="${ctx}/user/userList?pageNo=1">客户管理</a></li>
					<li><a href="${ctx}/team/teamList?pageNo=1">团队管理</a></li>
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
					<li><a href="${ctx}/dpl/dplList?pageNo=1">部署软件版本管理</a></li>
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
      							<td><input type="text" name="userId" id="userId" class="add"></td>
							</tr>
							<tr>
      							<th>职工姓名</th>
      							<td><input type="text" name="userName" id="userName" class="add"></td>
							</tr>
							<tr>
      							<th>密码</th>
      							<td><input type="password" name="password" id="password" class="add"></td>
							</tr>
							<tr>
								<th>用户类型</th>
      							<td><select name="type" id="type" class="add">
									  <option value ="dev" >开发</option>
									  <option value ="sqa" >测试</option>
									  <option value="pm" >项目经理</option>
									  <option value="customer" >客户</option>
									</select></td>
							</tr>
							<tr>
								<th>手机号码</th>
								<td><input type="text" name="phone" id="phone" class="add"></td>
							</tr>
							<tr>
								<th>电子邮箱</th>
								<td><input type="text" name="email" id="email" class="add"></td>
							</tr>
							</table>
							
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="submit" class="btn btn-primary" name="add" value="添加" id="userAdd" disabled="true"/>
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
	
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
				         <form  method="post" class="updateForm" id="${u.id }${'updateForm' }" >
				         <div class="modal-body">
				         	<table class="table table-borderless table-data">
				  				 <input type="hidden" name="id" value="${u.id }">
				         	<tr>
      							<th>职工ID</th>
      							<td><input type="text" name="userId" class="update" value="${u.userId }"></td>
							</tr>
							<tr>
      							<th>职工姓名</th>
      							<td><input type="text" name="userName" class="update" value="${u.userName }"></td>
							</tr>
							<tr>
      							<th>密码</th>
      							<td><input type="password" name="password" class="update" value="${u.password }"></td>
							</tr>
							<tr>
								<th>用户类型</th>
      							<td><select name="type" class="update">
									  <option value ="dev" ${u.type=="dev"?'selected':''}>开发</option>
									  <option value ="sqa" ${u.type=="sqa"?'selected':''}>测试</option>
									  <option value="pm" ${u.type=="pm"?'selected':''}>项目经理</option>
									  <option value="customer" ${u.type=="customer"?'selected':''}>客户</option>
									</select></td>
							</tr>
							<tr>
								<th>手机号码</th>
								<td><input type="text" name="phone"  class="update" value="${u.phone }"></td>
							</tr>
							<tr>
								<th>电子邮箱</th>
								<td><input type="text" name="email" class="update" value="${u.email }"></td>
							</tr>
							</table>
							
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="submit" class="btn btn-primary userUpdate" name="update" disabled="true" value="提交更改" onClick="userUpdate(this.form);" />
				            <input type="button" class="btn btn-primary" name="delete" value="删除" onClick="userDelete(this.form);" />
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
			</c:forEach>
	<form id="deleteCheck" name="deleteCheck" action="${ctx}/user/userDeleteCheck" method="post">
		<table  class="table table-borderless table-data">
			<tr>
				<th><input type="checkbox" onclick="checkAll(this)">全选</th>
				<th><input type="button" value ="职工ID" onclick="userOrder('userId')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="职工姓名" onclick="userOrder('userName')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="职工岗位" onclick="userOrder('type')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="手机号码" onclick="userOrder('phone')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="电子邮箱" onclick="userOrder('email')" class="btn" style="width:100%"/></th>
				<th>操作</th>
			</tr>
			<c:forEach items="${requestScope.userList}" var="u" varStatus="">
				<tr  id="${u.id }${'tr' }">
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
		<div>
		<table>
			<tr>
            <td align="center" bgcolor="#5BA8DE">共${userPage.totalCount}条记录 共${userPage.totalPages}页 当前第${userPage.pageNo}页<br>
                
                <input type="button" name="fristPage" value="首页" onClick="window.location.href='${ctx}/user/userList?pageNo=1'"/>
                <c:choose>
                  <c:when test="${userPage.pageNo!=1}">
                    
                      <input type="button" name="previousPage" value="上一页" onClick="window.location.href='${ctx}/user/userList?pageNo=${userPage.prePage }'"/>
                    
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="previousPage" value="上一页" />
                    
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${userPage.pageNo != userPage.totalPages}">
                    <input type="button" name="nextPage" value="下一页" onClick="window.location.href='${ctx}/user/userList?pageNo=${userPage.nextPage }'"/>
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="nextPage" value="下一页" />
                    
                  </c:otherwise>
                </c:choose>
                <input type="button" name="lastPage" value="尾页" onClick="window.location.href='${ctx}/user/userList?pageNo=${userPage.totalPages }'"/>
            </td>
				<td>
					<input type="button" class="btn btn-primary" data-toggle="modal" data-target="#addUser" title="添加" value="添加">
					<input type="button" class="btn btn-primary"  title="删除" value="删除" disabled="true" id="deleteChecked" onclick="deleteConfirm()">
				</td>
			</tr>
			</table>
			</div>
		
		</form>



	
</body>
</html>