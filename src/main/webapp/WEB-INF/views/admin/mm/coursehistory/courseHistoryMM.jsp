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

 	$(document).ready(function() {
 		document.querySelector('.btn-search').addEventListener('click', ()=>search())
 		document.querySelector('.btn-reset').addEventListener('click', ()=>reset())
 		document.querySelector('#paging').innerHTML = "${paging}";
 		// "글쓰기" 버튼 클릭 시 수강내역 등록 페이지로 이동
 		$('#registration').click(function() {
 			window.location.href = '/admin/mm/courselist/write'; // 이동할 페이지의 URL을 설정합니다.
 		});
 		
 	});

 	function detail(id) {
 		location.href = '/admin/mm/coursehistory/courseHistoryMMdetail/' + id 
	}
 	//검색기능
 	function search() {
        document.searchFrm.submit()
    }
 	//검색기능 초기화
 	function reset() {
        document.searchFrm.reset()
        search()
    }
 	
 	function selectedPage(pageNum) {
        document.searchFrm.querySelector('input[name="nowPage"]').value = pageNum
        search()
    }

    function prev() {
        document.searchFrm.querySelector('input[name="nowPage"]').value = '${searchDto.startPage - 1 }'
        search()
    }

    function next() {
        document.searchFrm.querySelector('input[name="nowPage"]').value = '${searchDto.endPage + 1 }'
        search()
    }
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="container">
		<div class="row mb-3 mt-3">
		  <h3>수강내역관리</h3>
		</div>
	
		<div class="row mb-3">
			<div class="card">
				<div class="card-body">
					<div class="row ">
						<form name="searchFrm" action="/admin/mm/courselist/list" method="GET">
 							<input type="hidden" name="nowPage" value="<c:out value="${searchDto.startPage}"></c:out>">
                        	<input type="hidden" name="cntPerPage" value="<c:out value="${searchDto.cntPerPage}"></c:out>">
                        	
                        	<div class="row">
                        	    <!-- 과목명 -->
								<div class="col">
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="course_name" name="course_name" placeholder="검색할 과목명을를 입력해주세요.">
										<label for="course_name">과목명</label>
									</div>
								</div>
								
								<!-- 이수구분 -->
								<div class="col">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="course_division" name="course_division" placeholder="검색할 과목명을를 입력해주세요.">
                                        <label for="course_division">이수구분</label>
                                    </div>
                                </div>
                                
                                <!-- 학과명 -->
                                <div class="col">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="deptName" name="deptName" placeholder="검색할 과목명을를 입력해주세요.">
                                        <label for="deptName">학과명</label>
                                    </div>
                                </div>
                                
                                <!-- 교수명 -->
                                <div class="col">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="pfName" name="pfName" placeholder="검색할 과목명을를 입력해주세요.">
                                        <label for="pfName">교수명</label>
                                    </div>
                                </div>
                        	</div>

							<div class="row g-3">
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<button type="button" class="btn btn-primary btn-search" >검색</button>
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
		<div id="paging"></div>
	</div>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>