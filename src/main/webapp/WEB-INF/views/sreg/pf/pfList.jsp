<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>교수목록</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
	    
    <script>
        document.addEventListener("DOMContentLoaded", function(){
            document.querySelector('.btn-save').addEventListener('click', ()=>location.href='/sreg/pf/write')
            document.querySelector('.btn-search').addEventListener('click', ()=>search())
            document.querySelector('.btn-reset').addEventListener('click', ()=>reset())
            document.querySelector('#paging').innerHTML = "${paging}";

            if ('${searchDto.pfId}' != null || '${searchDto.pfId}' != '') {
                document.searchFrm.querySelector('input[name="pfId"]').value = '${searchDto.pfId}'
            }

            if ('${searchDto.name}' != null || '${searchDto.name}' != '') {
                document.searchFrm.querySelector('input[name="name"]').value = '${searchDto.name}'
            }

            if ('${searchDto.deptName}' != null || '${searchDto.deptName}' != '') {
                document.searchFrm.querySelector('input[name="deptName"]').value = '${searchDto.deptName}'
            }

        })
        
        function search() {
            document.searchFrm.submit()
        }

        function selectedPage(pageNum) {
            document.searchFrm.querySelector('input[name="nowPage"]').value = pageNum
            search()
        }

        function prev() {
            document.searchFrm.querySelector('input[name="nowPage"]').value = '${searchDto.startPage - 1 }'
            search()
        }

        function next() {
            document.searchFrm.querySelector('input[name="nowPage"]').value = '${searchDto.endPage + 1 }'
            search()
        }

        function reset() {
            document.searchFrm.reset()
            search()
        }

        function detail(id) {
            location.href = '/sreg/pf/detail/' + id
        }

        function selChange() {
            const sel = document.getElementById('cntPerPage').value
            document.searchFrm.querySelector('input[name="cntPerPage"]').value = sel
            search()
        }
    </script>
</head>

<body>

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

<div class="container">
    <div class="row mb-3 mt-3">
        <h3>교수관리</h3>
    </div>

    <div class="row mb-3">
        <div class="card">
            <div class="card-body">
                <div class="row ">
                    <form name="searchFrm" action="/sreg/pf" method="GET">
                        <input type="hidden" name="nowPage" value="<c:out value="${searchDto.startPage}"></c:out>">
                        <input type="hidden" name="cntPerPage" value="<c:out value="${searchDto.cntPerPage}"></c:out>">

                        <div class="row">
                            <div class="col">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="pfId" name="pfId" placeholder="검색할 교수번호를 입력해주세요.">
                                    <label for="pfId">교수번호</label>
                                </div>
                            </div>

                            <div class="col">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="deptName" name="deptName" placeholder="검색할 학과명을 입력해주세요.">
                                    <label for="deptName">학과명</label>
                                </div>
                            </div>

                            <div class="col">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="검색할 교수명을 입력해주세요.">
                                    <label for="name">교수명</label>
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="mb-3">
                        <div class="col text-end">
                            <button type="button" class="btn btn-primary btn-search">검색</button>
                            <button type="button" class="btn btn-secondary btn-reset">초기화</button>
                        </div>
                    </div>
                </div> <!-- end row -->

            </div>
        </div>
    </div> <!-- end row -->

    <div class="row mb-2">
        <div class="col-2">
            <select id="cntPerPage" name="sel" onchange="selChange()" class="form-select">
                <option value="5"
                        <c:if test="${searchDto.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
                <option value="10"
                        <c:if test="${searchDto.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
                <option value="15"
                        <c:if test="${searchDto.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
                <option value="20"
                        <c:if test="${searchDto.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
            </select>
        </div>
        <div class="col text-end">
            <button type="button" class="btn btn-primary btn-save">등록</button>
        </div>
    </div>
    
    <div class="row mb-3">
        <div class="card">
            <div class="card-body">

                <div class="row">
                    <div class="table-responsive text-center">
                        <table class="table table-bordered table-hover">
                            <thead class="table-primary">
                                <tr>
                                    <th>번호</th>
                                    <th>학과명</th>
                                    <th>교수번호</th>
                                    <th>교수명</th>
                                    <th>성별</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="pf" items="${pfList}">
                                    <tr>
                                        <td><c:out value="${pf.rnum}"></c:out></td>
                                        <td><c:out value="${pf.deptName}"></c:out></td>
                                        <td><c:out value="${pf.pfId}"></c:out></td>
                                        <td>
                                            <a href="#" onclick="detail('<c:out value="${pf.pfId}"></c:out>')"
                                               class="link-offset-2 link-underline link-underline-opacity-0">
                                                <c:out value="${pf.name}"></c:out>
                                            </a>
                                        </td>
                                        <td><c:out value="${pf.gender}"></c:out></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- end row -->

    <div id="paging"></div>

</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

</body>
</html>