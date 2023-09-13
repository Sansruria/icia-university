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
            document.querySelector('.btn-update').addEventListener('click', ()=>update())
            document.querySelector('.btn-search').addEventListener('click', ()=>openSearchModal())

            const courseStartTime = document.querySelectorAll('select[name="courseStartTime"]')
            const courseStartHour = courseStartTime[0]
            const courseStartMin = courseStartTime[1]

            const courseEndTime = document.querySelectorAll('select[name="courseEndTime"]')
            const courseEndHour = courseEndTime[0]
            const courseEndMin = courseEndTime[1]

            const dtoStartTime = '${courseHistoryDto.courseStartTime}'
            const dtoStartHour = dtoStartTime.slice(0, 2)
            const dtoStartMin = dtoStartTime.slice(3, 5)

            const dtoEndTime = '${courseHistoryDto.courseEndTime}'
            const dtoEndHour = dtoEndTime.slice(0, 2)
            const dtoEndMin = dtoEndTime.slice(3, 5)

            // 시작시
            for (const option of courseStartHour.options) {
                if (option.value == dtoStartHour) {
                    option.selected = true
                }
            }

            // 시작분
            for (const option of courseStartMin.options) {
                if (option.value == dtoStartMin) {
                    option.selected = true
                }
            }

            // 종료시
            for (const option of courseEndHour.options) {
                if (option.value == dtoEndHour) {
                    option.selected = true
                }
            }

            // 종료분
            for (const option of courseEndMin.options) {
                if (option.value == dtoEndMin) {
                    option.selected = true
                }
            }

        })

        function cancle() {
            const courseId = document.querySelector('input[name="courseId"]').value
            location.href='/admin/mm/course/history/detail/' + courseId
        }

        function update() {
            let courseStartTime = document.frm.querySelectorAll('select[name="courseStartTime"]')
            courseStartTime = courseStartTime[0].value + ":" + courseStartTime[1].value

            let courseEndTime = document.frm.querySelectorAll('select[name="courseEndTime"]')
            courseEndTime = courseEndTime[0].value + ":" + courseEndTime[1].value

            let obj = $('form[name="frm"]').serializeObject()
            obj.courseStartTime = courseStartTime
            obj.courseEndTime = courseEndTime

            $.ajax({
                method : 'PATCH',
                url : '/admin/mm/course/history/api/update',
                data : obj

            }).done(function(res) {
                alert(res)
                location.href = '/admin/mm/course/history'

            }).fail(function(res) {
                console.log(res.responseJSON.trace)
                console.log(res.responseText)
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
                            <input type="hidden" name="pfId" value="<c:out value="${courseHistoryDto.pfId}"></c:out>">
                            <input type="hidden" name="deptId" value="<c:out value="${courseHistoryDto.deptId}"></c:out>">
                            <input type="hidden" name="courseId" value="<c:out value="${courseHistoryDto.courseId}"></c:out>">

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">학과명</span>
                                        <input type="text" class="form-control" name="deptName" placeholder="교수선택시 자동으로 등록됩니다" value="<c:out value="${courseHistoryDto.deptName}"></c:out>" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">교수명</span>
                                        <input type="text" class="form-control" name="pfName" value="<c:out value="${courseHistoryDto.pfName}"></c:out>" readonly>
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
                                            <input class="form-check-input" type="radio" name="courseDivision" id="majorRequired" value="MR" <c:if test="${courseHistoryDto.courseDivision eq 'MR'}">checked</c:if>>
                                            <label class="form-check-label" for="majorRequired">전공필수</label>
                                        </div>
                                        <div class="form-check form-check-inline p-3">
                                            <input class="form-check-input" type="radio" name="courseDivision" id="selectMajor" value="SM" <c:if test="${courseHistoryDto.courseDivision eq 'SM'}">checked</c:if>>
                                            <label class="form-check-label" for="selectMajor">전공선택</label>
                                        </div>
                                        <div class="form-check form-check-inline p-3">
                                            <input class="form-check-input" type="radio" name="courseDivision" id="culture" value="CU" <c:if test="${courseHistoryDto.courseDivision eq 'CU'}">checked</c:if>>
                                            <label class="form-check-label" for="culture">교양</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">과목명</span>
                                        <input type="text" class="form-control" name="courseName" value="<c:out value="${courseHistoryDto.courseName}"></c:out>">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text p-3">학년</span>
                                        <select name="grade" class="form-select">
                                            <option value="1" <c:if test="${courseHistoryDto.grade eq '1'}">selected</c:if>>1학년</option>
                                            <option value="2" <c:if test="${courseHistoryDto.grade eq '2'}">selected</c:if>>2학년</option>
                                            <option value="3" <c:if test="${courseHistoryDto.grade eq '3'}">selected</c:if>>3학년</option>
                                            <option value="4" <c:if test="${courseHistoryDto.grade eq '4'}">selected</c:if>>4학년</option>
                                        </select>
                                        <span class="input-group-text p-3">학기</span>
                                        <select name="semester" id="" class="form-select">
                                            <option value="1" <c:if test="${courseHistoryDto.semester eq '1'}">selected</c:if>>1학기</option>
                                            <option value="2" <c:if test="${courseHistoryDto.semester eq '2'}">selected</c:if>>2학기</option>
                                        </select>
                                        <span class="input-group-text p-3">학점</span>
                                        <input type="text" class="form-control" name="credit" value="<c:out value="${courseHistoryDto.credit}"></c:out>">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text w-25 p-3">요일</span>
                                        <select name="courseDay" class="form-select">
                                            <option value="월" <c:if test="${courseHistoryDto.courseDay eq '월'}">selected</c:if>>월</option>
                                            <option value="화" <c:if test="${courseHistoryDto.courseDay eq '화'}">selected</c:if>>화</option>
                                            <option value="수" <c:if test="${courseHistoryDto.courseDay eq '수'}">selected</c:if>>수</option>
                                            <option value="목" <c:if test="${courseHistoryDto.courseDay eq '목'}">selected</c:if>>목</option>
                                            <option value="금" <c:if test="${courseHistoryDto.courseDay eq '금'}">selected</c:if>>금</option>
                                        </select>
                                        <span class="input-group-text p-3">수강최대신청인원</span>
                                        <input type="text" class="form-control" name="limitMaxCount" value="<c:out value="${courseHistoryDto.limitMaxCount}"></c:out>">
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
                    <button type="button" class="btn btn-primary btn-update">수정</button>
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