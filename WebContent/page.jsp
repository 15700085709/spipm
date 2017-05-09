<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/style/public/title_setting.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<a href="${ctx}/user/userList"><input type="button" name="show" value="show" /></a>
	<h2>user list info !!!</h2>
	<c:if test="${empty requestScope.userList }">
		没有记录
	</c:if>
	<c:if test="${!empty requestScope.userList }">
		<table>
			<tr>
				<th>userName</th>
				<th>operation</th>
			</tr>
			
			<c:forEach items="${requestScope.userList}" var="u" varStatus="">
				<tr>
					<td>${u.id }</td>
					<td><a href="${ctx}/user/userDelete?id=${u.id }"><input type="button" name="delete" value="delete" /></a></td>
					<td></td>
				
				</tr>
			</c:forEach>


		</table>

	</c:if>
	
			<form name="addform" action="${ctx}/user/userAdd" method="post">
			<table>
				<tr> 
				<td>用户名</td>
				<td><input type="text" name="userName" class="userName" placeholder="用户名"></td>
				</tr>
				
				<tr> 
				<td>密码</td>
				<td><input type="password" name="password" class="password" placeholder="密码"></td>
				</tr>
				<tr> 
				<td>用户类型</td>
				<td><select name="type">
					  <option value ="dev">开发</option>
					  <option value ="sqa">测试</option>
					  <option value="pm">项目经理</option>
					  <option value="customer">客户</option>
					</select></td>
				</tr>
				<tr> 
				<td>手机号码</td>
				<td><input type="text" name="mobilePhone"  placeholder="电话"></td>
				</tr>
				<tr> 
				<td>电子邮箱</td>
				<td><input type="text" name="email" placeholder="电子邮箱"></td>
				</tr>
				<tr> 
				<td><input type="submit"/ value="添加"/>	</td>
				</tr>		
			</table>
			</form>
</body>
<script src="${ctx}/assets/js/jquery-1.8.2.min.js"></script>
</html>