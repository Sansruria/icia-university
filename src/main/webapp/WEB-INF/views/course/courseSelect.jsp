<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청조회</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
<script src="/js/hmlee/courseselect.js" type="text/javascript"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col">
				<h3 class="text-center mb-4">
					<img alt="" src="/img/courseselect.png">
				</h3>
			</div>
		</div>

		<div class="row mb-3">
			<div class="card">
				<div class="card-body py-4">
					<div class="row mb-3">
						<div class="col-4">
							<div class="input-group">
								<span class="input-group-text p-3">학년</span> <select
									name="gradeId" id="gradeSelect" class="form-select">
									<option value="">선택</option>
									<c:forEach items="${gradeList}" var="grade">
										<option value="${grade}">${grade}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<!-- row end -->

					<div class="row">
						<div class="col-4">
							<div class="input-group">
								<span class="input-group-text p-3">학기</span> <select
									name="semesterId" id="semesterSelect" class="form-select">
									<option value="">선택</option>
									<option value="1학기">1학기</option>
									<option value="2학기">2학기</option>
								</select>
							</div>
						</div>

						<div class="col text-end mt-auto">
							<div id="alert-placeholder"></div>
							<button id="searchButton" type="button" class="btn text-white"
								style="background: #a9201d">SEARCH</button>
							<button id="resetButton" type="button"
								class="btn btn-secondary ms-2">초기화</button>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- end row -->

		<div class="row py-4">
			<div class="table-responsive text-center">
				<table class="table table-bordered align-middle">
					<thead class="table-primary">
						<tr>
							<th>학년/학기</th>
							<th>이수구분</th>
							<th>학수번호</th>
							<th>학점</th>
							<th>과목명</th>
							<th>교수명</th>
							<th>강의시간</th>
							<th>재수강</th>
						</tr>
					</thead>

					<tbody id="courseRegTableBody">
						<tr>
							<td colspan="8"><img src="/img/no.jpg"
								alt="No data available" style="width: 150px; height: 150px;">조회된
								데이터가 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- end row -->

		<div class="row border border-3 p-4">
			<div class="col-1"></div>
			<div class="col-auto" id="totalCourses"></div>
			<div class="col-1"></div>
			<div class="col-auto" id="totalCredits"></div>
		</div>

		<!-- end row -->
	</div>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>