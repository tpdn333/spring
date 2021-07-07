<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/board" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$("#list-pagination1 a").click(function(e) {
		e.preventDefault();
		
		console.log("a요소 클릭됨");
		
		var actionForm = $("#actionForm");
		
		// form의 pageNum input의 값을 a 요소의 href값으로 변경
		actionForm.find("[name=pageNum]").val($(this).attr("href"));
		
		actionForm.submit();
	});
});
</script>
</head>
<body>
	<div class="container">
	<bd:navbar/>
		<h1>자유 게시판</h1>
		<table class="table table-hover">
		<thead>
			<tr>
				<th>#</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="board">
				<tr>
					<td>${board.bno }</td>
					<td>
					<c:url value="/board/get" var="getURL">
						<c:param name="bno" value="${board.bno }" />
						<c:param name="pageNum" value="${pageMaker.cri.pageNum }" />
						<c:param name="amount" value="${pageMaker.cri.amount }" />
						<c:param name="type" value="${pageMaker.cri.type }" />
						<c:param name="keyword" value="${pageMaker.cri.keyword }" />
					</c:url>
					<a href="${getURL }">${board.title }
						<c:if test="${board.replyCnt  > 0 }">
							[${board.replyCnt }]
						</c:if> 
					</a></td>
					<td>${board.writerName }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/></td>
					<td>${board.views }</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
	<!-- pagination  -->
	<div>
		<nav aria-label="Page navigation example">
			<ul id="list-pagination1" class="pagination justify-content-center">
				<c:if test="${pageMaker.prev }">
					<li class="page-item">
					  <a class="page-link" href="${pageMaker.startPage - 1 }">Previous</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
				<%-- href value
				href="${appRoot }/board/list?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}"
				 --%>
					<li class="page-item ${num == cri.pageNum ? 'active' : '' }"><a class="page-link" 
						href="${num }">${num }</a></li>
				</c:forEach>
				
				<c:if test="${pageMaker.next }">
					<li class="page-item">
					  <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</nav>
		<!-- pageLink From -->
		<div style="display:none;">
			<form id="actionForm" action="${appRoot }/board/list" method="get">
				<input name="pageNum" value="${cri.pageNum }"/>
				<input name="amount" value="${cri.amount }"/>
				<input name="type" value="${cri.type }" />
				<input name="keyword" value="${cri.keyword }"/>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			if(history.state == null) {
				$("#boardModal1").modal('show');
				history.replaceState({}, null);
			}
		});
	</script>
	<c:if test="${not empty result }">
		<div id="boardModal1" class="modal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
		        		<h5 class="modal-title">${messageTitle }</h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          		<span aria-hidden="true">&times;</span>
		        		</button>
		      		</div>
			      	<div class="modal-body">
			        	<p>${messageBody }</p>
			      	</div>
			      	<div class="modal-footer">
			        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      		</div>
		    	</div>
			</div>
		</div>
	</c:if>
</body>
</html>