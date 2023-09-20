<%--
  User: 오세훈
  Date: 2023/09/09
  Time: 12:51
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>학생메인</title>
    <jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
    
    <script>
    document.addEventListener("DOMContentLoaded", function(){
        document.querySelector('.btn-file').addEventListener('click', ()=>openFileModal())
    })
    
    function openFileModal() {
        $('.modal-content').load('/file/modal/upload')
    }
    </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	
	<div class="container">
		<div class="row">
		  <div class="col-6">
		      <div class="card">
		          <div class="card-body ps-5 pe-5" style="height:700px;">
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
                          <h4 class="text-center mt-3">
                              <button type="button" class="btn btn-primary btn-file" data-bs-toggle="modal" data-bs-target="#fileModal">프로필사진변경</button>                                  
                          </h4>
                      </div>
		              
		              <div class="row">
		                  <h4 class="text-center my-2">
		                      <c:out value="${memberInfo.name}"></c:out>
	                      </h4>
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
		              <div class="card-body py-3" style="height:700px;">
		                  <div class="row mb-2">
		                      <div class="col">
		                          <span class="fs-4">ICIA UNIV 공지사항</span>
		                      </div>
		                      
		                      <div class="col text-end">
		                          <button type="button" onclick="location.href='/common/notice'" class="btn btn-primary">더보기</button>
		                      </div>
		                  </div>
		              
							<div class="row">
								<div class="col">
									
									<div class="table-responsive text-center">
                                        <table class="table table-bordered table-hover">
                                            <thead class="table-primary text-center">
                                                <tr>
                                                    <th>제목</th>
                                                    <th>등록일</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach var="notice" items="${noticesList}">
                                                    <tr>
                                                        <td>
                                                            <a href="/common/notice/${notice.noticeId}"
                                                                class="link-offset-2 link-underline link-underline-opacity-0">${notice.title}
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <fmt:parseDate value="${notice.createDate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime" type="both" />
                                                            <fmt:formatDate pattern="yyyy/MM/dd" value="${parsedDateTime}" />
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
								</div>
							</div>

							<div class="row mb-2">
                              <div class="col">
                                  <span class="fs-4">내 수강신청내역</span>
                              </div>
                            </div>
                      
                            <div class="row">
                                <div class="col">
                                    
                                    <div class="table-responsive text-center">
                                        <table class="table table-bordered table-hover text-center">
                                            <thead class="table-primary">
                                                <tr>
                                                    <th>이수구분</th>
                                                    <th>과목명</th>
                                                    <th>교수명</th>
                                                    <th>수강시간</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:if test="${not empty courseList}">
	                                                <c:forEach var="course" items="${courseList}">
	                                                    <tr>
	                                                        <td><c:out value="${course.req_course_division}"></c:out></td>
	                                                        <td><c:out value="${course.req_course_name}"></c:out></td>
	                                                        <td><c:out value="${course.req_pf_name}"></c:out></td>
	                                                        <td><c:out value="${course.req_course_time}"></c:out></td>
	                                                    </tr>
	                                                </c:forEach>
                                                </c:if>
                                                
                                                <c:if test="${empty courseList}">
                                                    <tr class="text-center">
                                                        <td colspan="4">신청한 수강과목이 없습니다</td>
                                                    </tr>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
		              </div>
		          </div>
		      </div>
		  </div>
		</div>
	</div>
	
	<!-- File Modal -->
	<div class="modal fade" id="fileModal" data-bs-backdrop="static" data-bs-keyboard="false"
	     tabindex="-1" aria-labelledby="fileModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        </div>
	    </div>
	</div>
	<!-- end File Modal -->

	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>
