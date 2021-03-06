<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/style/public/title_setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>成果评价</title>
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
			<li><a href="${ctx}/feedback/feedbackList?pageNo=1">用户评价</a></li>
			<li><a href="${ctx}/evaluation/evaluationList?pageNo=1">成果评价</a></li>
			
			
		</ul>
	</div>
	</div>
</nav>


				<div class="modal fade" id="addEvaluation" tabindex="-1" role="dialog" 
				   aria-labelledby="myModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" 
				               data-dismiss="modal" aria-hidden="true">
				                  &times;
				            </button>
				            <h4 class="modal-title" id="myModalLabel">
				               	填写评价
				            </h4>
				         </div>
				         <form  action="${ctx}/evaluation/evaluationAdd" method="post" >
				         <div class="modal-body">
				         	<table class="table table-borderless table-data">
							<tr>
      							<th>评价项目</th>
      							<td><select name="evltProject" id="evltProject" class="add"></select></td>
							</tr>
				         	<tr>
      							<th>评价时间</th>
      							<td><input type="text" name="evltTime" id="evltTime" class="add" readonly="true"></td>
							</tr>
							<tr>
								<th>评价人</th>
      							<td><input type="text" name="evltUser" id="evltUser" class="add" value="${userSession.userId}" readonly="true"></td>
							</tr>
							<tr>
								<th>评价内容</th>
								<td><textarea class="form-control add" rows="4" name="evltContent" id="evltContent" ></textarea> </td>
							</tr>
							</table>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="submit" class="btn btn-primary" name="add" value="添加" id="evaluationAdd" disabled="true"/>
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
	
	<form id="deleteCheck" name="deleteCheck" action="${ctx}/evaluation/evaluationDeleteCheck" method="post">
		<table  class="table table-borderless table-data">
			<tr>
				<th><input type="checkbox" onclick="checkAll(this)">全选</th>
				<th><input type="button" value ="评价项目" onclick="evaluationOrder('evltProject')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="评价时间" onclick="evaluationOrder('evltTime')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="评价人" onclick="evaluationOrder('evltUser')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="评价内容" onclick="evaluationOrder('evltContent')" class="btn" style="width:100%"/></th>
			</tr>
			<c:forEach items="${requestScope.evaluationList}" var="u" varStatus="">
				<tr  id="${u.id }${'tr' }">
					<td><input type="checkbox" name="evaluationCheck" value="${u.id }" /></td>
					<td>${u.evltProject }</td>
					<td>${u.evltTime }</td>
					<td>${u.evltUser }</td>
					<td>${u.evltContent }</td>
				</tr>
			</c:forEach>


		</table>
		<div>
		<table>
			<tr>
            <td align="center" bgcolor="#5BA8DE">共${evaluationPage.totalCount}条记录 共${evaluationPage.totalPages}页 当前第${evaluationPage.pageNo}页<br>
                
                <input type="button" name="fristPage" value="首页" onClick="window.location.href='${ctx}/evaluation/evaluationList?pageNo=1'"/>
                <c:choose>
                  <c:when test="${evaluationPage.pageNo!=1}">
                    
                      <input type="button" name="previousPage" value="上一页" onClick="window.location.href='${ctx}/evaluation/evaluationList?pageNo=${evaluationPage.prePage }'"/>
                    
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="previousPage" value="上一页" />
                    
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${evaluationPage.pageNo != evaluationPage.totalPages}">
                    <input type="button" name="nextPage" value="下一页" onClick="window.location.href='${ctx}/evaluation/evaluationList?pageNo=${evaluationPage.nextPage }'"/>
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="nextPage" value="下一页" />
                    
                  </c:otherwise>
                </c:choose>
                <input type="button" name="lastPage" value="尾页" onClick="window.location.href='${ctx}/evaluation/evaluationList?pageNo=${evaluationPage.totalPages }'"/>
            </td>
				<td>
					<input type="button" class="btn btn-primary loadUserlist dpl" data-toggle="modal" data-target="#addEvaluation" title="添加" value="添加"  onclick="setCreateTime()">
				<c:if test="${userSession.type=='admin'||userSession.type=='pm'}">
					<input type="button" class="btn btn-primary"  title="删除" value="删除" disabled="true" id="deleteChecked" onclick="deleteConfirm()" >
				</c:if>
				</td>
			</tr>
			</table>
			</div>
		
		</form>



	
</body>
</html>