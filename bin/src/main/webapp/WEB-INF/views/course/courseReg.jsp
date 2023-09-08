<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청22</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
<script src="/js/hmlee/coursereg.js" type="text/javascript"></script>
<link rel="stylesheet" href="/css/hmlee/style.css">
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="container">
		<!-- 학부 드롭다운 -->
		<select name="facultyId" id="facultySelect"
			class="{ 'required':true }" title="Department" maxlength="100">
			<option value="">선택</option>
			<!-- 서버측에서 초기 채움 -->
		</select>

		<!-- 학과 드롭다운 -->
		<select name="departmentId" id="departmentSelect"
			class="{ 'required' : true}" title="Department" maxlength="100">
			<option value="">선택</option>
			<!-- JavaScript를 통해 동적으로 채움 -->
		</select>

		<!-- 검색 버튼 -->
		<a href="#" class="btn01 col02" id="searchBtn"><span
			class="btn_ic01">검색</span></a>
	</div>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>