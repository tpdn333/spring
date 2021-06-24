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
</head>
<body>
	<div class="container">
	<bd:navbar/>
		<table class="table table-hover">
		<thead>
			<tr>
				<th>#</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="board">
				<tr>
					<td>${board.bno }</td>
					<td><a href="${appRoot }/board/get?bno=${board.bno}">${board.title }</a></td>
					<td>${board.writer }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
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