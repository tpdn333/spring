<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<H1>Ex08 Sub02 Method !</H1>
		<h3>id : ${user.id }</h3>
		<h3>age : ${user.age }</h3>
		<h1>string : ${string }</h1>
	</div>
</body>
</html>