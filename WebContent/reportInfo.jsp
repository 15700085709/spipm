<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/style/public/title_setting.jsp" %>
<%@ page import="com.spipm.tiles.account.entity.Report" %>
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


	<div class="modal fade" id="addAppendContent" tabindex="-1" role="dialog" 
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
				         <form  action="${ctx}/report/reportAppendContent" method="post" >
				         <div class="modal-body">
				         	<table class="table table-borderless table-data">
				  			<input type="hidden" name="id" id="appendMid">
				         	<tr>
      							<th>追加时间</th>
      							<td><input type="text" name="appendDate"  id="appendContentM"></td>
							</tr>
							<tr>
      							<th>追加人</th>
      							<td><input type="text" name="appendUser"  value="${userSession.userId}"></td>
							</tr>
				         	<tr>
      							<th>追加内容</th>
      							<td><textarea class="form-control append" rows="4" name="appendContent"  ></textarea></td>
							</tr>
							

							</table>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="submit" class="btn btn-primary" name="add" value="添加" id="appendAdd" disabled="true"/>
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>







				<div class="modal fade" id="addReport" tabindex="-1" role="dialog" 
				   aria-labelledby="myModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" 
				               data-dismiss="modal" aria-hidden="true">
				                  &times;
				            </button>
				            <h4 class="modal-title" id="myModalLabel">
				               	添加日报
				            </h4>
				         </div>
				         <form  action="${ctx}/report/reportAdd" method="post" >
				         <div class="modal-body">
				         	<table class="table table-borderless table-data">
				         	<tr>
      							<th>日报时间</th>
      							<td><input type="text" name="reportDate" id="reportDate" readonly="true"></td>
							</tr>
							<tr>
      							<th>日报人</th>
      							<td><input type="text" name="reportUser" id="reportUser"readonly="true"  value="${userSession.userId}"></td>
							</tr>
							<tr>
      							<th>日报项目</th>
      							<td><select name="reportProject" id="reportProject"></select></td>
							</tr>
							<tr>
								<th>日报内容</th>
								<td><textarea class="form-control add" rows="4" name="reportContent" id="reportContent" ></textarea> </td>
							</tr>
							<tr>
								<th>备注</th>
								<td><textarea class="form-control add" rows="4" name="reportRemark" id="reportRemark" ></textarea> </td>
							</tr>

							</table>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="submit" class="btn btn-primary" name="add" value="添加" id="appendContent" disabled="true"/>
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
	
			<c:forEach items="${requestScope.reportList}" var="u" varStatus="">
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
				               	日报详情
				            </h4>
				         </div>
				         <form  method="post" class="updateForm" id="${u.id }${'updateForm' }" >
				         <div class="modal-body">
				         	<table class="table table-borderless table-data">
				  				 <input type="hidden" name="id" value="${u.id }">
				         	<tr>
      							<th>日报时间</th>
      							<td><input type="text" name="reportDate" class="update" readonly="true" value="${u.reportDate }"></td>
							</tr>
							<tr>
      							<th>日报人</th>
      							<td><input type="text" name="reportUser" class="update" readonly="true" value="${u.reportUser }"></td>
							</tr>
							<tr>
      							<th>日报项目</th>
      							<td><input type="text" name="reportProject" class="update" readonly="true" value="${u.reportProject }"></td>
							</tr>

							<tr>
								<th>日报内容</th>
								<td><textarea class="form-control update" rows="4" name="reportContent"  readonly="true">${u.reportContent }</textarea> </td>
							</tr>
							<tr>
								<th>备注</th>
								<td><textarea class="form-control update" rows="4" name="reportRemark"  readonly="true">${u.reportRemark }</textarea> </td>
							</tr>
							<tr>
								<th>追加内容</th>
								<td><textarea class="form-control update" rows="4" name="appendContent"  readonly="true">${u.appendContent }</textarea> </td>
							</tr>
							
							</table>
							
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            
				            <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#addAppendContent" data-dismiss="modal" title="追加内容" value="追加内容" onclick="setAppendId('${u.id }');">
				            
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
			</c:forEach>
	<form id="deleteCheck" name="deleteCheck" action="${ctx}/report/reportDeleteCheck" method="post">
		<table  class="table table-borderless table-data">
			<tr>
				<th><input type="button" value ="日报时间" onclick="reportOrder('reportDate')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="日报人" onclick="reportOrder('reportUser')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="日报项目" onclick="reportOrder('reportProject')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="日报内容" onclick="reportOrder('reportContent')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="备注" onclick="reportOrder('reportRemark')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="追加内容" onclick="reportOrder('appendContent')" class="btn" style="width:100%"/></th>
				<th  class="td-center">操作</th>
			</tr>
			<c:forEach items="${requestScope.reportList}" var="u" varStatus="">
				<c:set var="report" value="${u}"></c:set>
				<% 	Report report = (Report) pageContext.getAttribute("report");
					String reportContent = "";
					String reportRemark = "";
					String appendContent = "";
					if(report!=null){
						reportContent = report.getReportContent()==null?"":report.getReportContent();
						reportRemark = report.getReportRemark()==null?"":report.getReportRemark();
						appendContent = report.getAppendContent()==null?"":report.getAppendContent();
						if(reportContent.length()>10){
							reportContent = reportContent.substring(0, 10)+"...";
						}
						if(reportRemark.length()>10){
							reportRemark = reportRemark.substring(0, 10)+"...";
						}
						if(appendContent.length()>10){
							appendContent = appendContent.substring(0, 10)+"...";
						}					
					}
					pageContext.setAttribute("reportContent", reportContent);
					pageContext.setAttribute("reportRemark", reportRemark);
					pageContext.setAttribute("appendContent", appendContent);
					
					
					
				%>
				<tr  id="${u.id }${'tr' }">
					<td  class="td-center">${u.reportDate }</td>
					<td  class="td-center">${u.reportUser }</td>
					<td  class="td-center">${u.reportProject }</td>
					<td  class="td-center">${reportContent }</td>
					<td  class="td-center">${reportRemark }</td>
					<td  class="td-center">${appendContent }</td>
					<td  class="td-center"><input type="button" id="${'编辑'}${u.id }" class="btn btn-primary loadUserlist" data-toggle="modal" data-target="#${u.id }" title="查看详情" value="查看详情"></td>
				</tr>
			</c:forEach>


		</table>
		<div>
		<table>
			<tr>
            <td align="center" bgcolor="#5BA8DE">共${reportPage.totalCount}条记录 共${reportPage.totalPages}页 当前第${reportPage.pageNo}页<br>
                
                <input type="button" name="fristPage" value="首页" onClick="window.location.href='${ctx}/report/reportList?pageNo=1'"/>
                <c:choose>
                  <c:when test="${reportPage.pageNo!=1}">
                    
                      <input type="button" name="previousPage" value="上一页" onClick="window.location.href='${ctx}/report/reportList?pageNo=${reportPage.prePage }'"/>
                    
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="previousPage" value="上一页" />
                    
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${reportPage.pageNo != reportPage.totalPages}">
                    <input type="button" name="nextPage" value="下一页" onClick="window.location.href='${ctx}/report/reportList?pageNo=${reportPage.nextPage }'"/>
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="nextPage" value="下一页" />
                    
                  </c:otherwise>
                </c:choose>
                <input type="button" name="lastPage" value="尾页" onClick="window.location.href='${ctx}/report/reportList?pageNo=${reportPage.totalPages }'"/>
            </td>
				<td>
					<input type="button" class="btn btn-primary loadUserlist dpl" data-toggle="modal" data-target="#addReport" title="添加" value="添加" onclick="setCreateTime()">

				</td>
			</tr>
			</table>
			</div>
		
		</form>



	
</body>
</html>