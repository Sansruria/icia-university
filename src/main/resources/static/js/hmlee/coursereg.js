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

	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	*/
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
				let table = $("#courseRegTableBody");
				table.empty(); // 기존 내용을 지움

				// 데이터가 없을 경우 출력
				if (response.length === 0) {
					table.append('<tr class="first last"><td class="NO_RESULT first last" colspan="8">검색된 데이터가 없습니다.</td></tr>');
				} else {
					// forEach를 사용하여 각 아이템에 대한 처리 수행
					//실제 필터링된 데이터 기반으로 리스트 생성 부분

					response.forEach(function(item) {
						console.log(item);
						table.append('<tr data-id="' + item.course_id + '"><td><button class="applyButton" type="button">신청</button></td><td>' + item.grade + "/" + item.semester + '</td><td>' + item.course_division + '</td><td>' + item.course_id + '</td><td>' + item.credit + '</td><td>' + item.course_name + '</td><td>' + item.pf_name + '</td><td>' + item.course_time + '</td></tr>');
					});
				}
			}
		});
	};

	// 초기에 함수를 실행
	updateTable(null, null); // 빈 필터 기준으로 모든 데이터 가져오기

	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	*/

	// '수강신청현황' 테이블에 행을 추가하는 함수
	const addToCourseRegStatusTable = function(rowData) {
		let courseRegStatusTable = $("#courseRegStatusTableBody");
		courseRegStatusTable.append('<tr><td><button class="cancelButton" type="button">취소</button></td><td>' + rowData.grade_semester + '</td><td>' + rowData.course_division + '</td><td>' + rowData.course_id + '</td><td>' + rowData.credit + '</td><td>' + rowData.course_name + '</td><td>' + rowData.pf_name + '</td><td>' + rowData.course_time + '</td></tr>');
		updateNoDataMessage(courseRegStatusTable);
	};

	// 데이터가 없을 때, '데이터 없음.' 텍스트를 업데이트하는 함수
	const updateNoDataMessage = function(tableElement) {
		if (tableElement.find('tr:not([data-hidden=true]):visible').length === 0) {
			tableElement.append('<tr class="first last"><td class="NO_RESULT first last" colspan="8">데이터가 없습니다.</td></tr>');
		} else {
			tableElement.find('.NO_RESULT').parent().remove();
		}
	};

	// '신청' 버튼을 클릭하면 실행되는 함수
	$(document).on('click', '.applyButton', function() {
		const confirmResult = confirm("이 강의를 신청하시겠습니까?");
		if (confirmResult) {
			const rowElement = $(this).closest('tr');
			const rowData = extractRowData(rowElement);
			rowElement.attr("data-hidden", "true"); // 행을 숨겨진 것으로 표시
			rowElement.hide(); // 행 숨기기
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
			rowElement.remove(); // 행 제거
			$(`tr[data-id=${rowData.course_id}]`).attr('data-hidden', 'false').show(); // '수강 신청' 테이블에서 해당 ID의 행을 보여줌
			$.ajax({
				url: '/course/coursereg/oper/cancel',
				method: 'POST',
				data: JSON.stringify(rowData),
				contentType: 'application/json',
				success: function(response) {
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
		return rowData;
	};

	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	*/

	document.getElementById('courseRegisterButton').addEventListener('click', function() {
		// 현재 세션의 ArrayList를 가져옵니다. (구현 방법에 따라 다름)
		const finalCourseList = fetchSessionArrayList();

		// 서버에 AJAX를 통해 ArrayList를 전송합니다.
		$.ajax({
			url: "/course/coursereg/oper/finalapply",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify(finalCourseList),
			success: function(response) {
				alert(response);
				// TODO: 세션을 지우거나 UI를 업데이트하여 등록이 성공했음을 표시합니다.
			},
			error: function(err) {
				alert("오류: " + err);
			}
		});
	});

});
