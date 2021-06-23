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
		<bd:navbar/>
		<h1>글 보기</h1>
		<form>
			<div class="form-group">
				<label for="input1">제목</label>
				<input readonly="readonly" id="input1" class="form-control" name="title" value="${board.title }"/>
			</div>
			<div class="form-group">
				<label for="textarea1">내용</label>
				<textarea readonly="readonly" style="resize:none"rows="5" id="textarea1" class="form-control" 
							name="content"><c:out value="${board.content }"> }</c:out></textarea>
			</div>
			<div class="form-group">
				<label for="input2">작성자</label>
				<input readonly="readonly" id="input2" class="form-control" name="writer" value="${board.writer }"/>
			</div>
			<a class="btn btn-secondary" href="${appRoot }/board/modify?bno=${board.bno}">수정/삭제</a>
		</form>
	</div>
</body>
</html>