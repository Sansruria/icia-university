<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강내역 등록</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
<script src="/js/sjpark/coursehistory.js" type="text/javascript"></script>

<script>
	$(document).ready(function() {
		// 등록
		$('#btn-close').click(function() {
			location.href = '/admin/mm/courselist/list';//등록 취소버튼
		})

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
		$('.btn-search').click(()=>search())
		//등록 버튼
		$('.btn-save').click(function() {
 			save(); //save란 메소드를 실행
 			fetchDataAndPopulateTable();
 	    });

	function openSearchModal() {
		$('.modal-content').load('/sreg/pf/modal/list')
	}

	// 	function submit() {
	// 		let obj = $('form[name="frm"]').serializeObject()
	// 		const course_time = document.querySelector('input[name="course_start_period"]').value
	// 		+ "~" + document.querySelector('input[name="course_end_period"]').value
	// 		obj.course_time = course_time
	//         console.log(obj)

	//         $.ajax({
	//             method : "Post",
	//             url : '/admin/mm/coursehistory/api/write',
	//             data : obj

	//         }).done(function(res) {//성공 했을떄
	//             alert(res)
	//             location.href = '/admin/mm/courselist/list'

	//         }).fail(function(res) {//실패 했을떄
	//             console.log(res)
	//         })
	// 	}
		});
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	
	<div class="container d-flex justify-content-center">

		<div class="w-50">
			<div class="card">
				<div class="card-body">
					<div class="p-4">
						<form name="frm" method="POST" action="/admin/mm/coursehistory/write">
							<input type="hidden" name="pfId" readonly>
							<input type="hidden" name="deptId" readonly>

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">학수번호</span>
										<input type="text" class="form-control" name="course_id">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">교수명</span>
										<input type="text" class="form-control" name="pfName" readonly>
										<button type="button" class="btn btn-primary btn-search"
												data-bs-toggle="modal" data-bs-target="#searchModal">찾아보기</button>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">학과명</span>
										<input type="text" class="form-control" name="deptName" readonly>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">이수구분</span>
										<input type="text" class="form-control" name="course_division">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">수강요일</span>
										<input type="text" class="form-control" name="course_day">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">수강시작기간</span>
										<input type="text" class="form-control" name="course_start_time">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">수강종료기간</span>
										<input type="text" class="form-control" name="course_end_time">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">학년</span>
										<input type="text" class="form-control" name="grade">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">학기</span>
										<input type="text" class="form-control" name="semester">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">학점</span>
										<input type="text" class="form-control" name="credit">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text p-3">수강신청최대인원</span>
										<input type="text" class="form-control" name="limit_max_count">
									</div>
								</div>
							</div>
							
							<div class="row">
					<div class="col text-end">
						<button type="button" class="btn btn-secondary" id="btn-close">←취소</button>
						<input type="submit" class="btn btn-primary btn-save" value="📖등록">
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