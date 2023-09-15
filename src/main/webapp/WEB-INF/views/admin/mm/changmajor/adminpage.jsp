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
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		th:replace="/fragment/navigation :: menu(${user})"></nav>

	<div class="container-fluid mt-3">
		<div class="row">

			<!-- SIDE BAR -->
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse"
				th:replace="/fragment/navigation :: side(${user})"></nav>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">전과신청목록페이지</h1>
				</div>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">이름</th>
								<th scope="col">학번</th>
								<th scope="col">전과신청학과</th>
								<th scope="col">Email</th>
								<th scope="col">승인상태</th>
								<th scope="col">승인하기</th>
							</tr>
						</thead>
						<tbody>
							<tr th:each="users : ${userList}">
								<form th:action="@{/user/change/{id}(id=${users.id})}"
									method="post" class="d-flex">
									<td th:text="${users.rnum}"></td>
									<td th:text="${users.st_name}"></td>
									<td th:text="${users.st_id}"></td>
									<td th:text="${users.department_name}"></td>
									<td th:text="${users.email}"></td>
									<td><select name="ad_status">
											<option value="1">전과승인</option>
											<option value="0">전과보류</option>
									</select></td>
									<td>
										<button class="btn btn-outline-dark flex-shrink-0"
											type="submitForm()">저장</button>
									</td>
								</form>
							</tr>
						</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>