<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:url value="/board/list" var="listURL">
	<c:if test="${not empty cri.pageNum }">
		<c:param name="pageNum" value="${cri.pageNum }"></c:param>
	</c:if>
	<c:if test="${not empty cri.amount }">
		<c:param name="amount" value="${cri.amount }"></c:param>
	</c:if>
		<c:param name="keyword" value="${cri.keyword }"></c:param>
		<c:param name="type" value="${cri.type }" ></c:param>
</c:url>

<c:url value="/board/register" var="registerURL">
	<c:if test="${not empty cri.pageNum }">
		<c:param name="pageNum" value="${cri.pageNum }"></c:param>
	</c:if>
	<c:if test="${not empty cri.amount }">
		<c:param name="amount" value="${cri.amount }"></c:param>
	</c:if>
		<c:param name="keyword" value="${cri.keyword }"></c:param>
		<c:param name="type" value="${cri.type }" ></c:param>
</c:url>

<c:url value="/member/signUp" var="signUpURL">
	<c:if test="${not empty cri.pageNum }">
		<c:param name="pageNum" value="${cri.pageNum }"></c:param>
	</c:if>
	<c:if test="${not empty cri.amount }">
		<c:param name="amount" value="${cri.amount }"></c:param>
	</c:if>
		<c:param name="keyword" value="${cri.keyword }"></c:param>
		<c:param name="type" value="${cri.type }" ></c:param>
</c:url>

<c:url value="/member/info" var="memberInfoURL">
	<c:if test="${not empty cri.pageNum }">
		<c:param name="pageNum" value="${cri.pageNum }"></c:param>
	</c:if>
	<c:if test="${not empty cri.amount }">
		<c:param name="amount" value="${cri.amount }"></c:param>
	</c:if>
		<c:param name="keyword" value="${cri.keyword }"></c:param>
		<c:param name="type" value="${cri.type }" ></c:param>
</c:url>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="${appRoot }/board/list">Spring Board</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${listURL }"><i class="fas fa-list"></i>목록보기</a>
      </li>
      <sec:authorize access="isAuthenticated()">
	      <li class="nav-item">
	        <a class="nav-link" href="${registerURL }"><i class="fas fa-pen"></i>글쓰기</a>
	      </li>
      </sec:authorize>
      	
      <sec:authorize access="!isAuthenticated()">
      	<li class="nav-item">
      		<a class="nav-link" href="${signUpURL }"><i class="fas fa-user-plus"></i>회원가입</a>
      	</li>
      </sec:authorize>
      
      <sec:authorize access="isAuthenticated()">
      	<li class="nav-item">
      		<a class="nav-link" href="${memberInfoURL }"><i class="fas fa-user-cog"></i>내 정보</a>
      	</li>
      </sec:authorize>
    </ul>
  </div>
  <script type="text/javascript">
  	$(document).ready(function() {
  		var searchForm = $("#searchForm");
  		
  		$("#searchForm button").on("click", function(e) {
  			if(!searchForm.find("option:selected").val()){
  				alert("검색 종류를 선택하세요!");
  				return false;
  			}
  			if(!searchForm.find("input[name=keyword]").val()){
  				alert("키워드를 입력하세요!");
  				return false;
  			}
  		});
  	});
  </script>
  <sec:authorize access="!isAuthenticated()">
  	<a class="nav-link" href="${appRoot }/member/login"><i class="fas fa-user-check"></i>로그인</a>
  </sec:authorize>
  <sec:authorize access="isAuthenticated()">
	  <form action="${appRoot }/logout" method="post">
	  	<button class="btn btn-online-secondary">로그아웃</button>
	  </form>
  </sec:authorize>
  <form id="searchForm" action="${listURL }" method="get" class="form-inline">
  	<!-- <select onchange="this.form.submit()" name="amount" class="form-control mr-sm-2">
	  		<option value="10">10개씩</option>
	  		<option value="15">15개씩</option>
	  		<option value="20">20개씩</option>
	</select> -->
  	<select name="type" class="form-control mr-sm-2">
  		<option value="">--</option>
  		<option value="T" ${cri.type == "T" ? 'selected' : '' }>제목</option>
  		<option value="C" ${cri.type == "C" ? 'selected' : '' }>내용</option>
  		<option value="W" ${cri.type == "W" ? 'selected' : '' }>작성자</option>
  		<option value="TC" ${cri.type == "TC" ? 'selected' : '' }>제목 or 내용</option>
  		<option value="TW" ${cri.type == "TW" ? 'selected' : '' }>제목 or 작성자</option>
  		<option value="TWC" ${cri.type == "TWC" ? 'selected' : '' }>제목 or 내용 or 작성자</option>
  	</select>
  	<input name="keyword" value="${cri.keyword }" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
  	<input type="hidden" name="pageNum" value="1" />
  	<!-- <input type="hidden" name="amount" value="${cri.amount }" /> -->
  	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  </form>
</nav>

