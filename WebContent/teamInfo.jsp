<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/style/public/title_setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>团队信息</title>
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
					<li><a href="${ctx}/home/homeInfo?userId=${userSession.userId}">个人信息</a></li>
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


				<div class="modal fade" id="addTeam" tabindex="-1" role="dialog" 
				   aria-labelledby="myModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" 
				               data-dismiss="modal" aria-hidden="true">
				                  &times;
				            </button>
				            <h4 class="modal-title" id="myModalLabel">
				               	添加团队
				            </h4>
				         </div>
				         <form  action="${ctx}/team/teamAdd" method="post" >
				         <div class="modal-body"  style="width:300px;float:left;">
				         	<table class="table table-borderless table-data">
				         	<tr>
      							<th>团队代号</th>
      							<td><input type="text" name="teamCode" id="teamCode" class="add"></td>
							</tr>
							<tr>
      							<th>团队名称</th>
      							<td><input type="text" name="teamName" id="teamName" class="add"></td>
							</tr>
							<tr>
								<th>团队组长</th>
      							<td><select name="teamLeader" id="teamLeader1" class="add"></select></td>
							</tr>

							<tr>
								<th>团队项目</th>
      							<td><select name="teamWork" id="teamWork" class="add"></select></td>
							</tr>
							</table>
							
				         </div>
				         <div style="height:300px;position:right;">
							选择团队成员<br>
							<select id="teamNumber2" multiple="multiple" style="height:200px;width:100px;"></select>
							 <div style="width:196px;float:right;">
								 <div style="width:50px;float:left;">
									<br><br>
									<input type="button" id="deleteTeamNumber"value="<---" class="btn btn-primary addNumber" title="移除"><br><br><br>
									<input type="button" id="addTeamNumber"value="--->" class="btn btn-primary addNumber" title="添加">
								</div>
							团队成员<br>
							<select id="teamNumber3" multiple="multiple" style="height:200px;width:100px;" name="teamNumber">
							</select>
							</div>
						</div>
						
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="submit" class="btn btn-primary" name="add" value="添加" id="teamAdd" disabled="true"/>
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
	
			<c:forEach items="${requestScope.teamList}" var="t" varStatus="">
				<div class="modal fade" id="${t.id }" tabindex="-1" role="dialog" 
				   aria-labelledby="myModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" 
				               data-dismiss="modal" aria-hidden="true">
				                  &times;
				            </button>
				            <h4 class="modal-title" id="myModalLabel">
				               	团队详细信息
				            </h4>
				         </div>
				         <form  method="post" class="updateForm" id="${t.id }${'updateForm' }" >
				         <div class="modal-body" style="width:300px;float:left;">
				         	<table class="table table-borderless table-data">
				  				 <input type="hidden" name="id" value="${t.id }">
				         	<tr>
      							<th>团队代号</th>
      							<td><input type="text" name="teamCode"  class="update" value="${t.teamCode }"></td>
							</tr>
							<tr>
      							<th>团队名称</th>
      							<td><input type="text" name="teamName"  class="update" value="${t.teamName }"></td>
							</tr>
							<tr>
								<th>团队组长</th>
      							<td><select name="teamLeader"  class="update" id="${'teamLeader'}${t.id }">
									  <option value="${t.teamLeader }">${t.teamLeader }</option>
									</select></td>
							</tr>
							<tr>
								<th>团队项目</th>
      							<td><select name="teamWork" class="update" id="${'teamWork' }${t.id }">
      								<option value="${t.teamWork }" selected>${t.teamWork }</option>
      							</select></td>
							</tr>
							</table>
							
				         </div>
				         
				         <div style="height:300px;position:right;">
							选择团队成员<br>
							<select id="${'teamNumber2'}${t.id }" multiple="multiple" style="height:200px;width:100px;"></select>
							 <div style="width:196px;float:right;">
								 <div style="width:50px;float:left;">
									<br><br>
									<input type="button" id="${'deleteTeamNumber'}${t.id }"value="<---" class="btn btn-primary update" title="移除"><br><br><br>
									<input type="button" id="${'addTeamNumber'}${t.id }"value="--->" class="btn btn-primary update" title="添加">
								</div>
							团队成员<br>
							<select id="${'teamNumber3'}${t.id }" multiple="multiple" style="height:200px;width:100px;" name="teamNumber">
							 <c:set var="teamNumber" value="${t.teamNumber}"></c:set>
							<% 
								if(pageContext.getAttribute("teamNumber")!=null){
									String teamNumber = (String) pageContext.getAttribute("teamNumber");
									String teamNumbers[] = teamNumber.split(",");
									for(String tn:teamNumbers){
							%>
								<option value="<%= tn %>"><%= tn %></option>
							<%}} %>
							</select>
							</div>
						</div>
				         
				         
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="button" class="btn btn-primary teamUpdate" name="update" id="teamUpdate" disabled="true" value="提交更改" onClick="teamUpdate1('${t.id }');" />
				            <input type="button" class="btn btn-primary" name="delete" value="删除" onClick="teamDelete1(this.form);" />
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
			</c:forEach>
	<form id="deleteCheck" name="deleteCheck" action="${ctx}/team/teamDeleteCheck" method="post">
		<table  class="table table-borderless table-data">
			<tr>
				<th><input type="checkbox" onclick="checkAll(this)">全选</th>
				<th><input type="button" value ="团队代号" onclick="teamOrder('teamCode')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="团队名称" onclick="teamOrder('teamName')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="团队组长" onclick="teamOrder('teamLeader')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="团队成员" onclick="teamOrder('teamNumber')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="团队项目" onclick="teamOrder('teamWork')" class="btn" style="width:100%"/></th>
				<c:if test="${userSession.type=='admin'||userSession.type=='pm'}">
				<th>操作</th>
			</c:if>
			</tr>
			<c:forEach items="${requestScope.teamList}" var="t" varStatus="">
				<tr  id="${t.id }${'tr' }">
					<td><input type="checkbox" name="teamCheck" value="${t.id }" /></td>
					<td>${t.teamCode }</td>
					<td>${t.teamName }</td>
					<td>${t.teamLeader }</td>
					<td>${t.teamNumber }</td>
					<td>${t.teamWork }</td>
				<c:if test="${userSession.type=='admin'||userSession.type=='pm'}">
					<td><input type="button" id="${'编辑'}${t.id }" class="btn btn-primary loadUserlist" data-toggle="modal" data-target="#${t.id }" title="编辑" value="编辑"></td>
				</c:if>
				</tr>
			</c:forEach>


		</table>
		<div>
		<table>
			<tr>
            <td align="center" bgcolor="#5BA8DE">共${teamPage.totalCount}条记录 共${teamPage.totalPages}页 当前第${teamPage.pageNo}页<br>
                
                <input type="button" name="fristPage" value="首页" onClick="window.location.href='${ctx}/team/teamList?pageNo=1'"/>
                <c:choose>
                  <c:when test="${teamPage.pageNo!=1}">
                    
                      <input type="button" name="previousPage" value="上一页" onClick="window.location.href='${ctx}/team/teamList?pageNo=${teamPage.prePage }'"/>
                    
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="previousPage" value="上一页" />
                    
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${teamPage.pageNo != teamPage.totalPages}">
                    <input type="button" name="nextPage" value="下一页" onClick="window.location.href='${ctx}/team/teamList?pageNo=${teamPage.nextPage }'"/>
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="nextPage" value="下一页" />
                    
                  </c:otherwise>
                </c:choose>
                <input type="button" name="lastPage" value="尾页" onClick="window.location.href='${ctx}/team/teamList?pageNo=${teamPage.totalPages }'"/>
            </td>
				<td>
				<c:if test="${userSession.type=='admin'||userSession.type=='pm'}">
					<input type="button" class="btn btn-primary loadUserlist dpl" data-toggle="modal" data-target="#addTeam" title="添加" value="添加">
					<input type="button" class="btn btn-primary"  title="删除" value="删除" disabled="true" id="deleteChecked" onclick="deleteConfirm()">
				</c:if>
				</td>
			</tr>
			</table>
			</div>
		
		</form>


	
</body>
</html>