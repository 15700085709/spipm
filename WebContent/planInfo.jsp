<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/style/public/title_setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>工作计划</title>
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


				<div class="modal fade" id="addPlan" tabindex="-1" role="dialog" 
				   aria-labelledby="myModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" 
				               data-dismiss="modal" aria-hidden="true">
				                  &times;
				            </button>
				            <h4 class="modal-title" id="myModalLabel">
				               	添加计划
				            </h4>
				         </div>
				         <form  action="${ctx}/plan/planAdd" method="post" >
				         <div class="modal-body">
				         	<table class="table table-borderless table-data">
							<tr>
      							<th>项目</th>
      							<td><select name="planProject" id="planProject" class="add"></select></td>
							</tr>
				         	<tr>
      							<th>计划描述</th>
      							<td><input type="text" name="planDescription" id="planDescription" class="add"></td>
							</tr>
							<tr>
								<th>开始时间</th>
								<td><input class="Wdate plan add" type="text" name="planStartTime" id="planStartTime" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/></td>
							</tr>
							<tr>
								<th>结束时间</th>
								<td><input class="Wdate plan add" type="text" name="planEndTime" id="planEndTime" onFocus="WdatePicker()"/></td>
							</tr>
							<tr>
								<th>计划内容</th>
								<td><textarea class="form-control add" rows="4" name="planContent" id="planContent" ></textarea> </td>
							</tr>
							<tr>
      							<th>抄送给</th>
      							<td><select name="planReceiver" id="planReceiver" class="add"></select></td>
							</tr>
							</table>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="submit" class="btn btn-primary" name="add" value="添加" id="planAdd" disabled="true"/>
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
	
			<c:forEach items="${requestScope.planList}" var="u" varStatus="">
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
				               	计划详细信息
				            </h4>
				         </div>
				         <form  method="post" class="updateForm" id="${u.id }${'updateForm' }" >
				         <div class="modal-body">
				         	<table class="table table-borderless table-data">
				  				 <input type="hidden" name="id" value="${u.id }">
				  			<tr>
      							<th>项目</th>
      							<td><select name="planProject" class="update" id="${'planProject' }${u.id }">
      								<option value="${u.planProject }" selected>${u.planProject }</option>
      							</select></td>
							</tr>
				         	<tr>
      							<th>计划描述</th>
      							<td><input type="text" name="planDescription" class="update" value="${u.planDescription }"></td>
							</tr>

							<tr>
								<th>开始时间</th>
								<td><input class="Wdate plan update" type="text" name="planStartTime" id="${'planStartTime'}${u.id}" onFocus="WdatePicker({isShowClear:false,readOnly:true})" value="${u.planStartTime }"/></td>
							</tr>
							<tr>
								<th>结束时间</th>
								<td><input class="Wdate plan update" type="text" name="planEndTime" id="${'planEndTime'}${u.id}" onFocus="WdatePicker({isShowClear:false,readOnly:true})" value="${u.planEndTime }"/></td>
							</tr>
							<tr>
								<th>计划内容</th>
								<td><textarea class="form-control update" rows="4" name="planContent" >${u.planContent }</textarea> </td>
							</tr>
							<tr>
      							<th>抄送给</th>
      							<td><select name="planReceiver" class="update" id="${'planReceiver' }${u.id }">
      								<option value="${u.planReceiver }" selected>${u.planReceiver }</option>
      							</select></td>
							</tr>
							</table>
							
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="submit" class="btn btn-primary planUpdate" name="update" disabled="true" value="提交更改" onClick="planUpdate1(this.form);" />
				            <input type="button" class="btn btn-primary" name="delete" value="删除" onClick="planDelete(this.form);" />
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
			</c:forEach>
	<form id="deleteCheck" name="deleteCheck" action="${ctx}/plan/planDeleteCheck" method="post">
		<table  class="table table-borderless table-data">
			<tr>
				<th><input type="checkbox" onclick="checkAll(this)">全选</th>
				<th><input type="button" value ="项目" onclick="planOrder('planProject')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="计划描述" onclick="planOrder('planDescription')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="开始时间" onclick="planOrder('planStartTime')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="结束时间" onclick="planOrder('planEndTime')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="计划内容" onclick="planOrder('planContent')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="被抄送人" onclick="planOrder('planReceiver')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="计划状态" onclick="planOrder('planState')" class="btn" style="width:100%"/></th>				
				
				<c:if test="${userSession.type=='admin'||userSession.type=='pm'}">
				<th>操作</th>
				</c:if>
			</tr>
			<c:forEach items="${requestScope.planList}" var="u" varStatus="">
				<tr  id="${u.id }${'tr' }">
					<td><input type="checkbox" name="planCheck" value="${u.id }" /></td>
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
		<div>
		<table>
			<tr>
            <td align="center" bgcolor="#5BA8DE">共${planPage.totalCount}条记录 共${planPage.totalPages}页 当前第${planPage.pageNo}页<br>
                
                <input type="button" name="fristPage" value="首页" onClick="window.location.href='${ctx}/plan/planList?pageNo=1'"/>
                <c:choose>
                  <c:when test="${planPage.pageNo!=1}">
                    
                      <input type="button" name="previousPage" value="上一页" onClick="window.location.href='${ctx}/plan/planList?pageNo=${planPage.prePage }'"/>
                    
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="previousPage" value="上一页" />
                    
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${planPage.pageNo != planPage.totalPages}">
                    <input type="button" name="nextPage" value="下一页" onClick="window.location.href='${ctx}/plan/planList?pageNo=${planPage.nextPage }'"/>
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="nextPage" value="下一页" />
                    
                  </c:otherwise>
                </c:choose>
                <input type="button" name="lastPage" value="尾页" onClick="window.location.href='${ctx}/plan/planList?pageNo=${planPage.totalPages }'"/>
            </td>
				<td>
				<c:if test="${userSession.type=='admin'||userSession.type=='pm'}">
					<input type="button" class="btn btn-primary loadUserlist dpl" data-toggle="modal" data-target="#addPlan" title="添加" value="添加">
					<input type="button" class="btn btn-primary"  title="删除" value="删除" disabled="true" id="deleteChecked" onclick="deleteConfirm()">
				</c:if>
				</td>
			</tr>
			</table>
			</div>
		
		</form>



	
</body>
</html>