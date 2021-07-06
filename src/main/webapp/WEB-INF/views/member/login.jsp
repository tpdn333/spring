<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/board" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<bd:navbar/>
		<div class="row justify-content-center">
			<div class="col-md-12 col-6">
			<h1>로그인</h1>
				<form action="${appRoot }/login" method="post">
					<div class="form-group">
						<label for="input1">이름</label>
						<input class="form-control"id="input1" name="username" />
					</div>
					<div class="form-group">
						<label for="input2">비밀번호</label>
						<input class="form-control" id="input2" name="password" />
					</div>
					<button class="btn btn-primary">로그인</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>