$(document).ready(function() {
	// 학부(faculty) 드롭다운이 바뀔 때 실행되는 함수
	$("#facultySelect").change(function() {
		let facultyId = $(this).val();
		$.ajax({
			type: 'GET',
			url: '/course/coursereg/oper/filtering',
			data: { 'facultyId': facultyId },
			success: function(data) {
				// 학과(department) 드롭다운 채우기
				let departmentSelect = $("#departmentSelect");
				departmentSelect.empty();
				departmentSelect.append('<option value="">선택하세요</option>');
				$.each(data, function(index, item) {
					departmentSelect.append('<option value="' + item.department_id + '">' + item.department_name + '</option>');
				});
			}
		});
	});

	/*------------------------------------------------------------------------------------------------------------------------------------------	*/

	// SEARCH 버튼을 클릭했을 때 함수를 실행 (학부, 학과로 필터링한 데이터로 리스트 출력)
	$("#searchButton").click(function() {
		let facultyId = $("#facultySelect").val();
		let departmentId = $("#departmentSelect").val();
		updateTable(facultyId, departmentId);
	});

	// 테이블 업데이트 함수 정의
	const updateTable = function(facultyId, departmentId) {
		$.ajax({
			type: 'GET',
			url: '/course/coursereg/oper/search', // API 엔드포인트
			data: {
				'facultyId': facultyId,
				'departmentId': departmentId
			},
			success: function(response) {
				console.log("Response:", response);
				// 테이블에 데이터를 추가
				let table = $("#courseTableBody");
				table.empty(); // 기존 내용을 지움

				// 데이터가 없을 경우 출력
				if (response.length === 0) {
					table.append('<tr class="first last"><td class="NO_RESULT first last" colspan="8">검색된 데이터 없음.</td></tr>');
				} else {
					// forEach를 사용하여 각 아이템에 대한 처리 수행
					//실제 필터링된 데이터 기반으로 리스트 생성 부분
					
					response.forEach(function(item) {
						console.log(item);
						table.append('<tr><td><button class="applyButton">신청</button></td><td>' + item.grade + "/" + item.semester + '</td><td>' + item.course_division + '</td><td>' + item.course_id + '</td><td>' + item.credit + '</td><td>' + item.course_name + '</td><td>' + item.pf_name + '</td><td>' + item.course_time + '</td></tr>');
					});
				}
			}
		});
	};
	
	// 초기에 함수를 실행
	updateTable(null, null); // 빈 필터 기준으로 모든 데이터 가져오기

	/*------------------------------------------------------------------------------------------------------------------------------------------	*/

});
