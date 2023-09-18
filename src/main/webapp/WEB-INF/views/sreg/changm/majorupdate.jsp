<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>전과신청메인</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
<script defer src="/js/ysyoo/changmajor.js" type="text/javascript"></script>
<script type="text/javascript">



function updateTable(departmentLineId, facultyId) {
	$.ajax({
		url: "/sreg/changmajor/rest/getdepart",
		type: "GET",
		data:{ 
			departmentLineId: departmentLineId,
			facultyId: facultyId
		},
		success: function(data) {
			// 테이블 갱신 로직
			let tableBody = $("#st_data_changmajor"); 
			tableBody.empty();

			$.each(data, function(indexl, row) {
				let newRow = $("<tr>");
				console.log(row);
				newRow.append("<td>" + "${memberInfo.grade}학년"+"/"+"${memberInfo.semester}학기" + "</td>");
				newRow.append("<td>" + row.department_line_name + "</td>");
				newRow.append("<td>" + row.faculty_name + "</td>");
				newRow.append("<td>" + row.department_name + "</td>");
				newRow.append("<td><button class='applyButton' type='button'>신청</button></td>");
				tableBody.append(newRow);
			});
		},
		error: function(error) {
			console.error("데이터를 불러오지 못했습니다.", error);
		}
	});
}
</script>
</head>


<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="row" style="background: #094a9a">
		<div class="col text-white text-center fs-3 p-4">2023년도 2학기 전과신청</div>
	</div>
	<div class="container">

		<div class="row">
			<div class="col">
				<div class="input-group py-3">
					<span class="input-group-text p-3">이름</span> <input
						class="form-control" type="text"
						value="<c:out value="${memberInfo.name}"></c:out>" readonly>
					<span class="input-group-text p-3">학번</span> <input
						class="form-control" type="text"
						value="<c:out value="${memberInfo.userId}"></c:out>" readonly>

					<span class="input-group-text p-3">학과</span> <input
						class="form-control" type="text"
						value="<c:out value="${memberInfo.deptName}"></c:out>" readonly>

				</div>
			</div>
		</div>

		<div class="row mb-3">
			<div class="col">
				<div class="input-group">
					<span class="input-group-text p-3 w-25">학과계열</span> <select
						name="departmentLineId" id="departmentLineSelect"
						class="form-select">
						<option value="">선택</option>
						<c:forEach items="${departmentLineList}" var="department_line">
							<option value="${department_line.department_line_id}">${department_line.department_line_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="col">
				<div class="input-group">
					<span class="input-group-text p-3 w-25">학부</span> <select
						name="facultyId" id="facultySelect" class="form-select">
						<option value="">선택</option>
						<c:forEach items="${facultyList}" var="f">
							<option value="${f.faculty_id}">${f.faculty_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="col d-flex align-items-center">
				<input type="submit" id="searchButton" class="btn btn-primary"
					value="목록담기">
			</div>
		</div>
		<!-- row end -->

		<div class="row">
			<div class="col mb-2 fs-3">신청목록</div>
		</div>

		<div class="row mb-3">
			<div class="card">
				<div class="card-body py-4">
					<div class="row">
						<div class="table-responsive text-center">
							<table class="table table-bordered align-middle">
								<thead class="table-primary">
									<tr>
										<th>학년/학기</th>
										<th>학과계열</th>
										<th>학부</th>
										<th>학과</th>
										<th>선택</th>
									</tr>
								</thead>

								<tbody id="st_data_changmajor">
									<tr>
										<td colspan="5">조회된 내역이 없습니다.</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="row">
			<div class="col mb-2 fs-3">신청내역</div>
		</div>
		<div class="row">
			<div class="card">
				<div class="card-body py-4">
				<form method="POST" action="/sreg/requestlist">
					<div class="row">
						<div class="table-responsive text-center">
							<table id="apply_table" class="table table-bordered align-middle">
								<thead class="table-primary">
									<tr>
										<th>학년/학기</th>
										<th>학과계열</th>
										<th>학부</th>
										<th>학과</th>
										<th>선택</th>
									</tr>
								</thead>
								<tbody>
								
									<tr>
										<td colspan="5">조회된 내역이 없습니다.</td>
									</tr>
								</tbody>
								
							</table>
						</div>
					</div>
					<div class="row text-end">
						<button type="submit" class="btn btn-primary">신청하기</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>

</html>
