<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전과신청</title>
<jsp:include page="/WEB-INF/views/layout/head-js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/head-css.jsp"></jsp:include>
</head>

<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="container">
		<div class="row mb-4">
			<div class="col">
				<span class="fs-2"><img alt="" src="/img/changm.png"></span>
			</div>
		</div>

		<div class="row mb-4">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col mb-2 fs-3">전과신청 유의사항</div>
					</div>

					<div class="row">
						<div class="col">
							<ul class="list-group-item">
								<li class="list-group-item mb-2">1.전과 신청및 일자 및 안내사항은 공지사항
									참조.</li>
								<li class="list-group-item mb-2">2.전과는 기간내 한학기에 1회만 가능합니다.</li>
								<li class="list-group-item mb-2">3.전과신청후 학적변동 사항은 전과조회페이지에서
									처리상태 확인해 주세요.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="card">
				<div class="card-body">
					<div class="table-responsive text-center">
						<table class="table table-bordered align-middle">
							<thead class="table-primary">
								<tr>
									<th>신청구분</th>
									<th>신청기간</th>
									<th>2023년도 2학기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>전과</td>
									<td>20223.11.01 - 2024.01.19</td>
									<td><a href="/sreg/stchangm/update"><button
												type="button" class="btn btn-primary">신청하기</button></a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>

</html>
