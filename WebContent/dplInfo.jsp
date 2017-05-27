<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/style/public/title_setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>软件部署</title>
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
					<li><a href="${ctx}/dpl/logout">退出</a></li>
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


				<div class="modal fade" id="addDpl" tabindex="-1" role="dialog" 
				   aria-labelledby="myModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" 
				               data-dismiss="modal" aria-hidden="true">
				                  &times;
				            </button>
				            <h4 class="modal-title" id="myModalLabel">
				               	软件部署
				            </h4>
				         </div>
				         <form  action="${ctx}/dpl/dplAdd" method="post" >
				         <div class="modal-body" >
				         	<table class="table table-borderless table-data">
				         	<tr>
      							<th>部署版本号</th>
      							<td><input type="text" name="dplVersion" id="dplVersion" class="add" readonly="true" value="${maxVersion }"></td>
							</tr>
							<tr>
      							<th>部署项目</th>
      							<td><select name="dplProject" id="dplProject" class="add"></select></td>
							</tr>
							<tr>
								<th>部署人</th>
      							<td><input type="text" name="dplUser" id="dplUser" class="add" readonly="true"  value="${'666'}"></td>
							</tr>

							<tr>
								<th>部署war包</th>
								<td><input type="file" name="dplWar" id="dplWar" accept=".war" class="add"></td>
							</tr>
							<tr>
								<th>部署脚本</th>
								<td><input type="file" name="dplSql" id="dplSql" accept=".sql" class="add"></td>
							</tr>

							</table>
							
				         </div>

						
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="submit" class="btn btn-primary" name="add" value="添加" id="dplAdd" disabled="true"/>
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
	
			<c:forEach items="${requestScope.dplList}" var="t" varStatus="">
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
				         	
				         	
				         	
							</table>
							
				         </div>
				         

				         
				         
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" 
				               data-dismiss="modal">关闭
				            </button>
				            <input type="button" class="btn btn-primary dplUpdate" name="update" id="dplUpdate" disabled="true" value="提交更改" onClick="dplUpdate1('${t.id }');" />
				            <input type="button" class="btn btn-primary" name="delete" value="删除" onClick="dplDelete1(this.form);" />
				            
				         </div>
				            </form>
				      </div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
			</c:forEach>
	<form id="deleteCheck" name="deleteCheck" action="${ctx}/dpl/dplDeleteCheck" method="post">
		<table  class="table table-borderless table-data">
			<tr>
				<th><input type="checkbox" onclick="checkAll(this)">全选</th>
				<th><input type="button" value ="部署版本号" onclick="dplOrder('dplVersion')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="部署项目" onclick="dplOrder('dplProject')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="部署人" onclick="dplOrder('dplUser')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="部署创建时间" onclick="dplOrder('createTime')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="部署时间" onclick="dplOrder('dplTime')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="部署war包" onclick="dplOrder('dplSql')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="部署脚本" onclick="dplOrder('dplSql')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="状态" onclick="dplOrder('dplState')" class="btn" style="width:100%"/></th>
				<th><input type="button" value ="审批人" onclick="dplOrder('dplApprover')" class="btn" style="width:100%"/></th>
				<th>操作</th>
			</tr>
			<c:forEach items="${requestScope.dplList}" var="t" varStatus="">
				<tr  id="${t.id }${'tr' }">
					<td><input type="checkbox" name="dplCheck" value="${t.id }" /></td>
					<td>${t.dplVersion }</td>
					<td>${t.dplProject }</td>
					<td>${t.dplUser }</td>
					<td>${t.createTime }</td>
					<td>${t.dplTime }</td>
					<td>${t.dplWar }<input type="button" class="btn btn-primary"  title="下载war包" value="下载war包" onclick="window.location.href='${ctx}/dpl/dplDownload?suffix=war&id=${t.id }'"></td>
					<td>${t.dplSql }<input type="button" class="btn btn-primary"  title="下载sql包" value="下载sql包" onclick="window.location.href='${ctx}/dpl/dplDownload?suffix=sql&id=${t.id }'"></td>
					<td>${t.dplState }<select name="dplProject" id="dplProject" class="add">
						<option value="${t.dplState }" class="selectpicker" data-style="btn-danger" selected>${t.dplState }</option>
						<c:if test="${t.dplState=='创建'}">
							<option value="审核">审核</option>
						</c:if>
					
					
					
					
					
					</select></td>
					

					
					
					
					<td>${t.dplApprover }</td>
					<td><input type="button" id="${'编辑'}${t.id }" class="btn btn-primary loadUserlist dpl" data-toggle="modal" data-target="#${t.id }" title="编辑" value="编辑"></td>
				</tr>
			</c:forEach>


		</table>
		<div>
		<table>
			<tr>
            <td align="center" bgcolor="#5BA8DE">共${dplPage.totalCount}条记录 共${dplPage.totalPages}页 当前第${dplPage.pageNo}页<br>
                
                <input type="button" name="fristPage" value="首页" onClick="window.location.href='${ctx}/dpl/dplList?pageNo=1'"/>
                <c:choose>
                  <c:when test="${dplPage.pageNo!=1}">
                    
                      <input type="button" name="previousPage" value="上一页" onClick="window.location.href='${ctx}/dpl/dplList?pageNo=${dplPage.prePage }'"/>
                    
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="previousPage" value="上一页" />
                    
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${dplPage.pageNo != dplPage.totalPages}">
                    <input type="button" name="nextPage" value="下一页" onClick="window.location.href='${ctx}/dpl/dplList?pageNo=${dplPage.nextPage }'"/>
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="nextPage" value="下一页" />
                    
                  </c:otherwise>
                </c:choose>
                <input type="button" name="lastPage" value="尾页" onClick="window.location.href='${ctx}/dpl/dplList?pageNo=${dplPage.totalPages }'"/>
            </td>
				<td>
					<input type="button" class="btn btn-primary loadUserlist dpl" data-toggle="modal" data-target="#addDpl" title="添加" value="添加" onclick="setCreateTime()">
					<input type="button" class="btn btn-primary"  title="删除" value="删除" disabled="true" id="deleteChecked" onclick="deleteConfirm()">
				</td>
			</tr>
			</table>
			</div>
		
		</form>


	
</body>
</html>