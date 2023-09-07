<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>교수수정</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
        
	<script>
		let rrnVal = '<c:out value="${pfDto.rrn}"></c:out>'
		rrnVal = rrnVal.split("-")
		const genderVal = '<c:out value="${pfDto.gender}"></c:out>'
		const nationalVal = '<c:out value="${pfDto.national}"></c:out>'

		document.addEventListener("DOMContentLoaded", function(){
			document.querySelector('.btn-cancle').addEventListener('click', ()=>cancle())
	        document.querySelector('.btn-update').addEventListener('click', ()=>update())
	        document.querySelector('.btn-search').addEventListener('click', ()=>search())
			document.querySelector('#frontRrn').value = rrnVal[0]
			document.querySelector('#backRrn').value = rrnVal[1]

			const genders = document.querySelectorAll('input[name="gender"]')
			genders.forEach(gender=>{
				if (gender.value == genderVal) {
					gender.checked = true
				}
			})

			let nationals = document.querySelector('select[name="national"]')
			nationals = nationals.options

			for (const option of nationals) {
				if (option.value == nationalVal) {
					option.selected = true
				}
			}
	    })

		function cancle() {
			const pfId = document.querySelector('input[name="pfId"]').value
			location.href='/sreg/pf/detail/' + pfId
		}
	     
	    function update() {
			let obj = $('form[name="frm"]').serializeObject()
			const rrn = document.querySelector('#frontRrn').value + "-" + document.querySelector('#backRrn').value
			obj.rrn = rrn
            console.log(obj)
            
            $.ajax({
                method : 'PATCH',
                url : '/sreg/pf/api/update',
                data : obj
                
            }).done(function(res) {
                alert(res)
                location.href = '/sreg/pf'
                
            }).fail(function(res) {
				console.log(res)
				console.log(res.responseJSON.trace)
                console.log(res.responseText)
            })
		}

		function search() {
			document.searchFrmModal.reset()

			$.ajax({
				method : "GET",
				url : '/admin/mm/dept/api/list'

			}).done(function(res) {
				let searchDto = res['searchDto'];
				document.searchFrmModal.querySelector('input[name="nowPageModal"]').value = searchDto['nowPage']
				document.searchFrmModal.querySelector('input[name="cntPerPageModal"]').value = searchDto['cntPerPage']

				let makePagingHtml = res['makePagingHtml']
				makePagingHtml = makePagingHtml.replace(/\\/gi, ''); // 정규식을 이용해서 문자열에 포함된 모든 '\'를 삭제함
				document.querySelector('#pagingModal').innerHTML = makePagingHtml
				document.querySelector('#modal-body').innerHTML = res['makeListHtml']

			}).fail(function(res) {
				console.log(res)
			})
		}
		   
		function selected(id, name) {
		    $('#searchModal').modal('hide')
	        document.frm.querySelector('input[name="deptId"]').value = id
	        document.frm.querySelector('input[name="deptName"]').value = name
		}

		function searchAndPagingModal(pageNum) {
			let obj = {}
			obj.nowPage = pageNum
			obj.cntPerPage = document.searchFrmModal.querySelector('input[name="cntPerPageModal"]').value
			obj.deptName = document.searchFrmModal.querySelector('input[name="deptNameModal"]').value

			$.ajax({
				method : "GET",
				url : '/admin/mm/dept/api/list',
				data : obj

			}).done(function(res) {
				let searchDto = res['searchDto'];
				document.searchFrmModal.querySelector('input[name="nowPageModal"]').value = searchDto['nowPage']
				document.searchFrmModal.querySelector('input[name="cntPerPageModal"]').value = searchDto['cntPerPage']

				let makePagingHtml = res['makePagingHtml']
				makePagingHtml = makePagingHtml.replace(/\\/gi, ''); // 정규식을 이용해서 문자열에 포함된 모든 '\'를 삭제함
				document.querySelector('#pagingModal').innerHTML = makePagingHtml
				document.querySelector('#modal-body').innerHTML = res['makeListHtml']

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
							<input type="hidden" name="pfId" value="<c:out value="${pfDto.pfId}"></c:out>">
							<input type="hidden" name="deptId" value="<c:out value="${pfDto.deptId}"></c:out>">
	
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">학과명</span>
										<input type="text" class="form-control" name="deptName" value="<c:out value="${pfDto.deptName}"></c:out>" readonly>
										<button type="button" class="btn btn-primary btn-search"
												data-bs-toggle="modal" data-bs-target="#searchModal">찾아보기</button>
									</div>
								</div>
							</div>
	
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">교수명</span>
										<input type="text" class="form-control" name="name" value="<c:out value="${pfDto.name}"></c:out>">
									</div>
								</div>
							</div>
	
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">주민등록번호</span>
										<input type="text" id="frontRrn" name="rrn" class="form-control" maxlength="6">
										<span class="input-group-text">-</span>
										<input type="text" id="backRrn" name="rrn" class="form-control" maxlength="7">
									</div>
								</div>
							</div>
	
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">주소</span>
										<input type="text" class="form-control" name="address" value="<c:out value="${pfDto.address}"></c:out>">
									</div>
								</div>
							</div>
	
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<span class="input-group-text w-25 p-3">이메일</span>
										<input type="text" class="form-control" name="email" value="<c:out value="${pfDto.email}"></c:out>">
									</div>
								</div>
							</div>
	
							<div class="row">
								<div class="col mb-3">
									<span class="input-group-text p-3">성별</span>
								</div>
								<div class="col mb-3 align-self-center">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="gender" id="male" value="1">
										<label class="form-check-label" for="male">남자</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="gender" id="female" value="0">
										<label class="form-check-label" for="female">여자</label>
									</div>
								</div>
							</div>
	
							<div class="row">
								<div class="col">
									<div class="input-group mb-3">
										<label class="input-group-text w-25 p-3" for="national">국적</label>
										<select class="form-select" name="national" id="national">
											<option value="KR">한국</option>
											<option value="JP">일본</option>
											<option value="US">미국</option>
											<option value="UK">영국</option>
											<option value="CN">중국</option>
										</select>
									</div>
								</div>
							</div>
	
						</form>
					</div>
				</div>
			</div>
	
			<div class="row mt-4 text-end">
				<div class="col">
					<button type="button" class="btn btn-secondary btn-cancle">취소</button>
					<button type="button" class="btn btn-primary btn-update">수정</button>
				</div>
			</div>
		</div>
	
	</div> <!-- end Container -->

	<!-- Search Modal -->
	<div class="modal fade" id="searchModal" data-bs-backdrop="static" data-bs-keyboard="false"
		 tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="searchModalLabel">학과계열</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<form name="searchFrmModal">
						<input type="hidden" name="nowPageModal" value="<c:out value="${searchDto.nowPage}"></c:out>">
						<input type="hidden" name="cntPerPageModal" value="<c:out value="${searchDto.cntPerPage}"></c:out>">
						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">학과명</span>
									<input type="text" class="form-control" name="deptNameModal" placeholder="검색할 학과명을 입력해주세요." oninput="searchAndPagingModal()">
								</div>
							</div>
						</div>
					</form>

					<div class="row">
						<div class="col">
							<table class="table table-bordered table-hover text-center">
								<thead class="table-primary">
								<th>번호</th>
								<th>학과번호</th>
								<th>학과명</th>
								</thead>
								<tbody id="modal-body">
								</tbody>
							</table>
						</div>
					</div>

					<div id="pagingModal"></div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn-close-searchModal" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end Search Modal -->
    
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>