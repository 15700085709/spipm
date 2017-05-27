<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/style/public/title_setting.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="user/test">666 </a>


<table>
<tr>
            <td colspan="6" align="center" bgcolor="#5BA8DE">共${userPage.totalCount}条记录 共${userPage.totalPages}页 当前第${userPage.pageNo}页<br>
                
                <a href="${ctx}/user/test?pageNo=1"><input type="button" name="fristPage" value="首页" /></a>
                <c:choose>
                  <c:when test="${userPage.pageNo!=1}">
                    
                      <a href="${ctx}/user/test?pageNo=${userPage.prePage }"><input type="button" name="previousPage" value="上一页" /></a>
                    
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="previousPage" value="上一页" />
                    
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${userPage.pageNo != userPage.totalPages}">
                    <a href="${ctx}/user/test?pageNo=${userPage.nextPage }"><input type="button" name="nextPage" value="下一页" /></a>
                  </c:when>
                  <c:otherwise>
                    
                      <input type="button" disabled="disabled" name="nextPage" value="下一页" />
                    
                  </c:otherwise>
                </c:choose>
                <a href="${ctx}/user/test?pageNo=${userPage.totalPages }"><input type="button" name="lastPage" value="尾页" /></a>
            </td>
</tr>
</table>
</body>
</html>