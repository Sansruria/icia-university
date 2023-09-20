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
		let genderVal = '<c:out value="${stDto.gender}"></c:out>'
		genderVal = (genderVal == '1') ? "남" : "여"
		let nationalVal = '<c:out value="${stDto.national}"></c:out>'

		document.addEventListener("DOMContentLoaded", function(){
			document.querySelector('.btn-cancle').addEventListener('click', ()=>cancle())
	        document.querySelector('.btn-update').addEventListener('click', ()=>update())
            document.querySelector('.btn-delete').addEventListener('click', ()=>del())
			document.querySelector('#gender').innerText = genderVal

			switch (nationalVal) {
				case "KR":
					nationalVal = "한국"
					break
				case "JP":
					nationalVal = "일본"
					break
				case "CN":
					nationalVal = "중국"
					break
				case "US":
					nationalVal = "미국"
					break
				case "UK":
					nationalVal = "영국"
					break
			}
			document.querySelector('#national').innerText = nationalVal
	    })

		function cancle() {
			location.href='/sreg/st'
		}

		function update() {
			const id = document.querySelector('#stId').value
			location.href = '/sreg/st/update/' + id
		}

		function del() {
			const id = document.querySelector('#stId').value

			$.ajax({
				method : "DELETE",
				url : '/sreg/st/api/delete/' + id

			}).done(function(res) {
				alert(res)
				location.href = '/sreg/st'

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
							<input type="hidden" id="stId" value="<c:out value="${stDto.stId}"></c:out>">

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">학과명</span>
										<span class="w-75 border p-3"><c:out value="${stDto.deptName}"></c:out></span>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">학번</span>
										<span class="w-75 border p-3"><c:out value="${stDto.stId}"></c:out></span>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">학생명</span>
										<span class="w-75 border p-3"><c:out value="${stDto.name}"></c:out></span>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">주민등록번호</span>
										<span class="w-75 border p-3"><c:out value="${stDto.rrn}"></c:out></span>
									</div>
								</div>
							</div>
							
                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">학년</span>
                                        <span class="w-75 border p-3"><c:out value="${stDto.grade}"></c:out>학년</span>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">학기</span>
                                        <span class="w-75 border p-3"><c:out value="${stDto.semester}"></c:out>학기</span>
                                    </div>
                                </div>
                            </div>

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">주소</span>
										<span class="w-75 border p-3"><c:out value="${stDto.address}"></c:out></span>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">이메일</span>
										<span class="w-75 border p-3"><c:out value="${stDto.email}"></c:out></span>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">성별</span>
										<span class="w-75 border p-3" id="gender"></span>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">국적</span>
										<span class="w-75 border p-3" id="national"></span>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">재학</span>
										<span class="w-75 border p-3"><c:out value="${stDto.status}"></c:out></span>
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