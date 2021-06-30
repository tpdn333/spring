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
	$(document).ready(function() {
		$("#btn1").click(function() {
			var data = {
					bno : 150,
					reply : "새로운 수정된 댓글",
					replyer : "수정된 user"
				};
			
			$.post({
				url : "${appRoot}/replies/new",
				data : JSON.stringify(data),
				contentType : "application/json",
				success : function(da) {
					console.log(da);
				},
				error : function(){
					console.log("실패");
				}
			});
		});
		
		$("#btn2").click(function() {
			var data = {
					bno : 200,
					reply : "새로운 수정된 댓글",
					replyer : "수정된 user"
				};
			
			$.post({
				url : "${appRoot}/replies/new",
				data : JSON.stringify(data),
				contentType : "application/json",
				success : function(da) {
					console.log(da);
				},
				error : function(){
					console.log("실패");
				}
			});
		});
	});
	</script>
		<button id="btn1">Create - success </button>
		<button id="btn2">Create - fail </button>
		
		<hr>
		<script type="text/javascript">
			$(function() {
				$("#btn3").click(function() {
					var bno = 150;
					$.get({
						url : "${appRoot}/replies/page/" + bno,
						success : function(data) {
							console.log(data);
						}
					});
				});
			});
		</script>
		<button id="btn3">List button</button>
		
		<hr>
		<script type="text/javascript">
			$(function() {
				$("#btn4").click(function() {
					var rno = 50;
					$.get({
						url : "${appRoot}/replies/" + rno,
						success : function(data){
							console.log(data);
						}
					});
				});
			});
		</script>
		<h2>댓글 하나</h2>
		<button id="btn4">Get</button>
		
		<hr>
		<script type="text/javascript">
		$(function() {
			$("#btn5").click(function() {
				var rno = 50;
				$.ajax({
					type : "delete",
					url : "${appRoot}/replies/" + rno,
					success : function() {
						console.log("delte success");
					},
					error : function() {
						console.log("delete fail")
					}
				})
			})
		})
		</script>
		<h5>댓글 삭제</h5>
		<button id="btn5">Delete</button>
		
		<hr>
		<script type="text/javascript">
		$(function() {
			$("#btn6").click(function() {
				var rno = 51;
				var data = {
						rno : rno,
						bno : 153,
						reply : "수정된 댓글!",
						replyer : "수정된 replyer"
					};
				$.ajax({
					type : "put",
					url : "${appRoot}/replies/" + rno,
					data : JSON.stringify(data),
					contentType : "application/json",
					success : function() {
						console.log("modify success");
					},
					error : function() {
						console.log("modify fail");
					}
				});
			});
		});
		</script>
		<h5>댓글 수정</h5>
		<button id="btn6">Modify</button>
		<hr>
		
		<script type="text/javascript">
		$(function() {
			$("#btn7").click(function() {
				var rno = $("#input1").val();
				var bno = $("#input2").val();
				var reply = $("#input3").val();
				var replyer = $("#input4").val();
				
				var data = { rno : rno, 
						bno : bno, 
						reply : reply, 
						replyer : replyer };
				$.ajax({
					type : "put",
					url : "${appRoot}/replies/" + rno,
					data : JSON.stringify(data),
					contentType : "application/json",
					success : function() {
						console.log("modify success");
					},
					error : function() {
						console.log("modify fail");
					}
				});
			});
		});
		</script>
		
		<h5>댓글 수정 Form</h5>
		<input id="input1" name="rno" value="51"/>
		<input id="input2" name="bno" value="153" />
		<input id="input3" name="reply" placeholder="댓글 입력"/>
		<input id="input4" name="replyer" placeholder="작성자 입력" />
		
		<button id="btn7">Modify Form</button>
	</div>
</body>
</html>