<%--
  User: 오세훈
  Date: 2023/09/09
  Time: 12:51
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<style type="text/css">

</style>
    <title>학생메인</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	
	<div class="container">
		<div class="row" style="height:700px;">
		  <div class="col-6">
		      <div class="card">
		          <div class="card-body p-5" style="height:700px;">
		              <c:if test="${memberInfo.gender eq '0' and memberInfo.systemFileName == null}">
		                  <img src="/upload/anonymous_female.jpg" class="rounded mx-auto d-block" style="width:400px">
		              </c:if>
		              
		              <c:if test="${memberInfo.gender eq '1' and memberInfo.systemFileName == null}">
		                  <img src="/upload/anonymous_male.jpg" class="rounded mx-auto d-block" style="width:400px">
                      </c:if>
		          
		              <c:if test="${memberInfo.systemFileName != null}">
			              <div class="row">
			                  <img src="/upload/${memberInfo.systemFileName}" class="rounded mx-auto d-block" style="width:400px">
			              </div>
		              </c:if>
		              
		              <div class="row">
		                  <h4 class="text-center my-4"><c:out value="${memberInfo.name}"></c:out></h4>
		              </div>
		              
		              <div class="row">
                          <div class="col">
                              <div class="input-group mb-3">
                                  <span class="input-group-text w-25 p-3">학번</span>
                                  <span class="w-75 border p-3"><c:out value="${memberInfo.userId}"></c:out></span>
                              </div>
                          </div>
                      </div>
		              
		              <div class="row">
                          <div class="col">
                              <div class="input-group mb-3">
                                  <span class="input-group-text w-25 p-3">학과</span>
                                  <span class="w-75 border p-3"><c:out value="${memberInfo.deptName}"></c:out></span>
                              </div>
                          </div>
                      </div>
                      
		          </div>
		      </div>
		  </div>
		  
		  <div class="col-6">
		      <div class="row">
		          <div class="card">
		              <div class="card-body p-5" style="height:700px;">
                            <h5 class="font-weight-normal">ICIA UNIV 공지사항</h5>
			                <c:forEach var="notice" items="${noticesList}">
			                  <p><a href="/common/notice/${notice.noticeId}" class="link-offset-2 link-underline link-underline-opacity-0">${notice.title}</a></p>
			                  </c:forEach>
			                <p> * 수강신청 관련 안내 공지사항 입니다.</p>
			                    <p>* 전과 관련 신청 관련 공지사항 입니다.</p>
			                    <p>* 자퇴 신청 관련 안내 공지사항 입니다.</p>
			                    <p>* 개인정보 변경 사항 관련  공지사항 입니다.               
			                    </p>
			                <h5 class="font-weight-normal">Personal Experience</h5>
			                <p>It is truly amazing the damage that we, as parents, can
			                    inflict on our children. So why do we do it? For the most part, we
			                    don’t do it intentionally or with malice. In the majority of cases,
			                    the cause is a well-meaning but unskilled or un-thinking parent,
			                    who says the wrong thing at the wrong time, and the message sticks
			                    – as simple as that!</p>
			                <div class="mb-2 mt-2 pt-1">
			                    <h5 class="font-weight-normal">이수학점</h5>
			                </div>
			                <div class="py-1">
			                    <div class="progress">
			                        <div class="progress-bar" role="전공필수" style="width: 85%"
			                            aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
			                            <div class="progress-bar-title">Finance</div>
			                            <span class="progress-bar-number">85%</span>
			                        </div>
			                    </div>
			                </div>
			                <div class="py-1">
			                    <div class="progress">
			                        <div class="progress-bar" role="전공선택" style="width: 70%"
			                            aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
			                            <div class="progress-bar-title">Information Technologies</div>
			                            <span class="progress-bar-number">70%</span>
			                        </div>
			                    </div>
			                </div>
			                <div class="py-1">
			                    <div class="progress">
			                        <div class="progress-bar" role="교양" style="width: 77%"
			                            aria-valuenow="77" aria-valuemin="0" aria-valuemax="100">
			                            <div class="progress-bar-title">Education</div>
			                            <span class="progress-bar-number">77%</span>
			                        </div>
			                    </div>
			                </div>
		              </div>
		          </div>
		      </div>
		  </div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>
