<%--
  User: 오세훈
  Date: 2023/09/09
  Time: 12:51
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css"
		integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
	<div class="container">
		<div class="row">
			<div class="col-lg-5 col-md-6">
				<div class="mb-2">
					<img src="/img/park.png">
				</div>
				<div class="mb-2 d-flex">
				
					<h4 class="font-weight-normal">박성주</h4>

				</div>
				<div class="mb-2">
					<ul class="list-unstyled">
						<li class="media"><span
							class="w-25 text-black font-weight-normal"> 학번 :</span> <label
							class="media-body">2309NET1003</label></li>
						<li class="media"><span
							class="w-25 text-black font-weight-normal">학과: </span> <label
							class="media-body">컴퓨터공학</label></li>
						<li class="media"><span
							class="w-25 text-black font-weight-normal"> 이메일 </span> <label
							class="media-body"> sj@icia.com</label></li>

					</ul>
				</div>
			</div>
			<div class="col-lg-7 col-md-6 pl-xl-3">
				<h5 class="font-weight-normal">ICIA UNIV 공지사항</h5>
				<p> * 수강신청 관련 안내 공지사항 입니다.</p>
					<p>* 전과 관련 신청 관련 공지사항 입니다.</p>
					<p>* 자퇴 신청 관련 안내 공지사항 입니다.</p>
					<p>* 개인정보 변경 사항 관련	공지사항 입니다.				
					</p>
				<div class="my-2 bg-light p-2">
					<p class="font-italic mb-0">The price is something not
						necessarily defined as financial. It could be time, effort,
						sacrifice, money or perhaps, something else.</p>
				</div>
				<ul class="list list-unstyled mb-3">
					<li class="text-secondary font-weight-normal mb-1"><span
						class="ti-arrow-right pr-1 text-primary"></span> Commitment is
						something that comes from understanding that!</li>
					<li class="text-secondary font-weight-normal mb-1"><span
						class="ti-arrow-right pr-1 text-primary"></span> Its price and
						then having the willingness to pay that price.</li>
					<li class="text-secondary font-weight-normal mb-1"><span
						class="ti-arrow-right pr-1 text-primary"></span> Out after the
						fact that the price was too high.</li>
					<li class="text-secondary font-weight-normal mb-1"><span
						class="ti-arrow-right pr-1 text-primary"></span> This is important
						because nobody wants to put significant.</li>
				</ul>
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





















	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</body>
</html>
