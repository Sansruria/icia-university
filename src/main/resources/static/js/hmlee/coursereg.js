$(document).ready(function() {

	$.ajax({
		url: '/course/coursereg/oper/userid', // 서버에 세션 정보를 가져오는 API 주소
		method: 'GET',
		success: function(data) {
			let userId = data.userId; // 사용자 ID를 가져옵니다.

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

			// 초기화 버튼 클릭 이벤트
			$("#resetButton").click(function() {

				// select 박스 초기화
				$("#facultySelect").val(""); // 또는 초기 값으로 변경
				$("#departmentSelect").val(""); // 또는 초기 값으로 변경

				// 테이블 초기화
				let table1 = $("#courseRegTableBody");
				let table2 = $("#courseRegStatusTableBody");
				table1.empty();
				table1.append('<tr class="first last"><td class="NO_RESULT first last" colspan="8"> 검색된 데이터가 없습니다.</td></tr>');// 초기 상태의 메시지 또는 내용
				table2.empty();
				table2.append('<tr class="first last"><td class="NO_RESULT first last" colspan="8"> 검색된 데이터가 없습니다.</td></tr>');

				// 과목수와 학점도 초기화
				$("#totalCourses").html("과목수 : 0개");
				$("#totalCredits").html("학점 : 0점");
			});

			function updateSummary(tableBodySelector, totalCoursesSelector, totalCreditsSelector) {
				const rows = $(tableBodySelector).find('tr:not([data-hidden="true"])');  // 숨겨진 행은 제외
				let totalCourses1 = 0;
				let totalCredits1 = 0;
				let totalCourses2 = 0;
				let totalCredits2 = 0;

				rows.each(function() {
					const cells = $(this).find('td');
					// 컬럼 인덱스는 예시이므로 실제 인덱스로 변경해야 할 수 있습니다.
					const credits = parseInt(cells.eq(4).text().trim(), 10);
					if (isNaN(credits)) return;  // 학점이 없는 행이라면 건너뛴다.

					totalCourses1++;
					totalCredits1 += credits;
					totalCourses2++;
					totalCredits2 += credits;
				});

				$(totalCoursesSelector).text(`과목수: ${totalCourses1}개`);
				$(totalCreditsSelector).text(`학점: ${totalCredits1}점`);
				$(totalCoursesSelector).text(`과목수: ${totalCourses2}개`);
				$(totalCreditsSelector).text(`학점: ${totalCredits2}점`);
			}

			// SEARCH 버튼을 클릭했을 때 함수를 실행 (학부, 학과로 필터링한 데이터로 리스트 출력)
			$("#searchButton").click(function() {

				// 로그인한 사용자가 학생인지, 교사인지, 관리자인지 검사
				if (userId.startsWith('P') || userId === 'admin') {
					$("#alert-placeholder").html('<div class="alert alert-danger" role="alert">수강신청 조회는 해당 학생만 가능합니다.</div>');
					return;
				}

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
						updateSummary('#courseRegTableBody', '#totalCourses1', '#totalCredits1');
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
						//						console.log("Response:", response); // Debugging: 응답 확인
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

								//								console.log(item); // Debugging: 아이템 확인
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
							updateSummary('#courseRegStatusTableBody', '#totalCourses2', '#totalCredits2'); // 수강신청현황 요약 정보 업데이트
							updateSummary('#courseRegTableBody', '#totalCourses1', '#totalCredits1'); // 수강신청 가능한 목록 요약 정보 업데이트
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
							updateSummary('#courseRegStatusTableBody', '#totalCourses2', '#totalCredits2'); // 수강신청현황 요약 정보 업데이트
							updateSummary('#courseRegTableBody', '#totalCourses1', '#totalCredits1'); // 수강신청 가능한 목록 요약 정보 업데이트
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

			//			// 데이터가 올바른 형태인지 검사하는 함수
			//			function isValidCourse(obj) {
			//				// 필요한 필드들을 모두 검사
			//				return obj.hasOwnProperty('course_division') &&
			//					obj.hasOwnProperty('credit') &&
			//					obj.hasOwnProperty('grade_semester') &&
			//					obj.hasOwnProperty('course_name') &&
			//					obj.hasOwnProperty('pf_name') &&
			//					obj.hasOwnProperty('course_time');
			//			}

			// '수강신청' 버튼 클릭 이벤트
			$("#courseRegisterButton").click(function() {

				// 로그인한 사용자가 학생인지, 교사인지, 관리자인지 검사
				if (userId.startsWith('P') || userId === 'admin') {
					$("#alert-placeholder").html('<div class="alert alert-danger" role="alert">수강신청 조회는 해당 학생만 가능합니다.</div>');
					return;
				}

				// 세션에서 최종 수강신청 목록 가져와서 저장
				const finalCourseList = fetchSessionArrayList();

				//				// 데이터가 올바른 형태를 가지고 있는지 검사
				//				if (finalCourseList.every(isValidCourse)) {
				//					console.log('모든 과목이 유효합니다');
				//				} else {
				//					console.log('유효하지 않은 과목이 있습니다');
				//					return; // 여기서 함수 종료
				//				}

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
					};
				});

				// 서버로 데이터를 보낼 때 사용할 FinalApplyDto 객체 생성
				const finalApplyDto = {
					courses: updatedCourseList
				};

				// finalApplyDto가 어떤 형태로 존재하는지 콘솔에 출력
				console.log("finalApplyDto:", finalApplyDto);
				console.log("JSON.stringify(finalApplyDto) :", JSON.stringify(finalApplyDto));

				// 서버로 AJAX 요청을 보내서 최종 수강신청 처리
				fetch("/course/coursereg/oper/finalapply", {
					method: "POST",
					headers: {
						"Content-Type": "application/json; charset=utf-8",
					},
					body: JSON.stringify(finalApplyDto)  // FinalApplyDto를 JSON 형태로 변환
				})
					.then(response => response.json())
					.then(data => {
						console.log("서버 응답:", data);
						if (data.status === 'success') {
							alert("수강신청이 완료되었습니다.");
							updateSummary('#courseRegStatusTableBody', '#totalCourses2', '#totalCredits2');
							// 메인 화면으로 이동
							window.location.href = '/sreg/st/main';
						} else if (data.status === 'previousCourse') {
							alert("이전에 수강이력이 있어 수강신청이 불가능합니다.");
						} else {
							alert("수강신청에 실패하였습니다.");
						}
					})
					.catch((error) => {
						console.log("서버 에러:", error);
						alert("오류: " + JSON.stringify(error));
					});
			});
		}
	});

});