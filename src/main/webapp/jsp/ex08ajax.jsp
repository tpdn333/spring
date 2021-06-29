<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
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
	<script type="text/javascript">
	$(function() {
		$("#btn1").on("click", function() {
			$.ajax({
				url: "${appRoot}/rest08/sub01",
				tpye : "get",
				success: function(data) {
					console.log("btn1", data);
				}
			});
		});
	});
	</script>
	<h5 class="mt-3" style="color:#007BFF">ajax</h5>
	<button class="btn btn-primary" id="btn1">Button1</button>
	<hr>
	
	<script type="text/javascript">
	$(function() {
		$("#btn2").on("click", function() {
			$.get({
				url: "${appRoot}/rest08/sub01",
				success: function(data) {
					console.log("btn2", data);
				}
			});
		});
	});
	</script>
	<h5 class="mt-3" style="color:#6C757D">ajax</h5>
	<button class="btn btn-secondary" id="btn2">Button2</button>
	<hr>
	
	<script type="text/javascript">
	$(function() {
		$("#btn3").on("click", function() {
			$.get("${appRoot}/rest08/sub01", function(data) {
					console.log("btn3", data);
			});
		});
	});
	</script>
	<h5 class="mt-3" style="color:#28A745">jQuery.get(url, [,data] [,success] [,dataType])</h5>
	<button class="btn btn-success" id="btn3">Button3</button>
	<hr>
	
	<script type="text/javascript">
	$(function() {
		$("#btn4").on("click", function() {
			$.ajax({
				url: "${appRoot}/rest08/sub02",
				dataType:"json", // 생략가능 ( 알아서 추론해서 설정해줌 )
				success: function(data) {
					console.log("btn4", data)
				}
			});
		});
		$("#btn5").on("click", function() {
			$.get({
				url: "${appRoot}/rest08/sub02",
				success: function(data) {
					console.log("btn5", data)
				}
			});
		});
		$("#btn6").on("click", function() {
			$.get("${appRoot}/rest08/sub02", function(data) {
				console.log("btn6", data)
			}, "json");
		});
		$("#btn7").click(function() {
			$.getJSON("${appRoot}/rest08/sub02", function(data) {
				console.log("btn7", data);
			});
		});
	});
	</script>
	<h5 class="mt-3" style="color:#DC3545">User json</h5>
	<button class="btn btn-danger" id="btn4">Button4</button>
	<button class="btn btn-danger" id="btn5">Button5</button>
	<button class="btn btn-danger" id="btn6">Button6</button>
	<button class="btn btn-danger" id="btn7">Button7</button>
	<hr>
</div>
</body>
</html>