<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>수강내역 수정</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
    <script>
	    document.addEventListener("DOMContentLoaded", function(){
		    document.querySelector('.btn-update').addEventListener('click', ()=>update())
		    document.querySelector('.btn-close').addEventListener('click', ()=>cancle())
	    })
    
   		function cancle() {
			location.href='/admin/mm/coursehistory/courseHistoryMMdetail'
		}
	    
    $(document).ready(function() {
		// 등록
// 		$('#BTN-CLOSE').CLICK(FUNCTION() {
// 			LOCATION.HREF = '/ADMIN/MM/COURSEHISTORY/COURSEHISTORYMMDETAIL';//등록 취소버튼
// 		})

		//찾아보기 버튼
		$('.btn-search').click(function() {
			// 			search();
			openSearchModal();
		})
		//교수찾기 버튼
		$('.pfModal').click(function() {
			// 			search();
			openpfModal();
		})
    })
		

	function openSearchModal() {
		$('.modal-content').load('/sreg/pf/modal/list')
	}
    </script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

    <div class="container d-flex justify-content-center">

		<div class="w-50">
			<div class="card">
				<div class="card-body">
					<div class="p-4">
						<form name="frm" method="Post" action="/admin/mm/coursehistory/courseHistoryMMupdate">
							<input type="hidden" name="pfId" value="${detail.pf_id }" readonly>
							<input type="hidden" name="deptId" value="${detail.deptId}" readonly>

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">학수번호</span>
										<input type="text" class="form-control" name="course_id" value="<c:out value="${detail.course_id}"></c:out>">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">교수명</span>
										<input type="text" class="form-control" name="pfName" value="<c:out value="${detail.pf_name}"></c:out>" readonly>
										<button type="button" class="btn btn-primary btn-search"
												data-bs-toggle="modal" data-bs-target="#searchModal">찾아보기</button>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">학과명</span>
										<input type="text" class="form-control" name="deptName" value="<c:out value="${detail.deptname}"></c:out>" readonly>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">과목명</span>
										<input type="text" class="form-control" name="course_name" value="<c:out value="${detail.course_name}"></c:out>">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">이수구분</span>
										<input type="text" class="form-control" name="course_division" value="<c:out value="${detail.course_division}"></c:out>">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">수강요일</span>
										<input type="text" class="form-control" name="course_day" value="<c:out value="${detail.course_day}"></c:out>">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">수강시작기간</span>
										<input type="text" class="form-control" name="course_start_time" value="<c:out value="${detail.course_start_time}"></c:out>">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">수강종료기간</span>
										<input type="text" class="form-control" name="course_end_time" value="<c:out value="${detail.course_end_time}"></c:out>">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">학년</span>
										<input type="text" class="form-control" name="grade" value="<c:out value="${detail.grade}"></c:out>">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">학기</span>
										<input type="text" class="form-control" name="semester" value="<c:out value="${detail.semester}"></c:out>">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">학점</span>
										<input type="text" class="form-control" name="credit" value="<c:out value="${detail.credit}"></c:out>">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text p-3">수강신청최대인원</span>
										<input type="text" class="form-control" name="limit_max_count" value="<c:out value="${detail.limit_max_count}"></c:out>">
									</div>
								</div>
							</div>
							
							<div class="row">
					<div class="col text-end">
						<button type="button" class="btn btn-secondary btn-close" id="btn-close">취소</button>
						<input type="submit" class="btn btn-primary btn-update" value="수정">
					</div>
				</div>
						</form>
					</div>
				</div>
			</div>
		</div>

    </div> <!-- end Container -->
    
    <!-- Search Modal -->
	<div class="modal fade" id="searchModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="searchModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	<!-- end Search Modal -->

    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>