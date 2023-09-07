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

						<div class="row mb-3 align-items-center">
    					   <div class="col">학적상태</div>
	   					   <div class="col"><input type="text" name="status" class="form-control"></div>
    					   <div class="col">학번</div>
	   					   <div class="col"><input type="text" name="stId" class="form-control"></div>
						</div>
						
						<div class="row mb-3 align-items-center">
    					   <div class="col">학생명</div>
	   					   <div class="col"><input type="text" name="name" class="form-control"></div>
    					   <div class="col">학과</div>
	   					   <div class="col"><input type="text" name="deptName" class="form-control"></div>
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
                
                <div class="row text-center">
                    <div class="col">번호</div>
                    <div class="col">학과명</div>
                    <div class="col">학번</div>
                    <div class="col">학생명</div>
                    <div class="col">성별</div>
                    <div class="col">학적상태</div>
                </div> <!-- end row -->
                
                <c:forEach var="st" items="${stList}">
	                <div class="row text-center" onclick="detail('<c:out value="${st.stId}"></c:out>')" style="cursor:pointer">
	                    <div class="col"><c:out value="${st.rnum}"></c:out></div>
	                    <div class="col"><c:out value="${st.deptName}"></c:out></div>
	                    <div class="col"><c:out value="${st.stId}"></c:out></div>
	                    <div class="col"><c:out value="${st.name}"></c:out></div>
	                    <div class="col"><c:out value="${st.gender}"></c:out></div>
	                    <div class="col"><c:out value="${st.status}"></c:out></div>
	                </div>
                </c:forEach>
                
            </div>
        </div>
    </div> <!-- end row -->

    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">

            <c:if test="${searchDto.startPage != 1}">
                <li class="page-item">
                    <a class="page-link" href="#" onclick="prev()" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>


            <c:forEach begin="${searchDto.startPage }" end="${searchDto.endPage }" var="p">
                <c:choose>
                    <c:when test="${p == searchDto.nowPage }">
                        <li class="page-item disabled"><a class="page-link" href="#">${p}</a></li>
                    </c:when>

                    <c:when test="${p != searchDto.nowPage }">
                        <li class="page-item"><a class="page-link" href="#" onclick="selectedPage('${p}')">${p}</a></li>
                    </c:when>
                </c:choose>
            </c:forEach>


            <c:if test="${searchDto.endPage != searchDto.lastPage}">
                <li class="page-item">
                    <a class="page-link" href="#" onclick="next()" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

</body>
</html>