<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전과신청메인</title>
	<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
	<script defer src="/js/ysyoo/changmajor.js" type="text/javascript"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	
	<div class="row" style="background:#094a9a">
		<div class="col text-white text-center fs-3 p-4">2023년도 2학기 전과신청</div>
	</div>
	
	<div class="container">
	
		<div class="row">
            <div class="col">
                <div class="input-group py-3">
                    <span class="input-group-text p-3">학년</span>
                    <input class="form-control" type="text" value="<c:out value="${memberInfo.deptName}"></c:out>" readonly>
                    
                    <span class="input-group-text p-3">학기</span>
                    <input class="form-control" type="text" value="<c:out value="${memberInfo.name}"></c:out>" readonly>
                    
                    <span class="input-group-text p-3">학점</span>
                    <input class="form-control" type="text" value="<c:out value="${memberInfo.userId}"></c:out>" readonly>
                </div>
            </div>
        </div>
		
		<div class="row mb-3">
			<div class="col">
				<div class="input-group">
					<span class="input-group-text p-3 w-25">학과계열</span>
					<select name="departmentLineId" id="departmentLineSelect" class="form-select">
	                    <option value="">선택</option>
	                    <c:forEach items="${departmentLineList}" var="department_line">
	                        <option value="${department_line.department_line_id}">${department_line.department_line_name}</option>
	                    </c:forEach>
	                </select>
				</div>
			</div>
			
			<div class="col">
				<div class="input-group">
					<span class="input-group-text p-3 w-25">학부</span>
					<select name="facultyId" id="facultySelect" class="form-select">
	                    <option value="">선택</option>
	                    <c:forEach items="${facultyList}" var="f">
	                        <option value="${f.faculty_id}">${f.faculty_name}</option>
	                    </c:forEach>
	                </select>
				</div>
			</div>
			
			<div class="col d-flex align-items-center">
				<input type="submit" class="btn btn-primary" value="목록담기">
			</div>
		</div> <!-- row end -->
		
		<div class="row">
			<div class="col mb-2 fs-3">신청목록</div>
		</div>		
		
		<div class="row mb-3">
			<div class="card">
				<div class="card-body py-4">
					<div class="row">
						<div class="table-responsive text-center">
	                        <table class="table table-bordered align-middle">
	                            <thead class="table-primary">
	                                <tr>
	                                    <th>학년/학기</th>
	                                    <th>학과계열</th>
	                                    <th>학부</th>
	                                    <th>학과</th>
	                                </tr>
	                            </thead>
	
	                            <tbody>
		                            <tr>
						                <td colspan="4">조회된 데이터가 없습니다</td>
						            </tr>
	                            </tbody>
	                        </table>
	                    </div>
					</div>
					
					<div class="row text-end">
						<a href="/stchangm/majorupdat/list">
							<button type="button" class="btn btn-primary">신청하기</button>
						</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col mb-2 fs-3">신청내역</div>
		</div>	
		
		<div class="row">
			<div class="card">
				<div class="card-body py-4">
					<div class="row">
						<div class="table-responsive text-center">
	                        <table class="table table-bordered align-middle">
	                            <thead class="table-primary">
	                                <tr>
	                                    <th>학년/학기</th>
	                                    <th>학과계열</th>
	                                    <th>학부</th>
	                                    <th>학과</th>
	                                </tr>
	                            </thead>
	
	                            <tbody>
		                            <tr>
						                <td colspan="4">조회된 데이터가 없습니다</td>
						            </tr>
		                            <tr>
						                <td colspan="4">조회된 데이터가 없습니다</td>
						            </tr>
	                            </tbody>
	                        </table>
	                    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>

</html>
