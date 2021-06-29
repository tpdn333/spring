<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#test1").click(function() {
			$.ajax({
				url:'${appRoot}/rest05/sub01',
				type: "post",
				data: '{"id":"korea", "age":30}',
				contentType: 'application/json',
				success: function(data){
					console.log(data);
				},
				error: function(){
					console.log("Fail");	
				}
			});
		});
		$("#test2").click(function() {
			console.log(this);
			console.log($(this));
			$("#test3").text(this);
			$("#test4").text($(this)[0]);
		});
	});
</script>
</head>
<body>
	<div class="container">
		<button id="test1">BUTTON</button>
		<button id="test2">BUTTON2</button>
		<p id="test3">누르기 전</p>
		<p id="test4">누르기 전</p>
	</div>
</body>
</html>