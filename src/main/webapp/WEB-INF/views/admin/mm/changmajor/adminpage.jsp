<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>관리자의 전과승인페이지</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="container">
		<div class="row mb-4">
			<div class="col">
				<span class="fs-2">전과신청목록페이지</span>
			</div>
		</div>

		<div class="row">
			<div class="table-responsive text-center">
				<table class="table table-bordered table-hover">
					<thead class="table-primary">
						<tr>

							<th scope="col">이름</th>
							<th scope="col">학번</th>
							<th scope="col">전과신청학과</th>
							<th scope="col">승인상태</th>
							<th scope="col">승인하기</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="users" items="${userList}">
							<tr>
								<form action="/admin/mm/confirm" method="post">
									<input type="hidden" name="st_id" value="${users.st_id}">
									<td><c:out value="${users.reg_st_name}"></c:out></td>
									<td><c:out value="${users.st_id}"></c:out></td>
									<td><c:out value="${users.department_name}"></c:out></td>
									<c:if test="${users.a_status == '0'}">
										<td><select name="a_status">
												<option value="1">전과승인</option>
												<option value="0">전과보류</option>
										</select></td>
										<td><button type="submit" class="btn btn-primary">저장</button></td>
									</c:if>

									<c:if test="${users.a_status == '1'}">
										<td>전과승인</td>
										<td><button type="submit" class="btn btn-primary"
												disabled>저장</button>
										</td>
									</c:if>
								</form>
	
																</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>