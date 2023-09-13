<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수강내역등록</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
    <script>
        document.addEventListener("DOMContentLoaded", function(){
            document.querySelector('.btn-cancle').addEventListener('click', ()=>cancle())
            document.querySelector('.btn-save').addEventListener('click', ()=>save())
            document.querySelector('.btn-search').addEventListener('click', ()=>openSearchModal())
        })

        function cancle() {
            location.href='/admin/mm/course/history'
        }

        function save() {
            let courseStartTime = document.frm.querySelectorAll('select[name="courseStartTime"]')
            courseStartTime = courseStartTime[0].value + ":" + courseStartTime[1].value

            let courseEndTime = document.frm.querySelectorAll('select[name="courseEndTime"]')
            courseEndTime = courseEndTime[0].value + ":" + courseEndTime[1].value

            let obj = $('form[name="frm"]').serializeObject()
            obj.courseStartTime = courseStartTime
            obj.courseEndTime = courseEndTime

            $.ajax({
                method : 'PUT',
                url : '/admin/mm/course/history/api/write',
                data : obj

            }).done(function(res) {
                alert(res)
                location.href = '/admin/mm/course/history'

            }).fail(function(res) {
                console.log(res)
            })
        }

        function openSearchModal() {
            $('.modal-content').load('/sreg/pf/modal/list')
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
                            <input type="hidden" name="pfId" readonly>
                            <input type="hidden" name="deptId" readonly>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">학과명</span>
                                        <input type="text" class="form-control" name="deptName" placeholder="교수선택시 자동으로 등록됩니다" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">교수명</span>
                                        <input type="text" class="form-control" name="pfName" readonly>
                                        <button type="button" class="btn btn-primary btn-search"
                                                data-bs-toggle="modal" data-bs-target="#searchModal">찾아보기</button>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3 justify-content-between">
                                        <span class="input-group-text w-25 p-3">이수구분</span>
                                        <div class="form-check form-check-inline p-3">
                                            <input class="form-check-input" type="radio" name="courseDivision" id="majorRequired" value="MR">
                                            <label class="form-check-label" for="majorRequired">전공필수</label>
                                        </div>
                                        <div class="form-check form-check-inline p-3">
                                            <input class="form-check-input" type="radio" name="courseDivision" id="selectMajor" value="SM">
                                            <label class="form-check-label" for="selectMajor">전공선택</label>
                                        </div>
                                        <div class="form-check form-check-inline p-3">
                                            <input class="form-check-input" type="radio" name="courseDivision" id="culture" value="CU">
                                            <label class="form-check-label" for="culture">교양</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">과목명</span>
                                        <input type="text" class="form-control" name="courseName">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text p-3">학년</span>
                                        <select name="grade" class="form-select">
                                            <option value="1">1학년</option>
                                            <option value="2">2학년</option>
                                            <option value="3">3학년</option>
                                            <option value="4">4학년</option>
                                        </select>
                                        <span class="input-group-text p-3">학기</span>
                                        <select name="semester" id="" class="form-select">
                                            <option value="1">1학기</option>
                                            <option value="2">2학기</option>
                                        </select>
                                        <span class="input-group-text p-3">학점</span>
                                        <input type="text" class="form-control" name="credit" value="3">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">요일</span>
                                        <select name="courseDay" class="form-select">
                                            <option value="월">월</option>
                                            <option value="화">화</option>
                                            <option value="수">수</option>
                                            <option value="목">목</option>
                                            <option value="금">금</option>
                                        </select>
                                        <span class="input-group-text p-3">수강최대신청인원</span>
                                        <input type="text" class="form-control" name="limitMaxCount">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">시작시간</span>
                                        <select name="courseStartTime" class="form-select">
                                            <option value="">-</option>
                                            <c:forEach var="hour" begin="1" end="23" step="1">
                                                <c:if test="${hour <= 9}">
                                                    <option value="0${hour}">0${hour}</option>
                                                </c:if>
                                                <c:if test="${hour > 9}">
                                                    <option value="${hour}">${hour}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                        <span class="input-group-text p-3">:</span>
                                        <select name="courseStartTime" class="form-select">
                                            <option value="">-</option>
                                            <option value="00">00</option>
                                            <option value="30">30</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">종료시간</span>
                                        <select name="courseEndTime" class="form-select">
                                            <option value="">-</option>
                                            <c:forEach var="hour" begin="1" end="23" step="1">
                                                <c:if test="${hour <= 9}">
                                                    <option value="0${hour}">0${hour}</option>
                                                </c:if>
                                                <c:if test="${hour > 9}">
                                                    <option value="${hour}">${hour}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                        <span class="input-group-text p-3">:</span>
                                        <select name="courseEndTime" class="form-select">
                                            <option value="">-</option>
                                            <option value="00">00</option>
                                            <option value="30">30</option>
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
                    <button type="button" class="btn btn-primary btn-save">등록</button>
                </div>
            </div>
        </div>
    </div> <!-- end Container -->

    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

    <!-- Search Modal -->
    <div class="modal fade" id="searchModal" data-bs-backdrop="static" data-bs-keyboard="false"
         tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>
    <!-- end Search Modal -->
</body>
</html>