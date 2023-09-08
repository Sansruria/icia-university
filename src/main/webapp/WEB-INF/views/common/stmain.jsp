<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>양식</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
    <style>
.user_main{
 position:absolute;
 left:250px;
 top:100px;
}
.user_box{
	position:absolute;
	text-align: center;
	border: 1px solid #E6E6E6;	
	width:350px;
	height:770px;
	border-top: 0; 
	border-bottom: 0; 
	border-left: 0; 
}
.stst{
	position:absolute;
	top:40px;
	left:70px;
}
.user_course{
	position:absolute;
	text-align: center;
	border: 1px solid #E6E6E6;
	left:350px;
	width:470px;
	height:365px;
	border-top: 0; 
}
.user_list{
	position:absolute;
	text-align: center;
	border: 1px solid #E6E6E6;
	top:365px;
	left:350px;
	width:470px;
	height:410px;
	border-bottom: 0; 
}

.user_notice{
	position:absolute;
	text-align: center;
	
	left:820px;
	border: 1px solid #E6E6E6;
	width:400px;
	height:770px;
	border-top: 0; 
	border-bottom: 0; 
	border-right: 0; 
}


.imim{
	border: 1px solid gray;
}
.user_text1{
	font-size:30px;
}
.user_text2{
	font-size:20px;
}



.user_text3{
	font-size:20px;
}
.user_text4{
	font-size:20px;
}
</style>
</head>

<body>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

    <div class="container">
		<div class="user_main">
	<div class="user_box">
	<div class="stst">	
		<span>
		<img class="imim" src="/img/sajin.jpg">
		</span>
			<p class="user_text1">홍길동</p>
			<p class="user_text2">20230414</p>
			<p class="user_text3">정보통신과</p>
			<p class="user_text4">재학중</p>
			</div>
	</div>
	<nav class="user_course">
	<h3 class="user_text5">수강 일정</h3>&nbsp;
	<a href="#">aaaaaaaaaa</a><br>
	<a href="#">bbbbbbbbbb</a><br>
	<a href="#">cccccccccc</a>
	</nav>
	<nav class="user_list">
	<h3 class="user_text5">나의 수강 신청 목록</h3>&nbsp;
	<a href="#">dddddddddd</a><br>
	<a href="#">eeeeeeeeee</a><br>
	<a href="#">ffffffffff</a>
	</nav>
	<nav class="user_notice">
	<h3 class="user_text5">공지사항</h3>&nbsp;
	<a href="#">kkkkkkkkkk</a><br>
	<a href="#">gggggggggg</a><br>
	<a href="#">hhhhhhhhhh</a><br>
	<a href="#">iiiiiiiiii</a><br>
	<a href="#">jjjjjjjjjj</a>
	</nav>
 	</div>

    </div>
    
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>