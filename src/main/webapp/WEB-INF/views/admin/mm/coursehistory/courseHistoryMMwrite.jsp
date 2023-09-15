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

<script>
	
	$( document ).ready(function() {
		// 등록
		$('#btn-close').click(function() {
			location.href = '/admin/mm/courselist/list';//등록 취소버튼
		})
		//찾아보기 버튼
		$('.btn-search').click(function(){
// 			search();
			openSearchModal();
		})
// 		$('.btn-search').click(()=>search())
		//등록 버튼
		$('.btn-save').click(function(){
			save();
		})
	});
	
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
	
	function openSearchModal() {
		$('.modal-content').load('/admin/mm/dept/modal/list')
	}
	// 	등록	
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	<div class="container">
		<form name="frm" method="POST" action="/admin/mm/coursehistory/write">
			<div class="form-control"
				style="padding: 10px; font-size: 14px; width: 40%; margin: 0 auto; text-align: center;">
				<div class="col">
					<label for="inputSubject" class="form-label">학수번호</label> 
					<input type="text" id="inputSubject" name="course_id" class="form-control" value="<c:out value="${CourseHistoryMMDto.course_id}"></c:out>">
				</div>
				<div class="col">
					<label for="inputSubject" class="form-label">교수명</label> 
					<input type="text" id="inputSubject" name="pf_name" class="form-control" value="<c:out value="${CourseHistoryMMDto.pf_name}"></c:out>">
				</div>
				<div class="col">
					<label for="inputSubject" class="form-label">과목명</label> 
					<input type="text" id="inputSubject" name="course_name" class="form-control" value="<c:out value="${CourseHistoryMMDto.course_name}"></c:out>">
				</div>
				<div class="col mb-2">
					<label for="inputDepartment" class="form-label">학과명</label> 
					<input type="hidden" id="deptId" name="deptId" class="form-control" value="<c:out value="${stDto.deptId}"></c:out>"readonly>
					<input type="text" id="deptName" name="deptName" class="form-control" value="<c:out value="${stDto.deptName}"></c:out>"readonly>
				</div>
				<div class="col">
				<button type="button" class="btn btn-primary btn-search"
			                data-bs-toggle="modal" data-bs-target="#searchModal">찾아보기</button>
				</div>
				<div class="col">
					<label for="inputSubject" class="form-label">이수구분</label> 
					<input type="text" id="inputSubject" name="course_division" class="form-control" value="<c:out value="${CourseHistoryMMDto.course_division}"></c:out>">	
				</div>
				<div class="col">
					<label for="inputDepartment" class="form-label">수강시작기간</label> <input
						type="text" id="inputstartDepartment" name="course_start_period" class="form-control" value="<c:out value="${CourseHistoryMMDto.course_start_period}"></c:out>">
				</div>
				<div class="col">
					<label for="inputDepartment" class="form-label">수강종료기간</label> <input
						type="text" id="inputendDepartment" class="form-control" name="course_end_period" value="<c:out value="${CourseHistoryMMDto.course_end_period}"></c:out>">
				</div>
				<div class="col mb-3">
					<label for="inputDepartment" class="form-label">수강신청최대인원</label> <input
						type="text" id="inputDepartment" class="form-control" name="limit_max_count" value="<c:out value="${CourseHistoryMMDto.limit_max_count}"></c:out>">
				</div>
				<div class="row">
					<div class="col text-end">
						<button type="button" class="btn btn-secondary" id="btn-close">←취소</button>
	<!-- 					document.querySelector('.btn-close') // class 선택자 -->
	<!-- 					document.querySelector('#btn-close') // id 선택자 -->
	<!-- 					document.querySelector('input[name="name"]') // name 선택자  -->
	<!-- 					document.querySelector("input[name='name']") // name 선택자  -->
<!-- 						<button type="button" class="btn btn-primary btn-save">📖등록</button> -->
							<input type="submit" class="btn btn-primary btn-save" value="📖등록">
					</div>
				</div>
			</div>
			
		</form>
	</div>
	
	<!-- Search Modal -->
	<div class="modal fade" id="searchModal" data-bs-backdrop="static" data-bs-keyboard="false"
		 tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			</div>
		</div>
	</div>
	<!-- end Search Modal -->
	
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	
</body>
</html>