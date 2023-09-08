<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>양식</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
<style>
.guide_wrap {
    position: relative;
    border: 1px solid #fdebe1;
    background: #fff8f4;
    /* 가운데 정렬 스타일 추가 */
    margin: 0 auto;
    width: 80%; /* 가운데 정렬할 너비 조절 가능 */
}

/* 테이블 가운데 정렬 스타일 추가 */
.table-container {
    display: flex;
    justify-content: center;
}

table {
    border-collapse: collapse;
    width: 100%;
    border: 1px solid black;
}

th, td {
    border: 1px solid black;
    padding: 8px;
    text-align: center;
    
.btn-link button {
    background-color: navy;
    color: white;
    border: none;
    padding: 8px 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}

.btn-link button:hover {
    background-color: #001f3f; /* Darker shade when hovered */
}
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

<header>
</header>
    <h1>전과신청</h1>
    <!-- "guide_wrap"를 가운데 정렬하는 컨테이너 추가 -->
    <div class="table-container">
        <div class="guide_wrap">
            <p>전과신청 유의사항</p>
            <ul>
                <li class="first last">
                    <p>1.전과 신청및 전과 신청제한 : 학교홈페이지'전과모집요강'확인</p>
                    <p>2. 전출확인:학적-변동-전과신청에서 처리상태 확인</p>
                    <p>3.전형료 납부방법</p>
                </li>
            </ul>
        </div>
    </div>
    <br>
    <br>
    <!-- 테이블를 가운데 정렬하는 컨테이너 추가 -->
    <div class="table-container">
        <table>
            <tr>
                <th>신청구분</th>
                <th>신청기간</th>
                <th>2023년도2학기</th>
            </tr>
            <tr>
                <td>전과</td>
                <td>20223.11.01 - 2024.01.19</td>
                <td>
                    <a href="/sreg/stchangm/update" class="btn-link"><button type="button">신청하기</button></a>
                </td>
            </tr>
        </table>
    </div>
  <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>

</html>
