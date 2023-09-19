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

	// 페이지가 로딩되었을 때 세션 초기화
	function initializeSession() {
		sessionStorage.removeItem('finalCourseList');
	}

	// SEARCH 버튼을 클릭했을 때 함수를 실행 (학부, 학과로 필터링한 데이터로 리스트 출력)
	$("#searchButton").click(function() {
		// 세션 스토리지 초기화
		sessionStorage.removeItem('finalCourseList');
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
				console.log("Response:", response); // Debugging: 응답 확인
				console.log("Response:", response);
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


	// '신청' 버튼을 클릭하면 실행되는 함수
	$(document).on('click', '.applyButton', function() {
		const confirmResult = confirm("이 강의를 신청하시겠습니까?");
		if (confirmResult) {
			const rowElement = $(this).closest('tr');
			const rowData = extractRowData(rowElement);
			let storedCourses = JSON.parse(sessionStorage.getItem('finalCourseList') || "[]");

			// 중복 데이터 체크
			const isDuplicate = storedCourses.some((course) => {
				return course.course_id === rowData.course_id;
			});

			if (isDuplicate) {
				alert("이미 신청한 강의입니다.");
				return;
			}

			rowElement.attr("data-hidden", "true"); // 행을 숨겨진 것으로 표시
			rowElement.hide(); // 행 숨기기

			// 행을 숨긴 후에 "조회된 데이터가 없습니다" 메시지의 상태를 업데이트합니다.
			const tableElement = rowElement.closest('#courseRegTableBody');
			console.log("tableElement:", tableElement);  // 디버깅을 위해 로그를 출력
			updateNoDataMessage(tableElement);

			storedCourses.push(rowData); // 배열에 데이터 추가
			sessionStorage.setItem('finalCourseList', JSON.stringify(storedCourses)); // 세션 스토리지에 데이터 저장

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

			let storedCourses = JSON.parse(sessionStorage.getItem('finalCourseList') || "[]");
			storedCourses = storedCourses.filter((course) => {
				return course.course_id !== rowData.course_id;
			});
			sessionStorage.setItem('finalCourseList', JSON.stringify(storedCourses)); // 업데이트된 배열을 세션 스토리지에 다시 저장

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

		console.log("테이블에서 추출된 데이터:", rowData); // 추출된 데이터 출력

		return rowData;
	};

	/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	*/

	// 세션에서 최종 수강신청 목록을 가져오는 함수
	const fetchSessionArrayList = function() {
		const arrayList = JSON.parse(sessionStorage.getItem('finalCourseList')) || [];
		console.log("세션에서 가져온 최종 수강신청 목록:", arrayList);
		return arrayList;
	};

	// 데이터가 올바른 형태인지 검사하는 함수
	function isValidCourse(obj) {
		// 필요한 필드들을 모두 검사
		return obj.hasOwnProperty('course_division') &&
			obj.hasOwnProperty('credit') &&
			obj.hasOwnProperty('grade_semester') &&
			obj.hasOwnProperty('course_name') &&
			obj.hasOwnProperty('pf_name') &&
			obj.hasOwnProperty('course_time');
	}

	// '수강신청' 버튼 클릭 이벤트
	$("#courseRegisterButton").click(function() {
		// 세션에서 최종 수강신청 목록 가져와서 저장
		const finalCourseList = fetchSessionArrayList();

		// 데이터가 올바른 형태를 가지고 있는지 검사
		if (finalCourseList.every(isValidCourse)) {
			console.log('모든 과목이 유효합니다');
		} else {
			console.log('유효하지 않은 과목이 있습니다');
			return; // 여기서 함수 종료
		}

		// 수강신청 목록이 비어있는 경우 사용자에게 알림
		if (finalCourseList.length === 0) {
			alert("수강신청 목록이 비어 있습니다.");
			return; // 여기서 함수 종료
		}

		// grade와 semester로 분리 및 필요한 필드 추가
		const updatedCourseList = finalCourseList.map(course => {
			const { grade_semester, ...rest } = course;
			const [grade, semester] = grade_semester.split('/');
			return {
				...rest,
				grade,
				semester,
				reg_course_id: 'CR2',
				req_st_id: '2309D101',
				req_st_count: '1',
				course_time: '월 10:00~17:00'
			};
		});

		// 서버로 데이터를 보낼 때 사용할 FinalApplyDto 객체 생성
		const finalApplyDto = {
			courses: updatedCourseList
		};
		
		// finalApplyDto가 어떤 형태로 존재하는지 콘솔에 출력
console.log("finalApplyDto:", finalApplyDto);

		// 서버로 AJAX 요청을 보내서 최종 수강신청 처리
		fetch("/course/coursereg/oper/finalapply", {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify(finalApplyDto)  // FinalApplyDto를 JSON 형태로 변환
		})
			.then(response => response.json())
			.then(data => {
				console.log("서버 응답:", data);
				if (data.status === 'success') {
					alert("수강신청이 완료되었습니다.");
				} else {
					alert("수강신청에 실패하였습니다.");
				}
			})
			.catch((error) => {
				console.log("서버 에러:", error);
				alert("오류: " + JSON.stringify(error));
			});
	});

});
