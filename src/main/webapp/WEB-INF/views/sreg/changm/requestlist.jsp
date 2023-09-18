<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>전과신청내역</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="container w-50">
		<div class="row mb-4 ps-4">
			<div class="col">
				<span class="fs-2"><img alt="" src="/img/changmserchlist.png"></span>
			</div>
		</div>
	</div>

	<div class="container d-flex justify-content-center">
		<div class="w-50 mb-3">
			<div class="card">
				<div class="card-body">
					<div class="p-4">

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">이름</span> <span
										class="w-75 border p-3"><c:out
											value="${st_changmajor.reg_st_name}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">학번</span> <span
										class="w-75 border p-3"><c:out
											value="${st_changmajor.st_id}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">학과계열</span> <span
										class="w-75 border p-3"><c:out
											value="${st_changmajor.st_department_line_name}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">학과</span> <span
										class="w-75 border p-3"><c:out
											value="${st_changmajor.st_department_name}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">재적상태</span> <span
										class="w-75 border p-3"><c:out
											value="${st_changmajor.reg_change_status}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">전과신청학과</span> <span
										class="border w-75 p-3"><c:out
											value="${st_changmajor.department_name}"></c:out></span>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="input-group mb-3">
									<span class="input-group-text w-25 p-3">승인상태</span>
									<c:if test="${st_changmajor.a_status == '0'}">
										<span class="w-75 border p-3">미승인</span>
									</c:if>

									<c:if test="${st_changmajor.a_status == '1'}">
										<span class="w-75 border p-3">승인</span>
									</c:if>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end Container -->

	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>