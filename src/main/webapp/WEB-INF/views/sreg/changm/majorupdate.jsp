<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>전과신청메인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/css/ysyoo/style.css">
    <script defer src="/js/ysyoo/changmajor.js" type="text/javascript"></script>
    
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
    <div id="head_bar">
        <div class="one">2023년도 2학기 전과신청</div>
        <div class="ttt">이름</div>
        <div class="ttt_1">${memberInfo.name}</div>
        <div class="ttt">학번</div>
        <div class="ttt_1">${memberInfo.userId}</div>
        <div class="ttt">학과</div>
        <div class="ttt_1">${memberInfo.deptName}</div>
    </div>
   
    <table border="1" id="first_list">
        <tr class="tr" id="chk_append">
            <th>학과계열</th>
            <th>
                <select name="departmentLineId" id="departmentLineSelect">
                    <option value="">선택</option>
                    <c:forEach items="${departmentLineList}" var="department_line">
                        <option value="${department_line.department_line_id}">${department_line.department_line_name}</option>
                    </c:forEach>
                </select>
            </th>
            <th>학부</th>
            <th>
                <select name="facultyId" id="facultySelect">
                    <option value="">선택</option>
                    <c:forEach items="${facultyList}" var="f">
                        <option value="${f.faculty_id}">${f.faculty_name}</option>
                    </c:forEach>
                </select>
            </th>
            <class id="changMajorTableBody">
            <th colspan="2">
                <input type="button" id="searchButton" value="목록담기">
            </th>
        </tr>
        <colgroup>
            <col class="col_w60">
            <col class="col_w60">
            <col class="col_w100">
            <col class="col_w70">
        </colgroup>
        <!-- 테이블 헤더 -->
        <thead>
            <tr class="first last">
                <th scope="col">학년/학기</th>
                <th scope="col">학과계열</th>
                <th scope="col">학과</th>
                <th scope="col">선택</th>
            </tr>
        </thead>
        <!-- js파일 table append에 조회된 데이터 삽입-->
        <tr id="add_1" class="temp_1">
            <td class="deltd_1" colspan="4">조회된 데이터 없음</td>
        </tr>
    </table>
    
    <div class="temp_bar2">
        <table border="1" id="last_list">
            <tr class="tr" id="chk_append">
                <th>과정</th>
                <th>학과(부)</th>
                <th>승인</th>
            </tr>
            <tr id="add_1" class="temp_2">
                <td class="deltd_1" colspan="2">조회된 데이터 없음</td>
                <td>0</td>
            </tr>
            <tr id="add_2" class="temp_3">
                <td class="deltd_2" colspan="2">조회된 데이터 없음</td>
                <td>0</td>
            </tr>
        </table>
    </div>
<!--     <div class="mnext_btn"> -->
<!--         <a href="/stchangm/majorupdat/list" class="btn-link"> -->
<!--             <button type="button">신청하기</button> -->
        </a>
    </div>
    
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>
