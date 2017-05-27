<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/style/public/title_setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ajax</title>
	<script src="${ctx}/scripts/jquery-3.1.1.min.js"></script>
	</script>  
	<script type="text/javascript">  
	$(function() {  
	    getjson();  
	});  
	  
	function getjson() {  
		alert("Data Saved: " + "--"); 
	    $.ajax( {  
	        type : "get",  
	        url : "${ctx}/project/json",  
	        dataType:"json",  
	        success : function(msg) {  
	            alert("Data Saved: " + msg.proCode+"--");  
	        }  
	    });  
	}  
	</script> 
</head>

<body>
	<input type="button" name="test" onclike="getjson()" />
</body>
</html>