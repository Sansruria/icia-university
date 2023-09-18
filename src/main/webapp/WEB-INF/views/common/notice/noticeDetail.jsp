<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학생 상세정보</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
        
	<script>
		document.addEventListener("DOMContentLoaded", function(){
			document.querySelector('.btn-cancle').addEventListener('click', ()=>cancle())
	        document.querySelector('.btn-update').addEventListener('click', ()=>update())
            document.querySelector('.btn-delete').addEventListener('click', ()=>del())
			document.querySelector('#gender').innerText = genderVal
	    })

		function cancle() {
			location.href='/common/notice'
		}

		function update() {
			const id = document.querySelector('#noticeId').value
			location.href = '/common/notice/update/' + id
		}

		function del() {
			const id = document.querySelector('#noticeId').value

			$.ajax({
				method : "DELETE",
				url : '/common/notice/api/delete/' + id

			}).done(function(res) {
				alert(res)
				location.href = '/common/notice'

			}).fail(function(res) {
				console.log(res)
			})
		}
	</script>
</head>

<body>

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="container d-flex justify-content-center">

		<div class="w-100">
			<div class="card">
				<div class="card-body">
					<div class="p-4">
						<form name="frm">
							<input type="hidden" id="noticeId" value="<c:out value="${noticeDto.noticeId}"></c:out>">

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">제목</span>
										<span class="w-75 border p-3"><c:out value="${noticeDto.title}"></c:out></span>
									</div>
								</div>
							</div>
							
							<div class="row mb-3">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">등록일자</span>
										<span class="w-75 border p-3"><c:out value="${noticeDto.createDate}"></c:out></span>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="card">
									<div class="card-body">
										<c:out value="${noticeDto.contents}"></c:out>
									</div>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>

			<div class="row mt-4">
				<div class="col">
					<button type="button" class="btn btn-secondary btn-cancle">목록으로</button>
				</div>
				<c:if test="${memberInfo.userId eq 'admin'}">
					<div class="col text-end">
						<button type="button" class="btn btn-danger btn-delete">삭제</button>
						<button type="button" class="btn btn-primary btn-update">수정</button>
					</div>
				</c:if>
			</div>
		</div>
	</div> <!-- end Container -->

    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>