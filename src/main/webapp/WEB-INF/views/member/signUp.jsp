<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/board" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<script type="text/javascript">
$(function() {
	
	
	var canUseId = false;
	var passwordConfirm = false;
	<%-- 아이디 중복 확인 --%>
	$("#id-dup-btn").click(function() {
		var idVal = $("#signUp-input1").val();
		var message = $("#id-message");
		canUseId = false;
		toggleEnableSubmit();
		
		if(idVal != "") {
			var data = {id: idVal};
			$.ajax({
				type: "get",
				url: "${appRoot}/member/dup",
				data: data,
				success: function(data) {
					if (data == "success") {
						console.log("사용가능한 아이디");
						message.text("사용가능한 아이디 입니다.");
						canUseId = true;
					} else if (data == "exist") {
						console.log("사용불가능한 아이디");
						message.text("중복된 아이디 입니다.");
					}
					toggleEnableSubmit();
				},
				error: function() {
					console.log("아이디가 중복되었습니다");
				}
			});
			
		} else {
			message.text("아이디를 입력해 주세요");
		}
	});
	
	// 패스워드 확인
	$("#signUp-input2, #signUp-input4").keyup(function() {
		var pw1 = $("#signUp-input2").val();
		var pw2 = $("#signUp-input4").val();
		var signUpBtn = $("#signUp-btn1");
		var pwReg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{10,}$/;
		passwordConfirm = false;
		
		if(false === pwReg.test(pw1)) {
			console.log("비번 ㄴㄴ");
			$("#password-regmessage").text("비밀번호 조건식에 맞지 않습니다.");
		} else {
			console.log("통과 !");
			$("#password-regmessage").empty();
		}
		
		if(pw1 != "" || pw2 != "") {
			if(pw1 != pw2) {
				$("#password-message").text("패스워드가 일치하지 않습니다.");
			} else {
				$("#password-message").empty();
				passwordConfirm = true;
				
			}
		}
		toggleEnableSubmit();
	});
	
	<%-- $("#toggle-password-btn").click(function() {
		var input2Elem= $("#signUp-input2");
		input2Elem.toggle(
			function() {$(this).removeAttr("type").attr("type", "text");},
			function() {$(this).removeAttr("type").attr("type", "password");}
		);
	}); --%>
	
	function toggleEnableSubmit() {
		if (passwordConfirm && canUseId) {
			$("#signUp-btn1").removeAttr("disabled");
		} else {
			$("#signUp-btn1").attr("disabled", true);
		}
		
	}
	
});
</script>
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
						<div class="input-group">
							<input type="text" class="form-control" id="signUp-input1" name="userid"/>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button" id="id-dup-btn">중복 확인</button>
							</div>
						</div>
						<small id="id-message" class="form-text"></small>
					</div>
					<div class="form-group">
						<label for="signUp-input2">비밀번호</label><small> ( 대소문자, 숫자 포함 10자 이상 )</small>
						<div class="input-group">
							<input type="password" class="form-control" id="signUp-input2" name="userpw"/>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button" id="toggle-password-btn"><i class="far fa-eye"></i></button>
							</div>
						</div>
						<small id="password-regmessage" class="form-text text-danger"></small>
					</div>
					<div class="form-group">
						<label for="signUp-input4">비밀번호 확인</label>
						<input type="password" class="form-control" id="signUp-input4"/>
						<small id="password-message" class="form-text text-danger"></small>
					</div>
					<div class="form-group">
						<label for="signUp-input3">이름</label>
						<input type="text" class="form-control" id="signUp-input3" name="userName"/>
					</div>
					<button disabled class="btn btn-primary" id="signUp-btn1">회원가입</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>