$(document).ready(function() {
	$("#facultySelect").change(function() {
		var facultyId = $(this).val();

		// 학부가 선택되면 관련 학과를 가져옵니다.
		if (facultyId) {
			// 선택된 facultyId를 이용하여 서버에서 관련 학과 정보를 가져옵니다.
			$.ajax({
				url: 'http://localhost/course/coursereg/oper/getDepartments',
				type: 'GET',
				data: { facultyId: facultyId },
				success: function(response) {
					// 이전 옵션을 지웁니다.
					$("#departmentSelect").empty().append('<option value="">선택</option>');

					// 학과 드롭다운을 새로운 옵션으로 채웁니다.
					// response가 { id, name }의 배열이라고 가정합니다.
					response.forEach(function(department) {
						$("#departmentSelect").append('<option value="' + department.id + '">' + department.name + '</option>');
					});
				}
			});
		}
	});
	//	// 페이지 로딩 후 실행됨
	//	fetchDepartments();
	//	fetchCourses();
	//
	//	// 학과 또는 학교가 변경될 때 과목 검색
	//	function fetchCourses() {
	//		var faculty = $("#facultySelect").val();
	//		var department = $("#departmentSelect").val();
	//		$.ajax({
	//			type: "GET",
	//			url: "/course/coursereg/oper/list",
	//			data: { faculty_Id: faculty, department_Id: department },
	//			success: function(data) {
	//				// UI에 과목 데이터 반영 로직
	//			}
	//		});
	//	}
	//
	//	$("#lessnSyy").change(fetchCourses);
	//	$("#lessnSemstCode").change(fetchCourses);
	//
	//	// 첫 번째 폼에 대한 사용자 지정 유효성 검사 함수
	//	function validateForm() {
	//		var faculty = $("#lessnSyy").val();
	//		var department = $("#lessnSemstCode").val();
	//		if (faculty === "" || department === "") {
	//			alert("학부와 학과는 필수 필드입니다.");
	//			return false;
	//		}
	//		return true;
	//	}
	//
	//	function fetchFilteredData() {
	//		var faculty = $("#lessnSyy").val();
	//		var department = $("#lessnSemstCode").val();
	//		$.ajax({
	//			type: "GET",
	//			url: "/course/coursereg/oper/list",
	//			data: { departmentId: department, facultyId: faculty },
	//			success: function(response) {
	//				// 표에 데이터를 채우는 코드는 여기에 들어갑니다.
	//			}
	//		});
	//	}
	//
	//	$("#searchBtn").click(function() {
	//		if (validateForm()) {
	//			fetchFilteredData();
	//		}
	//	});
	//
	//	// 학과 선택 시 부서 목록 업데이트
	//	function fetchDepartments() {
	//		var facultyId = $("#facultySelect").val();
	//		$.ajax({
	//			type: "GET",
	//			url: "/course/coursereg/oper/search",
	//			data: { facultyId: facultyId },
	//			success: function(data) {
	//				var departmentSelect = $("#departmentSelect");
	//				departmentSelect.empty();
	//				departmentSelect.append('<option value="">Select</option>');
	//				for (var i = 0; i < data.length; i++) {
	//					departmentSelect.append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
	//				}
	//			}
	//		});
	//	}
	//
	//	$("#facultySelect").change(function() {
	//		var facultyId = $(this).val();
	//		$.ajax({
	//			url: "/course/coursereg/oper/search",
	//			method: "GET",
	//			data: { facultyId: facultyId },
	//			success: function(data) {
	//				$("#departmentSelect").empty();
	//				$.each(data, function(index, department) {
	//					$("#departmentSelect").append(
	//						$('<option>', {
	//							value: department.departmentId,
	//							text: department.departmentName
	//						})
	//					);
	//				});
	//			}
	//		});
	//	});
	//
	//	// 새 학과가 선택될 때 실행
	//	$("#facultySelect").change(fetchDepartments);
	//
	//	// 이 부분은 새로 추가된 코드입니다.
	//	// 부서 선택 드롭다운이 포커스되면 동적으로 학과 목록을 가져옵니다.
	//	$('#facultySelect').on('focus', function() {
	//		// 기존 옵션을 지웁니다.
	//		$('#facultySelect').html('<option value="">Select</option>');
	//
	//		// 여기에 서버에서 가져온 학과 목록을 채울 수 있습니다.
	//		// 예시 코드:
	//		fetchDepartments();  // 기존의 fetchDepartments 함수를 재사용합니다.
	//	});
	//
	//	// 학과가 선택되면 부서 목록을 동적으로 채웁니다.
	//	$('#facultySelect').on('change', function() {
	//		const selectedFaculty = $(this).val();
	//
	//		// 기존 옵션을 지웁니다.
	//		$('#departmentSelect').html('<option value="">Select</option>');
	//
	//		// 여기에 선택한 학과에 따라 부서 목록을 채울 수 있습니다.
	//		// 예시 코드:
	//		fetchDepartments();  // 기존의 fetchDepartments 함수를 재사용합니다.
	//	});
});
