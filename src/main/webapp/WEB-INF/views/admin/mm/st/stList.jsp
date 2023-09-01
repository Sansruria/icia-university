<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"
    integrity="sha512-Gn0tSSjkIGAkaZQWjx3Ctl/0dVJuTmjW/f9QyB302kFjU4uTNP4HtA32U2qXs/TRlEsK5CoEqMEMs7LnzLOBsA=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<div class="container">
    <div class="row mb-3">
        <div class="card">
            <div class="card-body">
            
                <div class="row ">
                    <form name="searchFrm">
						<div class="row mb-3 align-items-center">
    					   <div class="col">학적상태</div>
	   					   <div class="col"><input type="text" name="" class="form-control"></div>
    					   <div class="col">학번</div>
	   					   <div class="col"><input type="text" name="" class="form-control"></div>
						</div>
						
						<div class="row mb-3 align-items-center">
    					   <div class="col">학생명</div>
	   					   <div class="col"><input type="text" name="" class="form-control"></div>
    					   <div class="col">학과</div>
	   					   <div class="col"><input type="text" name="" class="form-control"></div>
						</div>
                    </form>
                    
                    <div class="row mb-3">
                        <button type="button" class="btn btn-primary btn-search">검색</button>
                    </div>
                </div> <!-- end row -->
                
            </div>
        </div>
    </div> <!-- end row -->
    
    <div class="row mb-3">
        <div class="card">
            <div class="card-body">
                
                <div class="row text-center">
                    <div class="col">번호</div>
                    <div class="col">학과명</div>
                    <div class="col">학번</div>
                    <div class="col">학생명</div>
                    <div class="col">성별</div>
                    <div class="col">전화번호</div>
                    <div class="col">학적상태</div>
                </div> <!-- end row -->
                
                <c:forEach var="st" items="${stList}">
	                <div class="row">
	                    <div class="col"></div>
	                    <div class="col"></div>
	                    <div class="col"></div>
	                    <div class="col"></div>
	                    <div class="col"></div>
	                    <div class="col"></div>
	                    <div class="col"></div>
	                </div>
                </c:forEach>
                
            </div>
        </div>
    </div> <!-- end row -->
    
    <button type="button" class="btn btn-primary" onclick="javascript:location.href='/'">홈으로</button>
    
</div>
</body>

<script>
</script>

</html>