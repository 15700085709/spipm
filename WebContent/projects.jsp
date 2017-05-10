<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/style/public/title_setting.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>项目列表</title>
</head>
<body>


${ctx}
<input type="button" name="show" value="show" onClick="window.location.href='${ctx}/project/projectList'"/>
	<h2>Project list info !!!</h2>
	<c:if test="${empty requestScope.projectList }">
		没有记录
	</c:if>
	<c:if test="${!empty requestScope.projectList }">
		<table>
			<tr>
				<th>项目代号</th>
				<th>项目名称</th>
				<th>项目信息</th>
				<th>项目经理</th>
				<th>项目进度</th>
				<th>项目计划</th>
				<th>操作</th>
			</tr>
			
			<c:forEach items="${requestScope.projectList}" var="p" varStatus="">
				
				<tr>
					<td>${p.proCode }</td>
					<td>${p.proName }</td>
					<td>${p.proInfo }</td>
					<td>${p.manager }</td>
					<td>${p.process }</td>
					<td><input type="button" name="download" value="下载项目计划" onClick="window.location.href='${ctx}/project/proPlanDownload?id=${p.id }'" /></td>		
					<td>修改<input type="button" name="delete" value="删除" onClick="window.location.href='${ctx}/project/projectDelete?id=${p.id }'" /></td>				
				</tr>
			</c:forEach>
		</table>
	</c:if>

	<form name="project" action="${ctx}/project/projectAdd" method="post"  enctype="multipart/form-data">
	<input type="file" name="file">
	<input type="submit" value="upload"/>
	</form>	
</body>
</html>