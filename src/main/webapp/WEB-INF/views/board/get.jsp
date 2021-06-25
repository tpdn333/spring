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
			<c:url value="/board/modify" var="modifyURL">
				<c:param name="bno" value="${board.bno }"></c:param>
				<c:param name="pageNum" value="${cri.pageNum }"></c:param>
				<c:param name="amount" value="${cri.amount }"></c:param>
				<c:param name="type" value="${cri.type }"></c:param>
				<c:param name="keyword" value="${cri.keyword }"></c:param>
			</c:url>
			<a class="btn btn-secondary" href="${modifyURL }">수정/삭제</a>
		</form>
	</div>
</body>
</html>