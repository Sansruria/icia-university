<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>양식</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
<style>
.tl {
	text-align: center;
}

.a1 {
	height: 40px;
	font-size: 20px;
}

.a2 {
	height: 40px;
	font-size: 20px;
}

.a3 {
	height: 40px;
	font-size: 20px;
}

.a4 {
	height: 40px;
	font-size: 20px;
}

.type12 {
	width: 888px; /* 상자의 너비 */
	height: 200px; /* 상자의 높이 */
	border: 1px solid #000; /* 테두리 스타일, 너비, 색상 지정 */
	padding: 30px; /* 내용과 테두리 사이 여백 */
}

.first {
	list-style: none;
}

.sg {
	width: 300px;
	height: 25px;
	border-color:#E6E6E6
}

.ss {
	height: 30px;
	border-color:#D8D8D8
}
.table-divider {
	border-top:1px solid #ccc;
}
.tdtd{
	border-top:1px solid 
}
.mb {
	position: absolute;
	height: 50px;
	width: 100px;
	font-size: 20px;
	left: 1070px;
	top: 310px;
	background-color: #e7e7e7;
	 border:#ffffff
}

.mb2 {
	position: absolute;
	height: 35px;
	width: 55px;
	left: 1550px;
	top: 590px;
	background-color: #e7e7e7;
	 border:#ffffff
}

.table_wrap {
	border-top: 1px solid #666666;
	border-bottom: 1px solid #666666;
	overflow-y: auto;
}

.pag {
	text-align: center;
}

.table_list_wrap {
	display: block;
	text-align: center;
}

