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
<script type="text/javascript">
	$(function() {
		$("#submit1").click(function(e) {
			e.preventDefault();
			$(this).attr("disabled", "disabled");
			$(this).html('<i class="fas fa-spinner fa-spin"></i>')
			var id = $("#input1").val();
			var age = $("#input2").val();
			
			var data = { id : id, age : age };
			$.post({
				url : "${appRoot}/rest10/add",
				data : data,
				success : function(data) {
					console.log(data);
					alert(data.id + "가 등록되었습니다.");
					$("#submit1").removeAttr("disabled");
					$("#submit1").html("전송");
				}
			});
		});
		
		$("#btn2").click(function() {
			$.get({
				url : "${appRoot}/rest10/list",
				success : function(list) {
					console.log(list);
					var table1body = $("#table1 tbody");
					table1body.empty();
					for(var i = 0; i < list.length; i++) {
						var tr = $(generateTableRow(list[i]));
						table1body.append(tr);
					}
				}
			});
		});
		function generateTableRow(data) {
			return "<tr><td>" + data.id + "</td><td>" + data.age + "</td></tr>"
		}
	});
</script>
</head>
<body>
<div class="container">
	<h3><%= Math.random() %></h3>
	<input id="input1" name="id" placeholder="ID를 입력하시오."/>
	<input id="input2" name="age" type="number" placeholder="나이"/>
	<!-- <input id="submit1" type="submit" value="제출"/> -->
	<button id="submit1">전송</button>
	
	<button id="btn2">목록보기</button>
	<table id="table1" class="table">
		<thead>
		<tr>
			<th>ID</th>
			<th>Age</th>
		</tr>	
		</thead>
		<tbody>
		</tbody>
	</table>
	
</div>
</body>
</html>