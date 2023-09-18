<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강관리 페이지</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
<script src="/js/sjpark/coursehistory.js" type="text/javascript"></script>

<script>

// 	$(document).ready(function() {
// 		// "글쓰기" 버튼 클릭 시 수강내역 등록 페이지로 이동
// 		$('#registration').click(function() {
// 			window.location.href = '/admin/mm/courselist/write'; // 이동할 페이지의 URL을 설정합니다.
// 		});
// 	});

// 	function detail(id) {
// 		location.href = '/admin/mm/coursehistory/courseHistoryMMdetail/' + id
// 	}


 // '과목명' 클릭 시 실행할 함수
    function detail(id) {
        location.href = '/admin/mm/coursehistory/courseHistoryMMdetail/' + id;
    }

    // 검색 버튼 클릭 시 실행할 함수
        // 검색 기능을 수행하는 코드를 여기에 작성
        // 필터링, 서버 요청 등 검색 로직을 추가하세요.
        function search() {
    // 검색 조건 가져오기
    const courseName = document.getElementById('course_name').value;
    const courseDivision = document.getElementById('course_division').value;
    const deptName = document.getElementById('deptName').value;
    const pfName = document.getElementById('pfName').value;

    // AJAX 요청을 사용하여 서버에 검색 요청 전송
    // 서버에서 검색 결과를 받아와서 화면에 표시하는 코드를 작성하세요.
    // 예를 들어, jQuery를 사용한 AJAX 요청 예시는 아래와 같습니다.
    $.ajax({
        type: 'GET',
        url: '/admin/mm/courselist/search', // 검색을 처리할 서버 URL로 수정
        data: {
            course_name: courseName,
            course_division: courseDivision,
            deptName: deptName,
            pfName: pfName
        },
        success: function (response) {
            // 검색 결과를 화면에 표시하는 코드를 작성
            // response 변수에 서버에서 받아온 데이터가 들어옵니다.
        },
        error: function (error) {
            // 오류 처리
        }
    });
}
    }

    // DOMContentLoaded 이벤트 핸들러
    document.addEventListener("DOMContentLoaded", function() {
        // "글쓰기" 버튼 클릭 시 수강내역 등록 페이지로 이동
        $('#registration').click(function() {
            window.location.href = '/admin/mm/courselist/write';
        });

        // '과목명' 클릭 이벤트 리스너 등록
        const courseNameLinks = document.querySelectorAll('.course-name-link');
        courseNameLinks.forEach(function(link) {
            link.addEventListener('click', function(event) {
                event.preventDefault();
                const courseId = this.getAttribute('data-course-id');
                detail(courseId);
            });
        });

        // 검색 버튼 클릭 이벤트 리스너 등록
        document.querySelector('.btn-search').addEventListener('click', function() {
            search();
        });
    });
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="container">
		<div class="row mb-3">
			<div class="card">
				<div class="card-body">
					<div class="row ">
						<form name="searchFrm" action="/admin/mm/courselist/list" method="GET">

							<h3>수강내역관리 페이지</h3>
							<br>
							<div class="row g-3">
								<!-- 과목명 -->
								<div class="col-6">
									<label for="course_name" class="form-label">과목명</label> <input
										type="text" id="course_name" name="course_name" class="form-control">
								</div>
								<!-- 이수구분 -->
								<div class="col-6">
									<label for="course_division" class="form-label">이수구분</label>
									<input type="text" id="course_division" name="course_division" class="form-control">
								</div>
							</div>

							<div class="row g-3">
								<!-- 학과명 -->
								<div class="col-6">
									<label for="deptName" class="form-label">학과명</label> <input
										type="text" id="deptName" name="deptName" class="form-control">
								</div>
								<!-- 교수명 -->
								<div class="col-6">
									<label for="pfName" class="form-label">교수명</label> <input
										type="text" id="pfName" name="pfName" class="form-control">
								</div>
								<br>
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<button type="button" class="btn btn-primary btn-search" >🡼검색</button>
									<button type="button" class="btn btn-secondary btn-reset">초기화</button>
								</div>
							</div>
						</form>
					</div>
					<!-- end row -->

				</div>
			</div>
		</div>
		<!-- end row -->
		<br>
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
								<!-- 								<th>모집현황</th> -->
							</tr>
						</thead>
						<tbody id="table-body">
							<c:forEach var="courseh" items="${list}">
								<!-- jstl -->
								<tr>
									<td><c:out value="${courseh.rnum}"></c:out></td>
									<td><c:out value="${courseh.course_id}"></c:out></td>
									<td><c:out value="${courseh.course_division}"></c:out></td>
									<td><c:out value="${courseh.deptname}"></c:out></td>
									<td><a href="#"
										onclick="detail('<c:out value="${courseh.course_id}"></c:out>')">
											<c:out value="${courseh.course_name}"></c:out>
									</a> <!-- a태그 안에 감싸 --></td>
									<td><c:out value="${courseh.pf_name}"></c:out></td>
									<td><c:out value="${courseh.course_schedule}"></c:out></td>
									<td><c:out value="${courseh.limit_max_count}"></c:out></td>
									<%--<td><c:out value="${courseh.status}"></c:out></td> --%>
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