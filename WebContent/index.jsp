<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/style/public/title_setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
    <head>
        <meta charset="utf-8">
        <title>软件项目实施过程管理系统</title>

        <link rel="stylesheet" href="${ctx}/assets/css/reset.css">
        <link rel="stylesheet" href="${ctx}/assets/css/supersized.css">
        <link rel="stylesheet" href="${ctx}/assets/css/style.css">


    </head>

    <body>

        <div class="page-container">
            <h1>登录</h1>
            <form>
            	<a id="message" hidden="hidden" color="red">
            	<font size="3" color="red">登陆失败,用户名或密码错误!</font>
            	</a>
                <input type="text" name="userId" id="userId" class="userId" placeholder="用户名">
                <input type="password" name="password" id="password" class="password" placeholder="密码">
                <button type="submit">登陆</button>
                <div class="error"><span>+</span></div>
            </form>

        </div>
		
        <!-- Javascript -->
        <script src="${ctx}/assets/js/jquery-1.8.2.min.js"></script>
        <script src="${ctx}/assets/js/supersized.3.2.7.min.js"></script>
        <script src="${ctx}/assets/js/scripts.js"></script>
        <script type="text/javascript" src="${ctx}/style/js/jquery-2.2.3.min.js"></script>
    </body>
</html>


