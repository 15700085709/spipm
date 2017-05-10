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
<input type="button" name="show" value="show" onClick="window.location.href='${ctx}/user/userList'" />
	<h2>user list info !!!</h2>
	<c:if test="${empty requestScope.userList }">
		没有记录
	</c:if>
	<c:if test="${!empty requestScope.userList }">
		<table>
			<tr>
				<th>职工ID</th>
				<th>职工姓名</th>
				<th>职员岗位</th>
				<th>手机号码</th>
				<th>电子邮箱</th>
				<th>操作</th>
			</tr>
			
			<c:forEach items="${requestScope.userList}" var="u" varStatus="">
				<tr>
					<td>${u.userId }</td>
					<td>${u.userName }</td>
					<td>${u.type }</td>
					<td>${u.phone }</td>
					<td>${u.email }</td>
					<td><input type="button" name="delete" value="delete" onClick="window.location.href='${ctx}/user/userDelete?id=${u.id }'" /></td>
					<td></td>
				
				</tr>
			</c:forEach>


		</table>

	</c:if>
	
			<form name="addform" action="${ctx}/user/userAdd" method="post">
			<table>
				<tr> 
				<td>职工ID</td>
				<td><input type="text" name="userId" class="userId" placeholder="职工ID"></td>
				</tr>
				
				<tr> 
				<td>职工姓名</td>
				<td><input type="text" name="userName" class="userName" placeholder="职工姓名"></td>
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
				<td><input type="text" name="phone"  placeholder="电话"></td>
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