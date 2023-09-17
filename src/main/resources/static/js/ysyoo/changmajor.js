$(document).ready(function() {
	// 학부 선택이 변경될 때
	$("#departmentLineSelect").change(function() {
		let departmentLineId = $(this).val(); //
		console.log(departmentLineId)
		$.ajax({
			url: "/sreg/changmajor/rest/getdepart", // 
			type: "GET",
			data: { departmentLineId: departmentLineId },
			success: function(data) {

				let facultySelect = $("#facultySelect")
				$("#facultySelect").empty();
				$("#facultySelect").append("<option value=''>선택</option>");

				// 받아온 학과 데이터를 선택 목록에 추가
				$.each(data, function(index, faculty) {
					facultySelect.append("<option value='" + faculty.faculty_id + "'>" + faculty.faculty_name + "</option>");
				});
			},
			error: function(data) {
				console.log('res :', res)
				console.error("학부 데이터를 불러오지 못했습니다.");
			}
		});
	});
});
/*---------목록담기 버튼눌렀을때 핸들러-------	*/

$('#searchButton').click(function() {
	let departmentLineId = $('#departmentLineSelect').val();
	let facultyId = $('#facultySelect').val();
	updateTable(departmentLineId, facultyId);
});

/*--------updateTable----------------------	*/
// 테이블 업데이트 함수 정의
const updateTable = function(departmentLineId, facultyId) {
	$.ajax({
		type: 'GET',
		url: "/sreg/changmajor/rest/getdepart",
		data: {
			'departmentLineId': departmentLineId,
			'facultyId': facultyId
		},
		success: function(response) {
			console.log("Response:", response);
			let table = $("#changMajorTableBody");
			table.empty(); // 기존 내용을 지움


			// 데이터가 없을 경우출력
			if (response.length === 0) {
				table.append('<tr id="add_1" class="temp_1"><td class="deltd_1" colspan="4">조회된데이터없음</td></tr>');
			} else {
				response.forEach(function(item) {
					console.log(item);
					table.append('<tr data-id="' + item.changmajor_id + '"><td><button class="applyButton" type="button">신청</button></td><td>' + item.semester + "/" + item.departmentLineId + '</td><td>' + item.departmentLine + '</td></tr>');
				});
			}
		}
	});
};
