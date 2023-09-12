<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학생관리</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>

    <script>
        document.addEventListener("DOMContentLoaded", function(){
            document.querySelector('.btn-save').addEventListener('click', ()=>location.href='/sreg/st/write')
            document.querySelector('.btn-search').addEventListener('click', ()=>search())
            document.querySelector('.btn-reset').addEventListener('click', ()=>reset())
            document.querySelector('#paging').innerHTML = "${paging}"

            if ('${searchDto.stId}' != null || '${searchDto.stId}' != '') {
                document.searchFrm.querySelector('input[name="stId"]').value = '${searchDto.stId}'
            }

            if ('${searchDto.name}' != null || '${searchDto.name}' != '') {
                document.searchFrm.querySelector('input[name="name"]').value = '${searchDto.name}'
            }

            if ('${searchDto.deptName}' != null || '${searchDto.deptName}' != '') {
                document.searchFrm.querySelector('input[name="deptName"]').value = '${searchDto.deptName}'
            }

            if ('${searchDto.status}' != null || '${searchDto.status}' != '') {
                document.searchFrm.querySelector('input[name="status"]').value = '${searchDto.status}'
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
            location.href = '/sreg/st/detail/' + id
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
    <div class="row mb-3">
        <div class="card">
            <div class="card-body">
            
                <div class="row ">
                    <form name="searchFrm" action="/sreg/st" method="GET">
                        <input type="hidden" name="nowPage" value="<c:out value="${searchDto.startPage}"></c:out>">
                        <input type="hidden" name="cntPerPage" value="<c:out value="${searchDto.cntPerPage}"></c:out>">

                        <div class="row">
                            <div class="col">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="status" name="status" placeholder="검색할 학적상태를 입력해주세요.">
                                    <label for="status">학적상태</label>
                                </div>
                            </div>

                            <div class="col">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="stId" name="stId" placeholder="검색할 학번을 입력해주세요.">
                                    <label for="stId">학번</label>
                                </div>
                            </div>

                            <div class="col">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="검색할 학생명을 입력해주세요.">
                                    <label for="name">학생명</label>
                                </div>
                            </div>

                            <div class="col">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="deptName" name="deptName" placeholder="검색할 학과를 입력해주세요.">
                                    <label for="deptName">학과</label>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col text-end">
                                <button type="button" class="btn btn-primary btn-search">검색</button>
                                <button type="button" class="btn btn-secondary btn-reset">초기화</button>
                            </div>
                        </div>
                    </form>
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
                                    <th>학번</th>
                                    <th>학생명</th>
                                    <th>성별</th>
                                    <th>학적상태</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="st" items="${stList}">
                                    <tr>
                                        <td><c:out value="${st.rnum}"></c:out></td>
                                        <td><c:out value="${st.deptName}"></c:out></td>
                                        <td><c:out value="${st.stId}"></c:out></td>
                                        <td>
                                            <a href="#" onclick="detail('<c:out value="${st.stId}"></c:out>')"
                                               class="link-offset-2 link-underline link-underline-opacity-0">
                                            <c:out value="${st.name}"></c:out></a>
                                        </td>
                                        <td><c:out value="${st.gender}"></c:out></td>
                                        <td><c:out value="${st.status}"></c:out></td>
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