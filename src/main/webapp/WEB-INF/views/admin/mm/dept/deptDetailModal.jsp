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
            url : '/admin/mm/dept/api/update',
            data : obj

        }).done(function(res) {
            alert(res)
            location.href = '/admin/mm/dept'

        }).fail(function(res) {
            console.log(res)
        })
    }

    function del() {
        const deptId = document.detailFrm.querySelector('input[name="deptId"]').value

        $.ajax({
            method : 'DELETE',
            url : '/admin/mm/dept/api/delete/' + deptId

        }).done(function(res) {
            alert(res)
            location.href = '/admin/mm/dept'

        }).fail(function(res) {
            console.log(res)
        })
    }
</script>

<div class="modal-content">
    <div class="modal-header">
        <h1 class="modal-title fs-5" id="detailModalLabel">학과</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>

    <div class="modal-body">
        <form name="detailFrm">
            <table class="table table-bordered">
                <tr>
                    <th class="table-primary align-middle">학부번호</th>
                    <td>
                        <input type="text" name="facultyId" class="form-control" value="<c:out value="${deptDto.facultyId}"></c:out>" readonly>
                    </td>
                </tr>
                <tr>
                    <th class="table-primary align-middle">학부명</th>
                    <td>
                        <div class="row">
                            <div class="col">
                                <input type="text" name="facultyName" class="form-control" value="<c:out value="${deptDto.facultyName}"></c:out>" readonly>
                            </div>
                            <div class="col">
                                <button type="button" class="btn btn-primary btn-search-update"
                                        data-bs-toggle="modal" data-bs-target="#searchModal">찾아보기</button>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="table-primary align-middle">학과번호</th>
                    <td>
                        <input type="text" name="deptId" class="form-control-plaintext" value="<c:out value="${deptDto.deptId}"></c:out>" readonly>
                    </td>
                </tr>
                <tr>
                    <th class="table-primary align-middle">학과명</th>
                    <td>
                        <input type="text" name="deptName" class="form-control"
                            value="<c:out value="${deptDto.deptName}"></c:out>">
                    </td>
                </tr>
                <tr>
                    <th class="table-primary align-middle">등록일</th>
                    <td>
                        <input type="text" name="createDate" class="form-control-plaintext"
                               value="<c:out value="${deptDto.createDate}"></c:out>" disabled>
                    </td>
                </tr>
                <tr>
                    <th class="table-primary align-middle">운영상태</th>
                    <td>
                        <input type="radio" id="operating" name="status" class="" value="1"
                                <c:if test="${deptDto.status eq '1'}">checked</c:if>>
                        <label for="operating" class="form-label">운영</label>
                        <input type="radio" id="drop" name="status" class="" value="0"
                               <c:if test="${deptDto.status eq '0'}">checked</c:if>>
                        <label for="drop" class="form-label">폐지</label>
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
</div>