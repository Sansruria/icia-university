<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>교수 상세정보</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
        
	<script>
		<%--let genderVal = '<c:out value="${stDto.gender}"></c:out>'--%>
		<%--genderVal = (genderVal == '1') ? "남" : "여"--%>
		<%--let nationalVal = '<c:out value="${stDto.national}"></c:out>'--%>

		document.addEventListener("DOMContentLoaded", function(){
			document.querySelector('.btn-cancle').addEventListener('click', ()=>cancle())
			document.querySelector('.btn-update').addEventListener('click', ()=>update())
			document.querySelector('.btn-delete').addEventListener('click', ()=>del())
		})

		function cancle() {
			location.href='/admin/mm/course/history'
		}

		function update() {
			const id = document.querySelector('#courseId').value
			location.href = '/admin/mm/course/history/update/' + id
		}

		function del() {
			const id = document.querySelector('#courseId').value

			$.ajax({
				method : "DELETE",
				url : '/admin/mm/course/history/api/delete/' + id

			}).done(function(res) {
				alert(res)
				location.href = '/admin/mm/course/history'

			}).fail(function(res) {
				console.log(res)
			})
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
						<form name="frm">
							<input type="hidden" id="courseId" value="<c:out value="${courseHistoryDto.courseId}"></c:out>">
						</form>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">수강내역번호</span>
									<span class="w-75 border p-3"><c:out value="${courseHistoryDto.courseId}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">학과명</span>
									<span class="w-75 border p-3"><c:out value="${courseHistoryDto.deptName}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">교수명</span>
									<span class="w-75 border p-3"><c:out value="${courseHistoryDto.pfName}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">이수구분</span>
									<span class="w-75 border p-3">
										<c:if test="${courseHistoryDto.courseDivision eq 'MR'}">전공필수</c:if>
										<c:if test="${courseHistoryDto.courseDivision eq 'SM'}">전공선택</c:if>
										<c:if test="${courseHistoryDto.courseDivision eq 'CU'}">교양</c:if>
									</span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">수강명</span>
									<span class="w-75 border p-3"><c:out value="${courseHistoryDto.courseName}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">학년</span>
									<span class="w-75 border p-3"><c:out value="${courseHistoryDto.grade}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">학점</span>
									<span class="w-75 border p-3"><c:out value="${courseHistoryDto.credit}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">학기</span>
									<span class="w-75 border p-3"><c:out value="${courseHistoryDto.semester}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">요일</span>
									<span class="w-75 border p-3"><c:out value="${courseHistoryDto.courseDay}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">수강시간</span>
									<span class="w-75 border p-3">
										<c:out value="${courseHistoryDto.courseStartTime}"></c:out>~<c:out value="${courseHistoryDto.courseEndTime}"></c:out>
									</span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text p-3 w-50">수강신청최대인원</span>
									<span class="border p-3 w-50"><c:out value="${courseHistoryDto.limitMaxCount}"></c:out></span>
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