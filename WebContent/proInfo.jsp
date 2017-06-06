<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/style/public/title_setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>项目信息</title>
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
		<a class="navbar-brand" href="#">软件项目实施过程管理系统</a>
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
					<li><a href="${ctx}/project/projectList?pageNo=1">项目管理</a></li>
					<li><a href="${ctx}/report/reportList?pageNo=1">日报管理</a></li>
				</ul>
			</li>
			

			<li><a href="${ctx}/dpl/dplList?pageNo=1">软件部署和版本管理</a></li>
			
			
			<li><a href="${ctx}/plan/planList?pageNo=1">工作计划</a></li>
			<li><a href="${ctx}/feedback/feedbackList?pageNo=1">用户反馈</a></li>
			<li><a href="${ctx}/evaluation/evaluationList?pageNo=1">成果评价</a></li>
			
			
		</ul>
	</div>
	</div>
</nav>


				<div class="modal fade" id="addProject" tabindex="-1" role="dialog" 
				   aria-labelledby="myModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" 
				               data-dismiss="modal" aria-hidden="true">
				                  &times;
				            </button>
				            <h4 class="modal-title" id="myModalLabel">
				               	添加项目
				            </h4>
				         </div>
				         <form  action="${ctx}/project/projectAdd" method="post" >
				         <div class="modal-body">
				         	<table class="table table-borderless table-data">
				         	<tr>
      							<th>项目代码</th>
      							<td><input type="text" name="proCode" id="proCode" class="add"></td>
							</tr>
							<tr>
      							<th>项目名称</th>
      							<td><input type="text" name="proName" id="proName" class="add"></td>
							</tr>
							<tr>
      							<th>项目负责人</th>
      							<td><select name="manager" id="manager" class="add"></select></td>
							</tr>

							<tr>
								<th>项目开始时间</th>
								<td><input class="Wdate pro add" type="text" name="proStartTime" id="proStartTime" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/></td>
							</tr>
							<tr>
								<th>项目结束时间</th>
								<td><input class="Wdate pro add" type="text" name="proEndTime" id="proEndTime" onFocus="WdatePicker()"/></td>
							</tr>
							<tr>
								<th>项目描述</th>
								<td><textarea class="form-control add" rows="4" name="proDescription" id="proDescription" ></textarea> </td>
							</tr>
							</table>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="submit" class="btn btn-primary" name="add" value="添加" id="projectAdd" disabled="true"/>
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
	
			<c:forEach items="${requestScope.projectList}" var="u" varStatus="">
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
      							<th>项目代码</th>
      							<td><input type="text" name="proCode" class="update" value="${u.proCode }"></td>
							</tr>
							<tr>
      							<th>项目名称</th>
      							<td><input type="text" name="proName" class="update" value="${u.proName }"></td>
							</tr>
							<tr>
      							<th>项目负责人</th>
      							<td><select name="manager" class="update" id="${'manager' }${u.id }">
      								<option value="${u.manager }" selected>${u.manager }</option>
      							</select></td>
							</tr>

							<tr>
								<th>项目开始时间</th>
								<td><input class="Wdate pro update" type="text" name="proStartTime" id="${'proStartTime'}${u.id}" onFocus="WdatePicker({isShowClear:false,readOnly:true})" value="${u.proStartTime }"/></td>
							</tr>
							<tr>
								<th>项目结束时间</th>
								<td><input class="Wdate pro update" type="text" name="proEndTime" id="${'proEndTime'}${u.id}" onFocus="WdatePicker({isShowClear:false,readOnly:true})" value="${u.proEndTime }"/></td>
							</tr>
							<tr>
								<th>项目描述</th>
								<td><textarea class="form-control update" rows="4" name="proDescription" >${u.proDescription }</textarea> </td>
							</tr>
							</table>
							
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="submit" class="btn btn-primary projectUpdate" name="update" disabled="true" value="提交更改" onClick="projectUpdate1(this.form);" />
				            <input type="button" class="btn btn-primary" name="delete" value="删除" onClick="projectDelete(this.form);" />
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
			</c:forEach>
	<form id="deleteCheck" name="deleteCheck" action="${ctx}/project/projectDeleteCheck" method="post">
		<table  class="table table-borderless table-data">
			<tr>
				<th><input type="checkbox" onclick="checkAll(this)">全选</th>
				<th><input type="button" value ="项目代码" onclick="projectOrder('proCode')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="项目名称" onclick="projectOrder('proName')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="项目负责人" onclick="projectOrder('manager')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="项目进度" onclick="projectOrder('process')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="项目开始时间" onclick="projectOrder('proStartTime')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="项目结束时间" onclick="projectOrder('proEndTime')" class="btn" style="width:100%"/></th>
				<th>操作</th>
			</tr>
			<c:forEach items="${requestScope.projectList}" var="u" varStatus="">
				<tr  id="${u.id }${'tr' }">
					<td><input type="checkbox" name="projectCheck" value="${u.id }" /></td>
					<td>${u.proCode }</td>
					<td>${u.proName }</td>
					<td>${u.manager }</td>
					<td>${u.process }</td>
					<td>${u.proStartTime }</td>
					<td>${u.proEndTime }</td>
					<td><input type="button" id="${'编辑'}${u.id }" class="btn btn-primary loadUserlist" data-toggle="modal" data-target="#${u.id }" title="编辑" value="编辑"></td>
				</tr>
			</c:forEach>


		</table>
		<div>
		<table>
			<tr>
            <td align="center" bgcolor="#5BA8DE">共${projectPage.totalCount}条记录 共${projectPage.totalPages}页 当前第${projectPage.pageNo}页<br>
                
                <input type="button" name="fristPage" value="首页" onClick="window.location.href='${ctx}/project/projectList?pageNo=1'"/>
                <c:choose>
                  <c:when test="${projectPage.pageNo!=1}">
                    
                      <input type="button" name="previousPage" value="上一页" onClick="window.location.href='${ctx}/project/projectList?pageNo=${projectPage.prePage }'"/>
                    
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="previousPage" value="上一页" />
                    
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${projectPage.pageNo != projectPage.totalPages}">
                    <input type="button" name="nextPage" value="下一页" onClick="window.location.href='${ctx}/project/projectList?pageNo=${projectPage.nextPage }'"/>
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="nextPage" value="下一页" />
                    
                  </c:otherwise>
                </c:choose>
                <input type="button" name="lastPage" value="尾页" onClick="window.location.href='${ctx}/project/projectList?pageNo=${projectPage.totalPages }'"/>
            </td>
				<td>
					<input type="button" class="btn btn-primary loadUserlist" data-toggle="modal" data-target="#addProject" title="添加" value="添加">
					<input type="button" class="btn btn-primary"  title="删除" value="删除" disabled="true" id="deleteChecked" onclick="deleteConfirm()">
				</td>
			</tr>
			</table>
			</div>
		
		</form>



	
</body>
</html>