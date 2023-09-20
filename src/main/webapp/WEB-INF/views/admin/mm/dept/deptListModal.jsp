<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    // 페이징 태그 삽입
    document.querySelector('.paging-modal').innerHTML = "${paging}".replace(/\\/gi, '')

    let startPage = ${searchDto.startPage}
    let endPage = ${searchDto.endPage}
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
            startPage = searchDto['startPage']
            endPage   = searchDto['endPage']

            let makePagingModalHtml = res['makePagingHtml']
            makePagingModalHtml = makePagingModalHtml.replace(/\\/gi, ''); // 정규식을 이용해서 문자열에 포함된 모든 '\'를 삭제함
            document.querySelector('.paging-modal').innerHTML = makePagingModalHtml
            document.querySelector('#modal-body').innerHTML = res['makeListHtml']

        }).fail(function(res) {
            console.log(res)
        })
    }

    function selected(id, name) {
        $('#searchModal').modal('hide')
        document.querySelector('input[name="deptId"]').value = id
        document.querySelector('input[name="deptName"]').value = name
    }

    function prev() {
        document.searchFrmModal.querySelector('input[name="nowPageModal"]').value = startPage-1
        const nowPage = document.searchFrmModal.querySelector('input[name="nowPageModal"]').value
        searchAndPagingModal(nowPage)
    }

    function next() {
        document.searchFrmModal.querySelector('input[name="nowPageModal"]').value = endPage+1
        const nowPage = document.searchFrmModal.querySelector('input[name="nowPageModal"]').value
        searchAndPagingModal(nowPage)
    }
</script>

<div class="modal-header">
    <h1 class="modal-title fs-5" id="modalLabel">학과계열</h1>
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
                    <c:forEach var="dept" items="${deptListModal}">
                        <tr>
                            <td><c:out value="${dept.rnum}"></c:out></td>
                            <td><c:out value="${dept.deptId}"></c:out></td>
                            <td>
                                <a href="#" onclick="selected('${dept.deptId}', '${dept.deptName}')"
                                   style="coursor:pointer" class="link-offset-2 link-underline link-underline-opacity-0">
                                    <c:out value="${dept.deptName}"></c:out>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="paging-modal"></div>

</div>

<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
</div>