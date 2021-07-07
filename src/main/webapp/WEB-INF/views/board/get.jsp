<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/board" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>
<title>Insert title here</title>
<script type="text/javascript">
	var appRoot = "${appRoot}";
	var boardBno = "${board.bno}";
	var userid = "${pinfo.member.userid}";
</script>
<script src="${appRoot }/resources/js/get.js"></script>
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
				<input type="hidden" readonly="readonly" id="input2" class="form-control" name="writer" value="${board.writer }"/>
				<input readonly="readonly" class="form-control" value="${board.writerName }"/>
			</div>
			<c:url value="/board/modify" var="modifyURL">
				<c:param name="bno" value="${board.bno }"></c:param>
				<c:param name="pageNum" value="${cri.pageNum }"></c:param>
				<c:param name="amount" value="${cri.amount }"></c:param>
				<c:param name="type" value="${cri.type }"></c:param>
				<c:param name="keyword" value="${cri.keyword }"></c:param>
			</c:url>
			<c:if test="${pinfo.member.userid eq board.writer }">
				<a class="btn btn-secondary" href="${modifyURL }">수정/삭제</a>
			</c:if>
		</form>
	</div>
	<div class="container mt-2">
		<div hidden="hidden" id="alert1" class="alert alert-primary fade" role="alert">
			A simple primary alert—check it out!
		</div>
		<div class="row">
			<div class="col-12">
				<h3>댓글</h3>
				<sec:authorize access="isAuthenticated()">
					<button type="button" class="btn btn-primary mt-2" data-toggle="modal" data-target="#reply-insert-modal" >댓글 작성</button>
				</sec:authorize>
				<ul class="list-unstyled" id="reply-list-container">
					
				</ul>
			</div>
		</div>
	</div>
	
	<%-- 댓글 입력 모달 --%>
	<div class="modal fade" id="reply-insert-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
	        		<h5 class="modal-title" id="exampleModalLabel">새 댓글</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
	     		</div>
	      		<div class="modal-body">
	        		<form>
	        		<input type="text" value="${board.bno }" readonly hidden id="reply-bno-input1"/>
	          		<div class="form-group">
	            		<label for="reply-replyer-input1" class="col-form-label">작성자</label>
	            		<input readonly type="text" class="form-control" id="reply-replyer-input1" value="${pinfo.member.userid }">
	         		</div>
	        		<div class="form-group">
	            		<label for="reply-reply-textarea1" class="col-form-label">댓글</label>
	            		<textarea class="form-control" id="reply-reply-textarea1"></textarea>
	          		</div>
	        		</form>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        		<button id="reply-insert-btn1" type="button" class="btn btn-primary">댓글 입력</button>
	      		</div>
			</div>
		</div>
	</div>
	
	<%-- 댓글 수정, 삭제 모달 --%>
	<div class="modal fade" id="reply-modify-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
	        		<h5 class="modal-title">댓글 수정</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
	     		</div>
	      		<div class="modal-body">
	        		<form>
	        		<input type="text" value="${board.bno }" readonly hidden id="reply-bno-input2"/>
	        		<input type="text" value="" readonly hidden id="reply-rno-input2"/>
	          		<div class="form-group">
	            		<label for="reply-replyer-input2" class="col-form-label">작성자</label>
	            		<input type="text" class="form-control" id="reply-replyer-input2" readonly>
	         		</div>
	        		<div class="form-group">
	            		<label for="reply-reply-textarea1" class="col-form-label">댓글</label>
	            		<textarea class="form-control" id="reply-reply-textarea2"></textarea>
	          		</div>
	        		</form>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        		<button id="reply-modify-btn1" type="button" class="btn btn-warning">수정</button>
	        		<button id="reply-delete-btn1" type="button" class="btn btn-danger">삭제</button>
	      		</div>
			</div>
		</div>
	</div>
</body>
</html>