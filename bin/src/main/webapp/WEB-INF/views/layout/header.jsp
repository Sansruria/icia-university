<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg mb-4"
	style="background-color: #0B1B40">
	<div class="container">
		<a class="navbar-brand" href="/"> <img src="/img/icia-logo.png"
			alt="icia" height="60">
		</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="row">
			<div class="text-end text-white">
				<a href="#" class="nav-link">로그아웃</a>
			</div>

			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-white" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 학적 </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/stchangm">전과신청메인</a></li>
							<li><a class="dropdown-item" href="/sreg/stchangm/update">전과신청화면</a></li>
							<li><a class="dropdown-item"
								href="/sreg/stchangm/update/list">전과조회페이지</a></li>
							<li><a class="dropdown-item" href="/sreg/dropout/list">자퇴신청</a></li>
							<li><a class="dropdown-item" href="/sreg/mm/dropoout/list">자퇴관리</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-white" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 수강 </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/course/coursereg/list">수강신청</a></li>
							<li><a class="dropdown-item"
								href="/course/courseselect/list">수강조회</a></li>
							<li><a class="dropdown-item" href="/course/courseevreg/list">강의평가</a></li>
							<li><a class="dropdown-item" href="/course/courseev/list">강의평가조회</a></li>
							<li><a class="dropdown-item"
								href="/course/syllabusreg/oper/list">수업계획서 등록</a></li>
							<li><a class="dropdown-item"
								href="/course/mm/courselist/list">수강내역관리</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-white" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 시스템 </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/sreg/st">학생관리</a></li>
							<li><a class="dropdown-item" href="/sreg/pf">교수관리</a></li>
							<li><a class="dropdown-item" href="/admin/mm/dept">학과계열관리</a></li>
							<li><a class="dropdown-item" href="/admin/mm/faculty">학부관리</a></li>
							<li><a class="dropdown-item" href="/admin/mm/dept">학과관리</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
</nav>