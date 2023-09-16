<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	document.querySelector('.btn-update').addEventListener('click', ()=>update())
	document.querySelector('.btn-delete').addEventListener('click', ()=>del())
	document.querySelector('.btn-search-update').addEventListener('click', ()=>openSearchModal(true))

	function update() {
		const obj = $('form[name="detailFrm"]').serializeObject()

		$.ajax({
			method : 'PATCH',
			url : '/admin/mm/faculty/api/update',
			data : obj

		}).done(function(res) {
			alert(res)
			location.href = '/admin/mm/faculty'

		}).fail(function(res) {
			console.log(res)
		})
	}

	function del() {
		const facultyId = document.detailFrm.querySelector('input[name="facultyId"]').value

		$.ajax({
			method : 'DELETE',
			url : '/admin/mm/faculty/api/delete/' + facultyId

		}).done(function(res) {
			alert(res)
			location.href = '/admin/mm/faculty'

		}).fail(function(res) {
			console.log(res)
		})
	}
</script>

<div class="modal-header">
	<h1 class="modal-title fs-5" id="detailModalLabel">학과계열</h1>
	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>

<div class="modal-body">
	<form name="detailFrm">
		<table class="table table-bordered">
			<tr>
				<th class="table-primary align-middle">학과계열번호</th>
				<td>
					<input type="text" name="deptLineId" id="updateDeptLineId" class="form-control" value="<c:out value="${facultyDto.deptLineId}"></c:out>" readonly>
				</td>
			</tr>
			<tr>
				<th class="table-primary align-middle">학과계열명</th>
				<td>
                    <div class="row">
                    	<div class="col">
                            <div class="input-group">
                                <input type="text" name="deptLineName" id="updateDeptLineName" class="form-control" value="<c:out value="${facultyDto.deptLineName}"></c:out>" readonly>
                            	<button type="button" class="btn btn-primary btn-search-update"
									data-bs-toggle="modal" data-bs-target="#searchModal">찾아보기</button>
                            </div>
                        </div>
                    </div>
				</td>
			</tr>
			<tr>
				<th class="table-primary align-middle">학부번호</th>
				<td>
					<input type="text" name="facultyId" class="form-control-plaintext" value="<c:out value="${facultyDto.facultyId}"></c:out>" readonly>
				</td>
			</tr>
			<tr>
				<th class="table-primary align-middle">학부명</th>
				<td>
					<input type="text" name="facultyName" class="form-control" value="<c:out value="${facultyDto.facultyName}"></c:out>">
				</td>
			</tr>
			<tr>
				<th class="table-primary align-middle">등록일</th>
				<td>
					<input type="text" name="createDate" class="form-control-plaintext" value="<c:out value="${facultyDto.createDate}"></c:out>" disabled>
				</td>
			</tr>
		</table>
	</form>
</div> <!-- ene modal-body -->

<div class="modal-footer">
	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	<button type="button" class="btn btn-danger btn-delete">삭제</button>
	<button type="button" class="btn btn-primary btn-update">수정</button>
</div>