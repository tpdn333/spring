<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/board"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<%-- Spring Security --%>
		<div>
			<sec:authorize access="isAuthenticated()">
				<!-- 로그인 되었을 때 principal = CustomUser -->
				<sec:authentication property="principal" var="pinfo" />
				${pinfo.member.userid }<br>
				${pinfo.member.userpw }<br>
				${pinfo.member.userName }<br>
			</sec:authorize>
			<sec:authorize access="!isAuthenticated()">
				<!-- 로그인 안되었을 때 principal = String -->
				<sec:authentication property="principal" var="pinfo" />
				${pinfo }<br>
			</sec:authorize>
		</div>
	</div>
</body>
</html>