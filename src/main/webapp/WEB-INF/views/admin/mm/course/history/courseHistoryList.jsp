<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>양식</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>

    <script>
        document.addEventListener("DOMContentLoaded", function(){
            document.querySelector('.btn-save').addEventListener('click', ()=>location.href='/admin/mm/course/history/write')
        })
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
                                <div class="col-3">
                                    <div class="form-floating">
                                        <select class="form-select" id="courseDivision">
                                            <option selected>전체</option>
                                            <option value="1">전공필수</option>
                                            <option value="2">전공선택</option>
                                            <option value="3">교양</option>
                                        </select>
                                        <label for="courseDivision">이수구분</label>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="courseName" name="courseName" placeholder="검색할 과목명을 입력해주세요.">
                                        <label for="courseName">과목명</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="couserId" name="couserId" placeholder="검색할 학수번호를 입력해주세요.">
                                        <label for="couserId">학수번호</label>
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
                                        <input type="text" class="form-control" id="pfName" name="pfName" placeholder="검색할 교수명을 입력해주세요.">
                                        <label for="pfName">교수명</label>
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
                                <thead class="table-primary align-middle">
                                    <tr>
                                        <th>번호</th>
                                        <th>학수번호</th>
                                        <th>이수구분</th>
                                        <th>학과명</th>
                                        <th>과목명</th>
                                        <th>교수명</th>
                                        <th>수강기간</th>
                                        <th>수강최대<br/>신청인원</th>
                                    </tr>
                                </thead>

                                <tbody>
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