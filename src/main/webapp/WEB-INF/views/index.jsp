<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>양식</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
<style>
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="container">
		<div class="mb-3">
			<form name="frm" method="POST" action="/file/upload" enctype="multipart/form-data">
				<label for="formFile" class="form-label">Default file input example</label>
				<input class="form-control" type="file" id="formFile" name="uploadFiles">
				<button type="submit">전송</button>
			</form>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>