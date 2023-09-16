<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강관리 페이지</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
<script src="/js/sjpark/coursehistory.js" type="text/javascript"></script>

<script>
	$(document).ready(function() {
		// "글쓰기" 버튼 클릭 시 수강내역 등록 페이지로 이동
		$('#registration').click(function() {
			window.location.href = '/admin/mm/courselist/write'; // 이동할 페이지의 URL을 설정합니다.
		});

	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="container">
		<h3>수강내역관리 페이지</h3>
		<div class="row g-3">
			<!-- 이수구분 -->
			<div class="col-3">
				<label for="inputIsugubun" class="form-label">이수구분</label> <select
					id="inputIsugubun" class="form-select form-select-sm">
					<option>-전체-</option>
					<option selected>전공필수</option>
					<option>전공선택</option>
					<option>교양</option>
				</select>
			</div>
			<div class="col-9">
				<label for="inputSubject" class="form-label">과목명</label> <input
					type="text" id="inputSubject" class="form-control">
			</div>
		</div>

		<div class="row g-3">
			<!-- 모집현황 -->
			<div class="col-3">
				<label for="inputRecruitmentStatus" class="form-label">모집현황</label>
				<select id="inputRecruitmentStatus"
					class="form-select form-select-sm">
					<option>-전체-</option>
					<option selected>모집마감</option>
					<option>모집중</option>
					<option>폐강</option>
				</select>
			</div>
			<div class="col-9">
				<label for="inputCourseNumber" class="form-label">학수번호</label> <input
					type="text" id="inputCourseNumber" class="form-control">
			</div>
		</div>

		<div class="row g-3">
			<!-- 학과명 -->
			<div class="col-6">
				<label for="inputDepartment" class="form-label">학과명</label> <input
					type="text" id="inputDepartment" class="form-control">
			</div>
			<!-- 교수명 -->
			<div class="col-6">
				<label for="inputProfessor" class="form-label">교수명</label> <input
					type="text" id="inputProfessor" class="form-control">
			</div>
		</div>

		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-primary me-md-2" type="submit">🡼검색</button>
		</div>

		<div class="row">
			<div class="col">
				<div class="table-responsive text-center">
					<table class="table table-bordered table-hover">
						<thead class="table-primary">
							<tr>
								<th>번호</th>
								<th>학수번호</th>
								<th>이수구분</th>
								<th>학과명</th>
								<th>과목명</th>
								<th>교수명</th>
								<th>수강기간</th>
								<th>수강최대신청인원</th>
								<th>모집현황</th>
							</tr>
						</thead>
						<tbody id="table-body">
							<c:forEach var="courseh" items="${list}">
								<!-- jstl -->
								<tr>
									<td><c:out value="${courseh.rnum}"></c:out></td>
									<td><c:out value="${courseh.course_id}"></c:out></td>
									<td><c:out value="${courseh.course_division}"></c:out></td>
									<td><c:out value="${courseh.deptName}"></c:out></td>
									<td><c:out value="${courseh.course_name}"></c:out></td>
									<td><c:out value="${courseh.pf_name}"></c:out></td>
									<td><c:out value="${courseh.course_schedule}"></c:out></td>
									<td><c:out value="${courseh.limit_max_count}"></c:out></td>
									<td><c:out value="${courseh.status}"></c:out></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button id="registration" class="btn btn-primary me-md-2"
				type="button">글쓰기</button>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>