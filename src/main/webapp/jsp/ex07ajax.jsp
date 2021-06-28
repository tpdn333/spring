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
	<script type="text/javascript">
	$(function() {
		$("#btn1").on("click", function() {
			$.ajax({
				url: "${appRoot}/rest07/sub01",
				data:{
					name: "sswy",
					age: 28
				},
				success: function(data) {
					console.log(data);
				}
			});
		});
	});
	</script>
	<button class="btn btn-primary mt-3" id="btn1">Button1</button>
	<hr>
	
	<script type="text/javascript">
	$(function() {
		$("#btn2").on("click", function() {
			$.ajax({
				url: "${appRoot}/rest07/sub02",
				type: "POST",
				data:{
					id : "sewoo",
					age : 28
				},
				success: function(data) {
					console.log(data);
				}
			});
		});
	});
	</script>
	<button class="btn btn-secondary" id="btn2">Button2</button>
	<hr>
	
	<script type="text/javascript">
	$(function() {
		$("#btn3").on("click", function() {
			$.ajax({
				url: "${appRoot}/rest07/sub03",
				type: "post",
				contentType: "application/json",
				data: JSON.stringify({
					id : "sewoo",
					age : 28
				}),
				success: function(data) {
					console.log(data);
				}
			});
		});
	});
	</script>
	<h5 style="color:#28A745">user 객체를 json을 받기</h5>
	<button class="btn btn-success" id="btn3">Button3</button>
	<hr>
	
	<script type="text/javascript">
	$(function() {
		$("#btn4").on("click", function() {
			$.ajax({
				url: "${appRoot}/rest07/sub04",
				success: function(data) {
					console.log(data);
					
					console.log(data.id);
					console.log(data.age);
				}
			});
		});
	});
	</script>
	<h5 style="color:#DC3545">바로 json으로 받기</h5>
	<button class="btn btn-danger" id="btn4">Button4</button>
	<hr>
</div>
</body>
</html>