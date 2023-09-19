$(document).ready(function() {

	// 사용자 ID를 얻기 위한 AJAX 호출
	$.ajax({
		url: '/course/courseselect/oper/userid', // 서버에 세션 정보를 가져오는 API 주소
		method: 'GET',
		success: function(data) {
			let userId = data.userId; // 사용자 ID를 가져옵니다.

			// 초기화 버튼 클릭 이벤트
			$("#resetButton").click(function() {

				// select 박스 초기화
				$("#gradeSelect").val(""); // 또는 초기 값으로 변경
				$("#semesterSelect").val(""); // 또는 초기 값으로 변경

				// 테이블 초기화
				let table = $("#courseRegTableBody");
				table.empty();
				table.append('<tr class="first last"><td class="NO_RESULT first last" colspan="8"><img src="/img/no.jpg" alt="No data available" style="width: 150px; height: 150px;"> 검색된 데이터가 없습니다.</td></tr>');// 초기 상태의 메시지 또는 내용

				// 과목수와 학점도 초기화
				$("#totalCourses").html("과목수 : 0개");
				$("#totalCredits").html("학점 : 0점");
			});

			// 검색 버튼 클릭 이벤트
			$("#searchButton").click(function() {
				let grade = $("#gradeSelect").val(); // 선택된 학년 값
				let semester = $("#semesterSelect").val(); // 선택된 학기 값

				// 로그인한 사용자가 학생인지, 교사인지, 관리자인지 검사
				if (userId.startsWith('P') || userId === 'admin') {
					$("#alert-placeholder").html('<div class="alert alert-danger" role="alert">수강신청 조회는 해당 학생만 가능합니다.</div>');
					return;
				}

				// Ajax 요청을 보냄
				$.ajax({
					type: 'GET',
					url: '/course/courseselect/oper/search', // 서버로 요청을 보낼 URL
					data: {
						'grade': grade,
						'semester': semester
					},
					success: function(response) { // 성공 시
						// 테이블 업데이트 부분
						let table = $("#courseRegTableBody");
						table.empty(); // 기존 내용을 지움

						let totalCourses = 0;
						let totalCredits = 0;

						// 데이터가 없을 경우 출력
						if (response.length === 0) {
							table.append('<tr class="first last"><td class="NO_RESULT first last" colspan="8"><img src="/img/no.jpg" alt="No data available" style="width: 150px; height: 150px;"> 검색된 데이터가 없습니다.</td></tr>');
						} else {
							// 실제 필터링된 데이터 기반으로 리스트 생성 부분
							response.forEach(function(item) {
								table.append(`<tr data-id="${item.req_course_id}"><td>${item.req_grade}/${item.req_semester}</td><td>${item.req_course_division}</td><td>${item.course_id}</td><td>${item.req_credit}</td><td>${item.req_course_name}</td><td>${item.req_pf_name}</td><td>${item.req_course_time}</td><td>${item.reapply}</td></tr>`);

								totalCourses++;
								totalCredits += item.req_credit;
							});

							// HTML에 총 과목수와 학점을 출력
							$("#totalCourses").html(`과목수 :  ${totalCourses}개`);
							$("#totalCredits").html(`학점 :  ${totalCredits}점`);
						}
					},
					error: function(err) { // 실패 시
						console.error("Error: ", err);
					}
				});
			});
		}
	});

});