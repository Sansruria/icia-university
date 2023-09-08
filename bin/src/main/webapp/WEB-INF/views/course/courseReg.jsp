<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="/js/hmlee/coursereg.js" type="text/javascript"></script>
<link rel="stylesheet" href="/css/hmlee/style.css">
</head>
<body>

	<!-- header -->
	<header> </header>

	<div class="container">
		<div class="con_wrap">
			<!-- 내용 -->
			<section>

				<div class="h3_box">
					<h3 class="title">수강신청</h3>

				</div>

				<div class="con_box" id="tilesContent"></div>


				<form id="baseForm" name="baseForm" method="post">
					<input type="hidden" name="currentPageNo" value="">
					<div class="search_form_wrap">
						<ul class="search_form dl2">
							<li class="first">
								<!-- 부서 선택에 대한 부분 -->
								<dl class="type2">
									<dt>
										<span class="search_title">학부</span>
										<!-- '부서 선택' 텍스트 -->
									</dt>
									<dd>
										<span class="cd"> <input type="hidden"
											id="COMBO_SYYLIST" class="gojworld"> <span
											class="select"> <select name="facultyId"
												id="facultySelect" class="{" required":true}" title="부서"
												maxlength="100">
													<option value="">Select</option>
													<!-- 여기에 서버에서 가져온 부서 목록 추가 -->
											</select>
										</span>
										</span>
									</dd>
								</dl> <!-- 학과 선택에 대한 부분 -->
								<dl class="type2">
									<dt>
										<span class="search_title">학과</span>
										<!-- '학과 선택' 텍스트 -->
									</dt>
									<dd>
										<span class="cd"> <input type="hidden" id="SCD343"
											class="gojworld"> <span class="select"> <select
												name="departmentId" id="departmentSelect" class="{ "
												required" : true}" title="학과" maxlength="100">
													<option value="">Select</option>
													<!-- 여기에 부서에 따라 변경되는 학과 목록 추가 -->
											</select>
										</span>
										</span>
									</dd>
								</dl>
							</li>
							<li class="btn_w last"><a href="#" class="btn01 col02"
								id="searchBtn"><span class="btn_ic01">SEARCH</span></a> <a
								href="#" class="btn01 col03" title="Reset"
								onclick="global.reset();"><span>Reset</span></a></li>
						</ul>
					</div>
					<div class="table_list_wrap">
						<div class="tab_top_wrap">
							<!-- <h4 class="f_left">수강신청내역</h4> -->
							<div class="m_list_view"></div>
						</div>
						<div class="table_wrap pc_view">
							<table class="table t_list">
								<!-- 열 넓이 조정 -->
								<colgroup>
									<col class="col_w70">
									<col class="col_w100">
									<col class="col_w200">
									<col class="col_w60">
									<col class="col_w60">
									<col class="col_w100">
									<col class="col_w90">
									<col class="col_w200">
									<col class="col_w80">
									<col class="col_w80">
								</colgroup>
								<thead>
									<tr class="first last">
										<th scope="col" class="first">수강신청</th>
										<th scope="col" class="first">학년/학기</th>

										<th scope="col" class="first">이수구분</th>
										<th scope="col">학수번호</th>
										<th scope="col">교과목명</th>
										<th scope="col">학점</th>
										<th scope="col">담당교수</th>
										<th scope="col">강의시간</th>
									</tr>
								</thead>
								<tbody>
									<tr class="first">
										<td data-mb="수강신청" class="last input_td"><a
											href="https://e-campus.khu.ac.kr"
											class="btn01 col07 viewTimtbInfoBtn" target="_blank">신청</a></td>
										<td data-mb="이수구분" class="first">1학년/1학기</td>

										<td data-mb="이수구분" class="first">전공필수</td>
										<td data-mb="학수번호분반">ICIA1111-11</td>
										<td data-mb="교과목명">Java프로그래밍</td>
										<td data-mb="학점">3</td>
										<td data-mb="담당교수">이형민</td>
										<td data-mb="강의시간강의실">차지헌 월10:30-11:45</td>
									</tr>
									<tr>
										<td data-mb="수강신청" class="last input_td"><a
											href="https://e-campus.khu.ac.kr"
											class="btn01 col07 viewTimtbInfoBtn" target="_blank">신청</a></td>
										<td data-mb="이수구분" class="first">1학년/1학기</td>

										<td data-mb="이수구분" class="first">전공필수</td>
										<td data-mb="학수번호분반">ICIA2222-22</td>
										<td data-mb="교과목명">Oracle DataBase</td>
										<td data-mb="학점">3</td>
										<td data-mb="담당교수">유예슬</td>
										<td data-mb="강의시간강의실">차지헌 화17:00-17:50</td>
									</tr>
									<tr>
										<td data-mb="수강신청" class="last input_td"><a
											href="https://e-campus.khu.ac.kr"
											class="btn01 col07 viewTimtbInfoBtn" target="_blank">신청</a></td>
										<td data-mb="이수구분" class="first">1학년/1학기</td>

										<td data-mb="이수구분" class="first">전공선택</td>
										<td data-mb="학수번호분반">ICIA3333-33</td>
										<td data-mb="교과목명">Java응용 JDBC</td>
										<td data-mb="학점">2</td>
										<td data-mb="담당교수">한영화</td>
										<td data-mb="강의시간강의실">차지헌 수13:30-14:45</td>
									</tr>
									<tr>
										<td data-mb="수강신청" class="last input_td"><a
											href="https://e-campus.khu.ac.kr"
											class="btn01 col07 viewTimtbInfoBtn" target="_blank">신청</a></td>
										<td data-mb="이수구분" class="first">1학년/1학기</td>

										<td data-mb="이수구분" class="first">전공선택</td>
										<td data-mb="학수번호분반">ICIA4444-44</td>
										<td data-mb="교과목명">웹퍼블리싱&amp;프론트엔드</td>
										<td data-mb="학점">2</td>
										<td data-mb="담당교수">민동규</td>
										<td data-mb="강의시간강의실">차지헌 목10:30-11:45</td>
									</tr>
									<tr>
										<td data-mb="수강신청" class="last input_td"><a
											href="https://e-campus.khu.ac.kr"
											class="btn01 col07 viewTimtbInfoBtn" target="_blank">신청</a></td>
										<td data-mb="이수구분" class="first">1학년/1학기</td>

										<td data-mb="이수구분" class="first">교양</td>
										<td data-mb="학수번호분반">ICIA5555-55</td>
										<td data-mb="교과목명">Servlet&amp;MVC를 응용한 SpringBoot</td>
										<td data-mb="학점">1</td>
										<td data-mb="담당교수">박하사</td>
										<td data-mb="강의시간강의실">차지헌 월13:30-14:45</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="user_data">
						<ul class="ul_list">
							<li class="first"><strong><b>과목수</b>&nbsp;</strong>:&nbsp;5</li>
							<li class="last"><strong><b>학점수</b>&nbsp;</strong>:&nbsp;11</li>
						</ul>
					</div>
					<div class="table_list_wrap">
						<div class="tab_top_wrap">
							<h4 class="f_left">수강신청현황</h4>
							<div class="m_list_view"></div>
						</div>
						<div class="table_wrap pc_view">
							<table class="table t_list">
								<caption>수강신청현황 정보 테이블입니다.</caption>
								<colgroup>
									<col class="col_w150">
									<col class="col_w200">
									<col class="col_w100">
									<col class="col_w120">
									<col class="col_w200">
									<col class="col_w90">
									<col class="col_w90">
								</colgroup>
								<thead>
									<tr class="first last">
										<th scope="col" class="first">수강취소</th>
										<th scope="col" class="first">학년/학기</th>

										<th scope="col" class="first">이수구분</th>
										<th scope="col">학수번호</th>
										<th scope="col">교과목명</th>
										<th scope="col">학점</th>
										<th scope="col">담당교수</th>
										<th scope="col">강의시간</th>
									</tr>
								</thead>
								<tbody>
									<tr class="first last">
										<td class="NO_RESULT first last" colspan="7">검색된 데이터가
											없습니다.</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<ul class="ul_list">
						<li class="first"><strong><b>과목수</b>&nbsp;</strong>:&nbsp;0</li>
						<li class="last"><strong><b>학점수</b>&nbsp;</strong>:&nbsp;0</li>
					</ul>
				</form>

			</section>
		</div>

	</div>

	<!-- footer -->
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</footer>

</body>
</html>