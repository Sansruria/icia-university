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
  
.dropout_app{
	text-align:center;
}
.dandan{
	position:absolute;
	top:240px;
	left:420px;
	border-color:#E6E6E6;
	height:30px;
}
.andd{
	position:absolute;
	left:700px;
	top:240px;
	border-color:#E6E6E6;
}
.andand{
	position:absolute;
	left:80px;
	border-color:#E6E6E6;
}
.dandan2{
	position:absolute;
	left:420px;
	border-color:#E6E6E6;
	height:200px;
	width:500px;
	top:450px;
}
.ddan{
	 border-left: none; 
    border-right: none; 
    border-top: 2px solid black; 
    border-bottom: 1px solid black; 
    padding-top:20px;
     padding-bottom:20px;
      padding-left:20px;
}
.reason1{
	 border-left: none; 
    border-right: none; 
    border-top: 2px solid black; 
    border-bottom: 1px solid black; 
    padding-top:20px;
     padding-bottom:20px;
      padding-left:20px;
}
.reason2{
	position:absolute;
	left:700px;
	top:375px;
}
.reason3{
	color:#BDBDBD;
	position:absolute;
	left:800px;
	top:375px;
}
.reason4{
	position:absolute;
	top:530px;
}
.reason5{
	position:absolute;
 	border-left: none; 
    border-right: none; 
    border-top: 2px solid black; 
    border-bottom: 1px solid black; 
    padding-top:20px;
     padding-bottom:20px;
      padding-left:20px;
      top:680px;
      height:70px;
      width:1300px;
}
.cbcb{
	position:absolute;
	 top:700px;
	 left:450px;
	 height:30px;
	  border-color:white;
}
.cbcb2{
	position:absolute;
	 top:770px;
	 right:300px;
	 height:60px;
	 width:120px;
	 font-size:20px;
	 border-color:white;
}
.dudi {
position:absolute;
	top:375px;
	left:420px;
}
footer{
position:absolute;
	bottom:0px;
	width:1900px;
}
</style>
</head>

<body>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

    <div class="container">
		<h2 class="dropout_app">자퇴신청</h2>&nbsp;
		<div class="dan">	
		<h3 class="scj">신청자정보</h3>
		<div class="ddan">
		<span>신청자</span> <input type="text" id="app"  class="dandan">
		</div> 
		<div class="andd">
		<span>학번</span><input type="text" id="app" class="andand">
		</div>
	</div>
	&nbsp;
	 <h3 class="scj2">자퇴신청</h3>
	 <div class="reason1" >신청일자</div><input type="date" class="dudi"
								id="date" max="2025-09-05" min="2022-09-05" value="2023-09-20">
	 <div class="reason2">진행상태</div>
	 <div class="reason3">신청전</div>	
	 <div class="reason4">자퇴신청사유</div><input type="text" id="app"class="dandan2">
	  <div class="reason5">첨부파일</div>
<input type="file" id="fileInput" class="cbcb">
<button id="uploadButton" class="cbcb2">업로드</button>
<div id="uploadedFiles"></div>
	  <button id="linkButton" class="cbcb2">신청</button>
 	</div>
 	<footer>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
    </footer>
	<script>
    // 버튼 요소를 가져와서 클릭 이벤트를 추가합니다.
    document.getElementById("linkButton").addEventListener("click", function() {
        // 링크로 이동할 URL을 설정합니다.
        alert("신청이 완료되었습니다.");
        var linkUrl = "/stmain";
        
        // 현재 창에서 링크를 여는 방법 (같은 탭에서)
        window.location.href = linkUrl;
        
        // 새 창에서 링크를 여는 방법 (새 탭에서)
        // window.open(linkUrl, "_blank");
    });
</script>


  
    
</body>
</html>