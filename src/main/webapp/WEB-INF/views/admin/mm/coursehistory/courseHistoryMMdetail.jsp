<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>양식</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
    <script>
		document.addEventListener("DOMContentLoaded", function(){
			document.querySelector('.btn-cancle').addEventListener('click', ()=>cancle())
			document.querySelector('.btn-update').addEventListener('click', ()=>update())
			document.querySelector('.btn-delete').addEventListener('click', ()=>del())
		})

		function cancle() {
			location.href='/admin/mm/courselist/list'
		}
		
		//경로는 감
		function update(){
			const id = document.querySelector('#coursehId').value 
			location.href = '/admin/mm/coursehistory/courseHistoryMMupdate/' + id
		}
		
		function del() {
			const id = document.querySelector("#coursehId").value
			location.href='/admin/mm/coursehistory/courseHistoryMMdelete/' + id
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
					<input type="hidden" id="coursehId" value="${detail.course_id}">

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">수강과목</span>
									<span class="w-75 border p-3"><c:out value="${detail.course_name}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">이수구분</span>
									<span class="w-75 border p-3"><c:out value="${detail.course_division}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">수강기간</span>
									<span class="w-75 border p-3"><c:out value="${detail.course_schedule}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">학과명</span>
									<span class="w-75 border p-3"><c:out value="${detail.deptname}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">학년</span>
									<span class="w-75 border p-3"><c:out value="${detail.grade}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">학기</span>
									<span class="w-75 border p-3"><c:out value="${detail.semester}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">교수이름</span>
									<span class="w-75 border p-3"><c:out value="${detail.pf_name}"></c:out></span>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<div class="row mt-4">
				<div class="col">
					<button type="button" class="btn btn-secondary btn-cancle">목록으로</button>
				</div>
				<div class="col text-end">
					<button type="button" class="btn btn-danger btn-delete">삭제</button>
					<button type="button" class="btn btn-primary btn-update">수정</button>
				</div>
			</div>
		</div>
	</div> <!-- end Container -->

    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>