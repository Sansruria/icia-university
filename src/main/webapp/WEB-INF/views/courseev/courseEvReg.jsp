<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>양식</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
</head>

<body>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

    <div class="container">
    
    	<div class="row">
    		<div class="col">
    			과목명
    		</div>
    		<div class="col">
    			<select class="form-select">
    				<option>-전체-</option>
    				<option selected>컴퓨터공학과</option>
    				<option>예제1</option>
    				<option>예제2</option>
    			</select>
    		</div>
    		<div class="col">
    			학기
    		</div>
    		<div class="col">
    			<select class="form-select">
    				<option selected>1학기</option>
    				<option>2학기</option>
    			</select>
    		</div>
    	</div>
    	
    </div>
    
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>