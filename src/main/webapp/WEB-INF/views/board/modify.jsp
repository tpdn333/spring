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
	$(document).ready(function() {
		var modifyUrl = "${appRoot}/board/modify";
		var removeUrl = "${appRoot}/board/remove";
		$("#boardRemoveBtn").click(function() {
			if (confirm("삭제 하시겠습니까?")) {
				$("#modifyForm1").attr("action", removeUrl);
				$("#modifyForm1").submit();
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
	<bd:navbar/>
		<h1>글 수정/삭제</h1>
		<form id="modifyForm1" action="${appRoot }/board/modify" method="post">
			<input hidden="hidden" name="bno" value="${board.bno }"/>
			<div class="form-group">
				<label for="input1">제목</label>
				<input id="input1" class="form-control" name="title" value="${board.title }"/>
			</div>
			<div class="form-group">
				<label for="textarea1">내용</label>
				<textarea style="resize:none"rows="5" id="textarea1" class="form-control" name="content"><c:out value="${board.content }"></c:out></textarea>
			</div>
			<div class="form-group">
				<label for="input2">작성자</label>
				<input readonly="readonly" id="input2" class="form-control" name="writer" value="${board.writer }"/>
			</div>
			<input type="hidden" name="pageNum" value="${cri.pageNum }"/>
			<input type="hidden" name="amount" value="${cri.amount }"/>
			<input type="hidden" name="type" value="${cri.type }"/>
			<input type="hidden" name="keyword" value="${cri.keyword }"/>
				<input class="btn btn-warning" type="submit" value="수정"/>
				<input id="boardRemoveBtn" class="btn btn-danger" type="button" value="삭제"/>
		</form>
	</div>
</body>
</html>