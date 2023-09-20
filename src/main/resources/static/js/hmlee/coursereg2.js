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

	// SEARCH 버튼을 클릭했을 때 함수를 실행 (학부, 학과로 필터링한 데이터로 리스트 출력)
	$("#searchButton").click(function() {
    // 데이터 초기화 AJAX 호출
    $.ajax({
        type: 'GET',
        url: '/course/coursereg/oper/reset', // 서버의 데이터 초기화 엔드포인트
        success: function(response) {
            // 세션 및 sessionStorage 초기화
            sessionStorage.removeItem('courseRegList');
            
            // 수강신청 현황 테이블도 초기화
            $("#courseRegStatusTableBody").empty();
            updateNoDataMessage($("#courseRegStatusTableBody"));
            
            // 데이터를 초기화한 후 테이블 업데이트
            let facultyId = $("#facultySelect").val();
            let departmentId = $("#departmentSelect").val();
            updateTable(facultyId, departmentId);
        }
    });
});

	// 테이블 업데이트 함수 정의
	const updateTable = function(facultyId, departmentId) {
		$.ajax({
			type: 'GET',
			url: '/course/coursereg/oper/search',
			data: {
				'facultyId': facultyId,
				'departmentId': departmentId
			},
			success: function(response) {
				console.log("Response:", response); // Debugging: 응답 확인
				let table = $("#courseRegTableBody");
				table.empty(); // 기존 내용을 지움

				let courseRegList = sessionStorage.getItem('courseRegList');
				if (courseRegList !== null) {
					courseRegList = JSON.parse(courseRegList);
				} else {
					courseRegList = [];
				}

				// 데이터가 없을 경우 출력
				if (response.length === 0) {
					table.append('<tr class="first last"><td class="NO_RESULT first last" colspan="8">검색된 데이터가 없습니다.</td></tr>');
				} else {
					// forEach를 사용하여 각 아이템에 대한 처리 수행
					response.forEach(function(item) {
						// 이미 신청한 과목이면 패스
						if (courseRegList.some(regItem => regItem.course_id === item.course_id)) return;

						console.log(item); // Debugging: 아이템 확인
						table.append('<tr data-id="' + item.course_id + '"><td><button class="applyButton" type="button">신청</button></td><td>' + item.grade + "/" + item.semester + '</td><td>' + item.course_division + '</td><td>' + item.course_id + '</td><td>' + item.credit + '</td><td>' + item.course_name + '</td><td>' + item.pf_name + '</td><td>' + item.course_time + '</td></tr>');
					});
				}
			}
		});
	};

	// '수강신청현황' 테이블에 행을 추가하는 함수
	const addToCourseRegStatusTable = function(rowData) {
		let courseRegStatusTable = $("#courseRegStatusTableBody");
		courseRegStatusTable.append('<tr><td><button class="cancelButton" type="button">취소</button></td><td>' + rowData.grade_semester + '</td><td>' + rowData.course_division + '</td><td>' + rowData.course_id + '</td><td>' + rowData.credit + '</td><td>' + rowData.course_name + '</td><td>' + rowData.pf_name + '</td><td>' + rowData.course_time + '</td></tr>');
		updateNoDataMessage(courseRegStatusTable);
	};

	const updateNoDataMessage = function(tableElement) {
		let noDataMessageElement = tableElement.find('td:contains("조회된 데이터가 없습니다")').parent();

		// 보이는 행과 숨겨진 행의 개수를 구합니다.
		let visibleRows = tableElement.find('tr:not([data-hidden=true]):visible').length;
		let hiddenRows = tableElement.find('tr[data-hidden=true]').length;

		// "조회된 데이터가 없습니다" 메시지가 이미 있다면 그것을 먼저 지웁니다.
		if (noDataMessageElement.length > 0) {
			noDataMessageElement.remove();
		}

		// 실제로 보이는 행이 없을 경우에만 "조회된 데이터가 없습니다" 메시지를 추가합니다.
		if (visibleRows === 0) {
			tableElement.append('<tr><td colspan="8">조회된 데이터가 없습니다</td></tr>');
		}

	};

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	*/

	// '신청' 버튼을 클릭하면 실행되는 함수
	$(document).on('click', '.applyButton', function() {
		const confirmResult = confirm("이 강의를 신청하시겠습니까?");
		if (confirmResult) {
			const rowElement = $(this).closest('tr');
			const rowData = extractRowData(rowElement);
			rowElement.attr("data-hidden", "true").hide(); // 행을 숨깁니다.

			// AJAX 요청을 사용하여 서버 측에 데이터 추가
			$.ajax({
				url: '/course/coursereg/oper/apply',
				method: 'POST',
				data: JSON.stringify(rowData),
				contentType: 'application/json',
				success: function(response) {
					addToCourseRegStatusTable(rowData);
				}
			});
		}
	});

	// '취소' 버튼을 클릭하면 실행되는 함수
	$(document).on('click', '.cancelButton', function() {
		const confirmResult = confirm("이 강의를 취소하시겠습니까?");
		if (confirmResult) {
			const rowElement = $(this).closest('tr');
			const rowData = extractRowData(rowElement);
			// '수강신청' 테이블에서 해당 행을 다시 보이게 합니다.
			$("#courseRegTableBody").find(`tr[data-id=${rowData.course_id}]`).removeAttr("data-hidden").show();

			// AJAX 요청을 사용하여 서버 측에 데이터 삭제
			$.ajax({
				url: '/course/coursereg/oper/cancel',
				method: 'POST',
				data: JSON.stringify(rowData),
				contentType: 'application/json',
				success: function(response) {
					rowElement.remove();
					updateNoDataMessage($("#courseRegStatusTableBody"));
				}
			});
		}
	});

	// 테이블의 행에서 데이터를 추출하는 함수입니다.
	const extractRowData = function(parentRow) {
		const rowData = {};
		rowData.grade_semester = parentRow.find('td').eq(1).text();  // "학년/학기"
		rowData.course_division = parentRow.find('td').eq(2).text(); // "구분"
		rowData.course_id = parentRow.find('td').eq(3).text();       // "강의 번호"
		rowData.credit = parentRow.find('td').eq(4).text();          // "학점"
		rowData.course_name = parentRow.find('td').eq(5).text();     // "과목명"
		rowData.pf_name = parentRow.find('td').eq(6).text();         // "교수명"
		rowData.course_time = parentRow.find('td').eq(7).text();     // "강의 시간"

		console.log("테이블에서 추출된 데이터:", rowData); // 추출된 데이터 출력

		return rowData;
	};

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	*/

	


});