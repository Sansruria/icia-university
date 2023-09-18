<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
	document.addEventListener("DOMContentLoaded", function(){
	    document.querySelector('.btn-file').addEventListener('click', ()=>openFileModal())
	})
	
    function openFileModal() {
        $('.modal-content').load('/file/modal/upload')
    }

    function logout() {
        let postFrm = document.createElement('form')
        postFrm.setAttribute('method', 'POST')
        postFrm.setAttribute('action', '/logout')
        document.body.appendChild(postFrm)
        postFrm.submit()
    }
</script>

<nav class="navbar navbar-expand-lg mb-4" style="background-color: #0B1B40">
    <div class="container">
       	<c:if test="${fn:substring(memberInfo.userId, 0, 1) eq 'P'}">
    		<a class="navbar-brand" href="/">
	            <img src="/img/icia-logo.png" alt="icia" height="60">
	        </a>
    	</c:if>
    	
    	<c:if test="${!(fn:substring(memberInfo.userId, 0, 1) eq 'P')}">
	        <a class="navbar-brand" href="/sreg/st/main">
	            <img src="/img/icia-logo.png" alt="icia" height="60">
	        </a>
        </c:if>

        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="row my-2">
            <c:if test="${memberInfo != null}">
                <div class="col">
                    <div class="text-end text-white">
                        <a href="#" class="nav-link btn-file" data-bs-toggle="modal" data-bs-target="#fileModal">프로필사진변경</a>
                    </div>
                </div>
            
                <div class="col-auto">
                    <div class="text-end text-white">
                            <c:out value="${sessionScope.memberInfo.name}"></c:out>님
                    </div>
                </div>

                <div class="col-auto">
                    <div class="text-end text-white">
                        <c:if test="${memberInfo != null}">
                            <a href="#" onclick="logout()" class="nav-link">로그아웃</a>
                        </c:if>
                    </div>
                </div>
            </c:if>

            <c:if test="${memberInfo == null}">
                <div class="col">
                    <div class="text-end text-white">
                        <a href="/login" class="nav-link">로그인</a>
                    </div>
                </div>
            </c:if>

            <div class="mt-2">
                <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                    
                    	<li class="nav-item">
                    		<a href="/common/notice" class="nav-link text-white">공지사항</a>
                    	</li>
                    	
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white" href="#" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                학적
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/sreg/stchangm">전과신청메인</a></li>
                                <li><a class="dropdown-item" href="/sreg/stchangm/update">전과신청화면</a></li>
                                <li><a class="dropdown-item" href="/sreg/stchangm/update/list">전과조회페이지</a></li>
<!--                                 <li><a class="dropdown-item" href="/sreg/dropout/list">자퇴신청</a></li> -->
<!--                                 <li><a class="dropdown-item" href="/sreg/mm/dropoout/list">자퇴관리</a></li> -->
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white" href="#" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                수강
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/course/coursereg/list">수강신청</a></li>
                                <li><a class="dropdown-item" href="/course/courseselect/list">수강조회</a></li>
<!--                                 <li><a class="dropdown-item" href="/course/courseevreg/list">강의평가</a></li> -->
<!--                                 <li><a class="dropdown-item" href="/course/courseev/list">강의평가조회</a></li> -->
<!--                                 <li><a class="dropdown-item" href="/course/syllabusreg/oper/list">수업계획서 등록</a></li> -->
                            </ul>
                        </li>
                        <c:if test="${memberInfo.userId eq 'admin'}">
	                        <li class="nav-item dropdown">
	                            <a class="nav-link dropdown-toggle text-white" href="#" role="button"
	                               data-bs-toggle="dropdown" aria-expanded="false">
	                                시스템
	                            </a>
	                            <ul class="dropdown-menu">
	                                <li><a class="dropdown-item" href="/admin/mm/changm">전과신청내역</a></li>
	                                <li><a class="dropdown-item" href="/sreg/st">학생관리</a></li>
	                                <li><a class="dropdown-item" href="/sreg/pf">교수관리</a></li>
	                                <li><a class="dropdown-item" href="/admin/mm/deptline">학과계열관리</a></li>
	                                <li><a class="dropdown-item" href="/admin/mm/faculty">학부관리</a></li>
	                                <li><a class="dropdown-item" href="/admin/mm/dept">학과관리</a></li>
	                                <li><a class="dropdown-item" href="/admin/mm/courselist/list">수강내역관리</a></li>
	                            </ul>
	                        </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>

<!-- File Modal -->
<div class="modal fade" id="fileModal" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1" aria-labelledby="fileModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>
<!-- end File Modal -->