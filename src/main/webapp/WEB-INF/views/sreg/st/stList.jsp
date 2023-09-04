<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학생관리</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
	    
    <script>
        document.addEventListener("DOMContentLoaded", function(){
            document.querySelector('.btn-save').addEventListener('click', ()=>location.href='/sreg/st/write')
            document.querySelector('.btn-search').addEventListener('click', ()=>search())
        })
        
        function search() {
        }

        function detail(id) {
            location.href = '/sreg/st/detail/' + id
        }
    </script>
</head>

<body>

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

<div class="container">
    <div class="row mb-3">
        <div class="card">
            <div class="card-body">
            
                <div class="row ">
                    <form name="searchFrm">
						<div class="row mb-3 align-items-center">
    					   <div class="col">학적상태</div>
	   					   <div class="col"><input type="text" name="status" class="form-control"></div>
    					   <div class="col">학번</div>
	   					   <div class="col"><input type="text" name="stId" class="form-control"></div>
						</div>
						
						<div class="row mb-3 align-items-center">
    					   <div class="col">학생명</div>
	   					   <div class="col"><input type="text" name="name" class="form-control"></div>
    					   <div class="col">학과</div>
	   					   <div class="col"><input type="text" name="departmentName" class="form-control"></div>
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
                    <div class="col">학적상태</div>
                </div> <!-- end row -->
                
                <c:forEach var="st" items="${stList}">
	                <div class="row text-center" onclick="detail('${st.stId}')" style="cursor:pointer">
	                    <div class="col">${st.rnum}</div>
	                    <div class="col">${st.deptName}</div>
	                    <div class="col">${st.stId}</div>
	                    <div class="col">${st.name}</div>
	                    <div class="col">${st.gender}</div>
	                    <div class="col">${st.status}</div>
	                </div>
                </c:forEach>
                
            </div>
        </div>
    </div> <!-- end row -->
    <button type="button" class="btn btn-primary btn-save">등록</button>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

</body>
</html>