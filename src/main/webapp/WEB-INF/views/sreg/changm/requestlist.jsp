<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>