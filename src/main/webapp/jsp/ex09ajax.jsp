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
				url:"${appRoot}/rest09/sub01", 
				type: 'post',
				data: {
					id:"korea",
					age: 55
				},
				success: function(data) {
					console.log("btn1", data);},
				dataType: "json"
			});
		});
		$("#btn2").click(function() {
			$.post({
				url:"${appRoot}/rest09/sub01", 
				data: {
					id:"korea",
					age: 55
				},
				success: function(data) {
					console.log("btn2", data);},
				dataType: "json"
			});
		});
		$("#btn3").click(function() {
			$.post("${appRoot}/rest09/sub01",
					{ id : "korea", age : 55 }, 
					function(data) { console.log("btn3", data);},
					"json");
		});
	});
	</script>
	<h5 class="mt-3" style="color:#007BFF">jQuery.post(url, [,data] [,success] [,dataType])</h5>
	<button class="btn btn-primary" id="btn1">Button1</button>
	<button class="btn btn-primary" id="btn2">Button2</button>
	<button class="btn btn-primary" id="btn3">Button3</button>
	<hr>
</div>
</body>
</html>