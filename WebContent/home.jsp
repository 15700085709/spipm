<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/style/public/title_setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>个人中心</title>
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
		<a class="navbar-brand" href="#">软件项目实施过程管理系统系统</a>
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


	<c:if test="${!empty requestScope.dplList }">	
	<h1>软件部署</h1>		

		<table  class="table table-borderless table-data">
			<tr>
				<th><input type="button" value ="部署版本号"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="部署项目"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="部署人"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="部署创建时间"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="部署开始时间"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="部署结束时间"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="部署war包"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="部署脚本"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="状态"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="审批人"  class="btn" style="width:100%"/></th>
			</tr>
			<c:forEach items="${requestScope.dplList}" var="t" varStatus="">
				<tr  id="${t.id }${'tr' }">
					<td>${t.dplVersion }</td>
					<td>${t.dplProject }</td>
					<td>${t.dplUser }</td>
					<td>${t.createTime }</td>
					<td>${t.dplStartTime }</td>
					<td>${t.dplEndTime }</td>
					<td><input type="button" class="btn btn-primary"  title="下载war包" value="下载war包" onclick="window.location.href='${ctx}/dpl/dplDownload?suffix=war&id=${t.id }'"></td>
					<td><input type="button" class="btn btn-primary"  title="下载sql包" value="下载sql包" onclick="window.location.href='${ctx}/dpl/dplDownload?suffix=sql&id=${t.id }'"></td>
					<td><select name="dplProject" id="${'dplProject'}${t.id }" class="dplProject">
						<option value="${t.dplState }" class="selectpicker" data-style="btn-danger" selected>${t.dplState }</option>
						<c:if test="${t.dplState=='新建'&&userSession.type=='pm'}">
							<option value="审核">审核</option>
						</c:if>
						<c:if test="${t.dplState=='审核'}">
							<option value="部署中">部署</option>
						</c:if>
						<c:if test="${t.dplState=='部署中'}">
							<option value="完成">完成</option>
							<option value="取消">取消</option>
						</c:if>				
					
					</select></td>
					
					<td>${t.dplApprover }</td>
				</tr>
			</c:forEach>

		</table>
		</c:if>
		
	<c:if test="${!empty requestScope.planList }">	
	<h1>工作计划</h1>		
		<table  class="table table-borderless table-data">
			<tr>
				<th><input type="button" value ="项目"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="计划描述"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="开始时间"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="结束时间"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="计划内容"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="被抄送人"  class="btn" style="width:100%"/></th>
				<th><input type="button" value ="计划状态"  class="btn" style="width:100%"/></th>				
				
				<c:if test="${userSession.type=='admin'||userSession.type=='pm'}">
				<th>操作</th>
				</c:if>
			</tr>
			<c:forEach items="${requestScope.planList}" var="u" varStatus="">
				<tr  id="${u.id }${'tr' }">
					<td>${u.planProject }</td>
					<td>${u.planDescription }</td>
					<td>${u.planStartTime }</td>
					<td>${u.planEndTime }</td>
					<td>${u.planContent }</td>
					<td>${u.planReceiver }</td>
					<td><select name="planState" id="${'planState'}${u.id }" class="planState">
						<option value="${u.planState }" class="selectpicker" data-style="btn-danger" selected>${u.planState }</option>
						<c:if test="${u.planState=='进行中'&&userSession.type=='pm'}">
							<option value="完成">完成</option>
						</c:if>
		
					
					</select></td>
				<c:if test="${userSession.type=='admin'||userSession.type=='pm'}">
					<td><input type="button" id="${'编辑'}${u.id }" class="btn btn-primary loadUserlist" data-toggle="modal" data-target="#${u.id }" title="编辑" value="编辑"></td>
				</c:if>
				</tr>
			</c:forEach>


		</table>
		
</c:if>		


	
</body>
</html>