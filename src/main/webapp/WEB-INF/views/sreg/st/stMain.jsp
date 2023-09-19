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
		              
						<div class="row mb-5">
    					  <h5 class="font-weight-normal">ICIA UNIV 공지사항</h5>
						  <c:forEach var="notice" items="${noticesList}">
						      <a href="/common/notice/${notice.noticeId}" class="link-offset-2 link-underline link-underline-opacity-0">${notice.title}</a><br/>
						  </c:forEach>
						</div>
						
						<div class="row mt-auto">
							<p class="text-center">제 1 장 총 칙</p>
							<ul>
								<li class="mb-2">제1조(목적) 본 대학교는 대한민국 교육의 근본이념에 입각하여 국가산업 발전에 필요한 전문적인 지식과 이론을 교수, 연구하고 재능을 연마하여 국가발전에 필요한 전문직업인을 양성함을 목적으로 한다.</li>
								<li class="mb-2">제2조(명칭) 본 대학교는 인천일보대학교라 한다.</li>
								<li class="mb-2">제3조(위치) 본 대학교는 인천 미추홀구 매소홀로488번길 6-32에 둔다.(개정 2023.04.14, 2023.09.25)</li>
								<li class="mb-2">제4조(수업연한) ①본 대학교의 수업연한은 3년 내지 4년으로 한다.(개정 2013.9.1)</li>
								<li class="mb-2">
								    ②「산업교육진흥 및 산학연협력촉진에 관한 법률」에 의거 설치된 “계약학과”의 경우에는 산업체와의 계약에 의해 수업연한을 별도로 정할 수 있다.(신설 2018.2.1)
                                    제5조(재학연한) ①재학연한은 10년으로 한다. 단, 휴학기간은 재학연한에 포함하지 아니한다.(개정 2019.3.1)
                                </li>
							</ul>
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
