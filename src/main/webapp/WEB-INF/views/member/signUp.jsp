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
<bd:navbar/>
	<div class="container">
	<c:if test="${not empty param.error }">
		<div hidden="hidden" id="alert1" class="alert alert-danger fade" role="alert">
			회원가입에 실패하였습니다 !
		</div>
	</c:if>
	<h1>회원가입</h1>
		<div class="row">
			<div class="col-12">
				<form method="post" action="${appRoot }/member/signUp">
					<div class="form-group">
						<label for="signUp-input1">아이디</label>
						<input type="text" class="form-control" id="signUp-input1" name="userid"/>
					</div>
					<div class="form-group">
						<label for="signUp-input2">비밀번호</label>
						<input type="password" class="form-control" id="signUp-input2" name="userpw"/>
					</div>
					<div class="form-group">
						<label for="signUp-input3">이름</label>
						<input type="text" class="form-control" id="signUp-input3" name="userName"/>
					</div>
					<button class="btn btn-primary" id="signUp-btn1">회원가입</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>