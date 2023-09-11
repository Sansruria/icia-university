<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="/css/ysyoo/style.css">
<head>
<meta charset="UTF-8">
<title>전과신청메인</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
 <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	<div id="head_bar">
		<div class="one">2023년도 2학기 전과신청</div>
		<div class="ttt">학과</div>
		<div class="ttt_1">${department_name}</div>
		<div class="ttt">성명</div>
		<div class="ttt_1">${st_name}</div>
		<div class="ttt">학번</div>
		<div class="ttt_1">${st_id}</div>
	</div>

	<!-- 선택한학부의 학과가 선택될수 있도록  테이블2개 join -->


	<p>신청목록</p>


	<div class=temp_bar>
		<table border="1" id="first_list">
			<tr class="tr" id="chk_append">


				<th>학부</th>
				<th><select name="facultyId" id="facultySelect">
						<option value="">선택</option>

						<c:forEach items="${facultyList}" var="f">
							<option value="${f.faculty_id}">${f.faculty_name}</option>
						</c:forEach>
				</select></th>




				<th>학과</th>
				<th><select name="departmentId" id="departmentSelect">
						<option value="">선택</option>
						<c:forEach items="${departmentList}" var="d">
							<option value="${d.department_id}">${d.department_name}</option>
						</c:forEach>
				</select></th>
				<td colspan="2"><input type="submit" value="목록담기"></td>
			</tr>


			<tr id="add_1" class="temp_1">

				<td class="deltd_1" colspan="6">조회된데이터없음</td>
			</tr>
		</table>
	</div>

	<p>신청내역</p>
	<div class=temp_bar2>
		<table border="1" id="last_list">
			<tr class="tr" id="chk_append">

				<th>과정</th>
				<th>학과(부)</th>
				<th>승인</th>
			</tr>
			<tr id="add_1" class="temp_2">
				<td class="deltd_1" colspan="2">조회된데이터없음</td>
				<td>0</td>
			</tr>

			<tr id="add_2" class="temp_3">
				<td class="deltd_2" colspan="2">조회된데이터없음</td>
				<td>0</td>
			</tr>

		</table>
	</div>

	<div class="mnext_btn">
		<a href="/stchangm/majorupdat/list" class="btn-link"><button
				type="button">신청하기</button></a>
	</div>

	
 <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>

</html>