.table_wrap table {
	width: 100%;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	<div class="container">
		<h2 class=tl>자퇴목록조회</h2><br>
		<div class="search_form_wrap">
			<li class="first">
				<dl class="type12">
					<dt>
						<div class=a1>
							<span class="search_date">신청일자</span> <input type="date"
								id="date" max="2025-09-05" min="2022-09-05" value="2023-09-20"><br>
						</div>
						<div class=a2>
							<span class="search_class">학년</span> <select name="searchType"
								id="searchType" class=ss onchange>
								<option value="0001" selected>1학년</option>
								<option value="0002" selected>2학년</option>
								<option value="0003" selected>3학년</option>
								<option value="0004" selected>학년선택</option>
							</select> &nbsp; <span class="search_class">학과</span> <select
								name="searchType" id="searchType" class=ss onchange>
								<option value="0001" selected>실내디자인과</option>
								<option value="0002" selected>정보통신과</option>
								<option value="0003" selected>컴퓨터공학과</option>
								<option value="0004" selected>토목과</option>
								<option value="0005" selected>건축과</option>
								<option value="0006" selected>학과선택</option>
							</select><br>
						</div>
						<div class=a3>
							<span class="search_pf">교수</span> <select name="searchType"
								id="searchType" class=ss onchange>
								<option value="0001" selected>박실내</option>
								<option value="0002" selected>김승경</option>
								<option value="0003" selected>이공학</option>
								<option value="0004" selected>박토목</option>
								<option value="0005" selected>최건축</option>
								<option value="0006" selected>교수선택</option>
							</select> &nbsp; <span class="search_ok">승인</span> <select
								name="searchType" id="searchType" class=ss onchange>
								<option value="0001" selected>승인</option>
								<option value="0002" selected>거부</option>
								<option value="0003" selected>승인여부</option>
							</select><br>
						</div>
						<div class=a4>
							<span class="search_sc">검색</span> <input type="text"
								name="searchValue" class="sg">
						</div>
					</dt>
				</dl>
				</ul>
				<button id="myButton" class="mb">검색</button>&nbsp;
				<div class="table_list_wrap">
					<div class="tab_top_wrap">
						<div class="m_list_view"></div>
					</div>
					<div class="table_wrap pc_view">
						<table class="t_list">
							<colgroup>
								<col class="wid100">
								<col class="wid100">
								<col class="wid200">
								<col class="wid80">
								<col class="wid100">
								<col class="wid100">
								<col class="wid80">
								<col class="wid100">
							</colgroup>
							<thead>
								<tr class="first_list">
									<th class="first">번호</th>
									<th>학년</th>
									<th>학번</th>
									<th>학과</th>
									<th>이름</th>
									<th>지도교수</th>
									<th>신청일자</th>
									<th class="last">승인상태</th>
								</tr>
							</thead>
							 <tr class="tdtd"></tr>
							<tbody>
								<tr class="one_list">
									<td data-mb="번호" class="first">11</td>
									<td data-mb="학년">1학년</td>
									<td data-mb="학번" class="title t_left">20230414</td>
									<td data-mb="학과" class="title t_left">정보통신과</td>
									<td data-mb="이름">홍길동</td>
									<td data-mb="지도교수">김승경</td>
									<td data-mb="신청일자">2023-09-20</td>
									<td data-mb="처리상태" class="input_td"><span id="attflDiv">
											<a href="#;" class="btn01 col04"
											onclick="fnStuStatus(&quot;0000111285&quot;);"><span>승인</span></a>
									</span></td>
								</tr>
								 <tr class="table-divider"></tr>
								<tr class="two_list">
									<td data-mb="번호" class="first">10</td>
									<td data-mb="학년">3학년</td>
									<td data-mb="학번" class="title t_left">20230415</td>
									<td data-mb="학과" class="title t_left">컴퓨터공학과</td>
									<td data-mb="이름">차지헌</td>
									<td data-mb="지도교수">이공학</td>
									<td data-mb="신청일자">2023-09-19</td>
									<td data-mb="처리상태" class="input_td"><span id="attflDiv">
											<a href="#;" class="btn01 col04"
											onclick="fnStuStatus(&quot;0000111285&quot;);"><span>승인</span></a>
									</span></td>
								</tr>
								 <tr class="table-divider"></tr>
								<tr class="three_list">
									<td data-mb="번호" class="first">9</td>
									<td data-mb="학년">1학년</td>
									<td data-mb="학번" class="title t_left">20230416</td>
									<td data-mb="학과" class="title t_left">토목과</td>
									<td data-mb="이름">김상길</td>
									<td data-mb="지도교수">박토목</td>
									<td data-mb="신청일자">2023-09-21</td>
									<td data-mb="처리상태" class="input_td"><span id="attflDiv">
											<a href="#;" class="btn01 col04"
											onclick="fnStuStatus(&quot;0000111285&quot;);"><span>승인</span></a>
									</span></td>
								</tr>
								 <tr class="table-divider"></tr>
								<tr class="four_list">
									<td data-mb="번호" class="first">8</td>
									<td data-mb="학년">3학년</td>
									<td data-mb="학번" class="title t_left">20230417</td>
									<td data-mb="학과" class="title t_left">건축과</td>
									<td data-mb="이름">김형관</td>
									<td data-mb="지도교수">최건축</td>
									<td data-mb="신청일자">2023-09-21</td>
									<td data-mb="처리상태" class="input_td"><span id="attflDiv">
											<a href="#;" class="btn01 col04"
											onclick="fnStuStatus(&quot;0000111285&quot;);"><span>승인</span></a>
									</span></td>
								</tr>
								 <tr class="table-divider"></tr>
								<tr class="five_list">
									<td data-mb="번호" class="first">7</td>
									<td data-mb="학년">2학년</td>
									<td data-mb="학번" class="title t_left">20230418</td>
									<td data-mb="학과" class="title t_left">실내디자인과</td>
									<td data-mb="이름">이형민</td>
									<td data-mb="지도교수">박실내</td>
									<td data-mb="신청일자">2023-09-18</td>
									<td data-mb="처리상태" class="input_td"><span id="attflDiv">
											<a href="#;" class="btn01 col04"
											onclick="fnStuStatus(&quot;0000111285&quot;);"><span>승인</span></a>
									</span></td>
								</tr>
								 <tr class="table-divider"></tr>
								<tr class="six_list">
									<td data-mb="번호" class="first">6</td>
									<td data-mb="학년">2학년</td>
									<td data-mb="학번" class="title t_left">20230419</td>
									<td data-mb="학과" class="title t_left">정보통신과</td>
									<td data-mb="이름">오세훈</td>
									<td data-mb="지도교수">김승경</td>
									<td data-mb="신청일자">2023-09-17</td>
									<td data-mb="처리상태" class="input_td"><span id="attflDiv">
											<a href="#;" class="btn01 col04"
											onclick="fnStuStatus(&quot;0000111285&quot;);"><span>승인</span></a>
									</span></td>
								</tr>
								 <tr class="table-divider"></tr>
								<tr class="seven_list">
									<td data-mb="번호" class="first">5</td>
									<td data-mb="학년">1학년</td>
									<td data-mb="학번" class="title t_left">20230420</td>
									<td data-mb="학과" class="title t_left">컴퓨터공학과</td>
									<td data-mb="이름">유예슬</td>
									<td data-mb="지도교수">이공학</td>
									<td data-mb="신청일자">2023-09-18</td>
									<td data-mb="처리상태" class="input_td"><span id="attflDiv">
											<a href="#;" class="btn01 col04"
											onclick="fnStuStatus(&quot;0000111285&quot;);"><span>승인</span></a>
									</span></td>
								</tr>
								 <tr class="table-divider"></tr>
								<tr class="eight_list">
									<td data-mb="번호" class="first">4</td>
									<td data-mb="학년">2학년</td>
									<td data-mb="학번" class="title t_left">20230421</td>
									<td data-mb="학과" class="title t_left">토목과</td>
									<td data-mb="이름">박성주</td>
									<td data-mb="지도교수">박토목</td>
									<td data-mb="신청일자">2023-09-20</td>
									<td data-mb="처리상태" class="input_td"><span id="attflDiv">
											<a href="#;" class="btn01 col04"
											onclick="fnStuStatus(&quot;0000111285&quot;);"><span>승인</span></a>
									</span></td>
								</tr>
								 <tr class="table-divider"></tr>
								<tr class="nine_list">
									<td data-mb="번호" class="first">3</td>
									<td data-mb="학년">1학년</td>
									<td data-mb="학번" class="title t_left">20230422</td>
									<td data-mb="학과" class="title t_left">건축과</td>
									<td data-mb="이름">한영화</td>
									<td data-mb="지도교수">최건축</td>
									<td data-mb="신청일자">2023-09-20</td>
									<td data-mb="처리상태" class="input_td"><span id="attflDiv">
											<a href="#;" class="btn01 col04"
											onclick="fnStuStatus(&quot;0000111285&quot;);"><span>승인</span></a>
									</span></td>
								</tr>
								 <tr class="table-divider"></tr>
								<tr class="ten_list">
									<td data-mb="번호" class="first">2</td>
									<td data-mb="학년">2학년</td>
									<td data-mb="학번" class="title t_left">20230423</td>
									<td data-mb="학과" class="title t_left">실내디자인과</td>
									<td data-mb="이름">민동규</td>
									<td data-mb="지도교수">박실내</td>
									<td data-mb="신청일자">2023-09-17</td>
									<td data-mb="처리상태" class="input_td"><span id="attflDiv">
											<a href="#;" class="btn01 col04"
											onclick="fnStuStatus(&quot;0000111285&quot;);"><span>승인</span></a>
									</span></td>
								</tr>
								<tr class="table-divider"></tr>							
								<tr class="twelve_list">
									<td data-mb="번호" class="first">1</td>
									<td data-mb="학년">3학년</td>
									<td data-mb="학번" class="title t_left">20230420</td>
									<td data-mb="학과" class="title t_left">실내디자인과</td>
									<td data-mb="이름">정해숙</td>
									<td data-mb="지도교수">박실내</td>
									<td data-mb="신청일자">2023.09.18</td>
									<td data-mb="처리상태" class="input_td"><span id="attflDiv">
											<a href="#;" class="btn01 col04"
											onclick="fnStuStatus(&quot;0000111285&quot;);"><span>승인</span></a>
									</span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<button id="myButton" class="mb2">승인</button> &nbsp;
						<div class="pag">
  						<a class="select" href="#" onclick="showPage(1);">1</a>
  						<a href="#" onclick="showPage(2);">2</a>
 						 <a href="#" onclick="showPage(3);">3</a>
				</div>
				<script>
  function showPage(pageNumber) {
    var rows = document.querySelectorAll('.one_list, .two_list, .three_list, .four_list, .five_list, .six_list, .seven_list, .eight_list, .nine_list, .ten_list,.eleven_lis,.twelve_list');
    var itemsPerPage = 5; 
    var startIndex = (pageNumber - 1) * itemsPerPage;
    var endIndex = startIndex + itemsPerPage;

  
    for (var i = 0; i < rows.length; i++) {
      rows[i].style.display = 'none';
    }


    for (var i = startIndex; i < endIndex && i < rows.length; i++) {
      rows[i].style.display = 'table-row';
    }
  }

  showPage(1);
</script>

				 <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>

</html>