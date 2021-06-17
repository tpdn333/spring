<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<a href="<%= request.getContextPath() %>/ex01/sub03"> sub03 get</a>
		<form action="${pageContext.request.contextPath }/ex01/sub03" method="post">
			<p>sub03</p>
			<button>post 전송</button>
		</form>
		
		<form action="${pageContext.request.contextPath }/ex01/sub06" method="post">
			<p>sub06</p>
			<button>post 전송</button>
		</form>
		
	</div>
</body>
</html>