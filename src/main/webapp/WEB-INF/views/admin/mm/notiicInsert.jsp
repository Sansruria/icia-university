<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>양식</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
<style>
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="section section-properties" >
	  <div class="container">
	   	<div class="two_third first" style="height:auto">
     <div class="col-lg-12">
		   <h2 class="font-weight-bold text-primary heading">글쓰기</h2>
		     <hr/><br><br>
       	<div class="two_third first">
       	<form method=post action="../noticeboard/insert_ok.do" id="frm">
       		<table class="table">
       			<tr>
	       			<th width=10% class="text-right">이름</th>
		       			<td width=80%>
		       				<form method=post action="../noticeboard/insert.do">
		       				<input type=text size=15 class="input-sm" id="name" style="height: 30px" value="${sessionScope.name }">
		       				</form>
		       			</td>
	       			</tr>
	       			<tr>
	       		<th width=10% class="text-right">아이디</th>
		       			<td width=80%>
		       				<form method=post action="../noticeboard/insert.do">
		       				<input type=text size=15 class="input-sm" id="id" style="height: 30px" value="${sessionScope.id }">
		       				</form>
		       			</td>
	       		</tr>
       			<tr>
       			<th width=20% class="text-right">제목</th>
	       			<td width=80%>
	       				<input type=text name=subject size=50 class="input-sm" id="subject" >
	       				
	       			</td>
       			</tr>
       			<tr>
       			<th width=20% class="text-right">내용</th>
	       			<td width=80%>
	       				<textarea rows="10" cols="50" name=content id="content"></textarea>
	       			</td>
       			</tr>
       			<tr>
       			<th width=20% class="text-right">비밀번호</th>
	       			<td width=80%>
	       				<input type="password" name=pwd size=10 class="input-sm" id="pwd">
	       			</td>
       			</tr>
       			<tr>
	       			<td colspan="2" class="text-center">
	       				<div class="wrap">
	       					<input type="button" value="글쓰기" class="button" id="writeBtn">
	       					<input type=button value="취소" class="button" onclick="javascipt:history.back()">
						</div>
	       				
	       			</td>
       			</tr>
       		</table>
       		</form>
       	</div>
       	</div>
       	</div>
       	</div>


</div>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>