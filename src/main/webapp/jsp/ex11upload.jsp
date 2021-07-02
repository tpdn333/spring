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
		<form action="${appRoot }/upload/sub01" method="post" enctype="multipart/form-data">
			Name : <input name="fname" value="세우"/><br>
			File : <input type="file" name="img" accept="image/*"/><br>
			<input type="submit"/>
		</form>
		<hr>
		<form action="${appRoot }/upload/sub02" method="post" enctype="multipart/form-data">
			Name : <input name="fname" value="서영"/><br>
			File : <input type="file" name="file" accept="image/*"/><br>
			<input type="submit"/>
		</form>
	</div>
</body>
</html>