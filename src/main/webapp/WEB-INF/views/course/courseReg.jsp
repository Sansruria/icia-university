<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
<script src="/js/hmlee/coursereg.js" type="text/javascript"></script>
<link rel="stylesheet" href="/css/hmlee/coursereg.css">
</head>

<body onload="initializeSession()">
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="container">
		<div class="con_wrap">
			<!-- 내용 -->
			<section>
				<!-- 페이지 타이틀  -->
				<div class="h3_box">
					<h3 class="title">수강신청</h3>
				</div>
				<!-- 페이지 타이틀 끝 -->
				<!-- 띄워주기 공백 부분 -->
				<div class="con_box" id="tilesContent"></div>
				<!-- 띄워주기 공백 부분 끝 -->


				<form id="baseForm" name="baseForm" method="post">


					<!-- 학부/학과로 필터링 해서 수강 목록 search -->
					<div class="searchForm">

						<ul class="searchForm2">

							<li class="first">
								<dl class="type1 ">
									<dt>
										<span class="search_title">학부</span>
									</dt>

									<dd>
										<span class="select_box"> <span class="select">
												<select name="facultyId" id="facultySelect">
													<option value="">선택</option>
													<c:forEach items="${facultyList}" var="faculty">
														<option value="${faculty.faculty_id}">${faculty.faculty_name}</option>
													</c:forEach>
											</select>
										</span>
										</span>
									</dd>
								</dl> <!-- 학과 드롭다운 --> <!-- 학부 선택시 비동기 처리로 학과 드롭다운 채우기 -->
								<dl class="type1">
									<dt>
										<span class="search_title">학과</span>
									</dt>

									<dd>
										<span class="select_box"> <span class="select">
												<select name="departmentId" id="departmentSelect">
													<option value="">선택</option>
													<c:forEach items="${departmentList}" var="department">
														<option value="${department.id}">${department.name}</option>
													</c:forEach>
											</select>
										</span>
										</span>
									</dd>
								</dl>

							</li>


							<!-- 검색 버튼과 초기화 버튼 -->
							<li class="search_resetBtn">
								<!-- 검색 버튼 -->
								<button id="searchButton" type="button">SEARCH</button>
								<button id="resetButton" type="button">초기화</button> <!-- 초기화 버튼 -->
							</li>
						</ul>
					</div>
					<!-- 학부/학과로 필터링 해서 수강 목록 search 끝 -->

					<!-- 필터링한 데이터를 출력시키는 리스트 -->
					<div class="table_list_wrap">
						<div class="tab_top_wrap">
							<!-- <h4 class="f_left">수강신청 상세</h4> -->
						</div>
						<div class="table_wrap pc_view">
							<table class="table t_list">
								<!-- 컬럼 너비 설정 -->
								<colgroup>
									<col class="col_w70">
									<col class="col_w100">
									<col class="col_w200">
									<col class="col_w60">
									<col class="col_w60">
									<col class="col_w100">
									<col class="col_w90">
									<col class="col_w200">
								</colgroup>
								<!-- 테이블 헤더 -->
								<thead>
									<tr class="first last">
										<th scope="col" class="first">선택</th>
										<th scope="col">학년/학기</th>
										<th scope="col">이수구분</th>
										<th scope="col">학수번호</th>
										<th scope="col">학점</th>
										<th scope="col">과목명</th>
										<th scope="col">교수명</th>
										<th scope="col" class="last"><b>강의시간</b></th>
									</tr>
								</thead>
								<!-- 테이블 바디 -->
								<tbody id="courseRegTableBody">

									<tr class="first last">
										<!-- 데이터가 없을 경우 출력 -->
										<td class="NO_RESULT first last" colspan="10">검색된 데이터가
											없습니다.</td>
										<!-- 실제 출력되는 데이터 리스트 영역   -->
										<!-- 이 부분은 JavaScript로 코드 구현해둠 coursereg.js파일 참고 -->
									</tr>
								</tbody>
							</table>
						</div>
					</div>


					<!-- 위에 부분까지 수정함~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->


					<div class="user_data">
						<ul class="ul_list">
							<li class="first"><strong><b>과목수</b>&nbsp;</strong>:&nbsp;</li>
							<li class="last"><strong><b>학점수</b>&nbsp;</strong>:&nbsp;</li>
						</ul>
					</div>


					<div class="table_list_wrap">
						<div class="tab_top_wrap">
							<div class="tab_top_wrap">
								<h4 class="f_left">수강신청현황</h4>
							</div>
						</div>
						<div class="table_wrap pc_view">
							<table class="table t_list">
								<!-- 컬럼 너비 설정 -->
								<colgroup>
									<col class="col_w70">
									<col class="col_w100">
									<col class="col_w200">
									<col class="col_w60">
									<col class="col_w60">
									<col class="col_w100">
									<col class="col_w90">
									<col class="col_w200">
								</colgroup>
								<!-- 테이블 헤더 -->
								<thead>
									<tr class="first last">
										<th scope="col" class="first">선택</th>
										<th scope="col">학년/학기</th>
										<th scope="col">이수구분</th>
										<th scope="col">학수번호</th>
										<th scope="col">학점</th>
										<th scope="col">과목명</th>
										<th scope="col">교수명</th>
										<th scope="col" class="last"><b>강의시간</b></th>
									</tr>
								</thead>
								<!-- 테이블 바디 -->
								<tbody id="courseRegStatusTableBody">

									<tr class="first last">
										<!-- 데이터가 없을 경우 출력 -->
										<td class="NO_RESULT first last" colspan="10">검색된 데이터가
											없습니다.</td>
										<!-- 실제 출력되는 데이터 리스트 영역   -->
										<!-- 이 부분은 JavaScript로 코드 구현해둠 coursereg.js파일 참고 -->
									</tr>
								</tbody>
							</table>
						</div>
					</div>


					<div class="user_data">
						<ul class="ul_list">
							<li class="first"><strong><b>과목수</b>&nbsp;</strong>:&nbsp;</li>
							<li class="last"><strong><b>학점수</b>&nbsp;</strong>:&nbsp;</li>
						</ul>
						<!-- 최종 수강신청 버튼 -->
					</div>
					<button id="courseRegisterButton" type="button">수강신청</button>

				</form>

			</section>
		</div>

	</div>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>