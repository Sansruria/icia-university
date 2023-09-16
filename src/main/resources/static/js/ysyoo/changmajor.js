$(document).ready(function() {
	// 학부 선택이 변경될 때
	$("#departmentLineSelect").change(function() {
		let departmentLineId = $(this).val(); //
		console.log(departmentLineId)
		$.ajax({
			url: "/sreg/changmajor/rest/getdepart",
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


/*---------update함수-------	*/
function updateTable(departmentLineId, facultyId) {
	$.ajax({
		url: "/sreg/changmajor/rest/getdepart",
		type: "GET",
		data: {
			departmentLineId: departmentLineId,
			facultyId: facultyId
		},
		success: function(data) {
			// 테이블 갱신 로직
			let tableBody = $("#st_data_changmajor"); // 테이블의 tbody에 해당하는 id를 지정하세요.
			tableBody.empty();

			$.each(data, function(indexl, row) {
				let newRow = $("<tr>");
				newRow.append("<td>" + row.semester + "</td>");
				newRow.append("<td>" + row.department_line_name + "</td>");
				newRow.append("<td>" + row.faculty_name + "</td>");
				newRow.append("<td>" + row.department_name + "</td>");
				newRow.append("<td><button class='applyButton' type='button'>신청</button></td>");
				tableBody.append(newRow);
			});
		},
		error: function(error) {
			console.error("데이터를 불러오지 못했습니다.", error);
		}
	});
}
/*---------신청버튼을 눌렀을때 alert창----*/
$(document).on('click', '.applyButton', function() {
	alert("해당 학과를 신청 하시겠습니까? .");
});

/*---------신청버튼을 눌렀을때 테이블에 찾는데이터넣기---*/
$(document).on('click', '.applyButton', function() {
	let tr = $(this).closest('tr');
	let data = {
		semester: tr.find("td:eq(0)").text(),
		departmentLineName: tr.find("td:eq(1)").text(),
		facultyName: tr.find("td:eq(2)").text(),
		departmentName: tr.find("td:eq(3)").text()
	};

	// 새로운 행을 생성 , 데이터에 새로운행 추가.append(newRow); ,조회된내역제거.remove()
	let newRow = $("<tr>");
	newRow.append("<td>" + data.semester + "</td>");
	newRow.append("<td>" + data.departmentLineName + "</td>");
	newRow.append("<td>" + data.facultyName + "</td>");
	newRow.append("<td>" + data.departmentName + "</td>");
	newRow.append("<td><button type='button' class='deleteButton'>삭제</button></td>");
	$("#apply_table tbody").append(newRow);
	$("#apply_table tbody tr:contains('조회된 내역이 없습니다.')").remove();
});


/*-------취소버튼실행------------------------*/

$(document).on('click', '.cancelButton', function() {
    const confirmResult = confirm("취소하시겠습니까?");
    if (confirmResult) {
        const rowElement = $(this).closest('tr');
        const rowData = extractRowData(rowElement);
        rowElement.remove(); 

        // "신청목록" 테이블로 복구하는 코드는 현재 문제 상황에 따라 추가하거나 생략할 수 있습니다.

        $.ajax({
            url: '/sreg/changmajor/cancel', // 경로는 실제 서버 API 경로에 따라 수정해야 함
            method: 'POST',
            contentType: 'application/json',
            success: function(response) {
                // 응답 처리 로직. 예를 들면 "신청목록" 테이블 업데이트나 메시지 표시 등
            }
        });
    }
});

// 테이블의 행에서 데이터를 추출하는 함수입니다.
const extractRowData = function(parentRow) {
    const rowData = {};
    rowData.semester = parentRow.find('td').eq(0).text();          // "학년/학기"
    rowData.departmentLineName = parentRow.find('td').eq(1).text(); // "학과계열"
    rowData.facultyName = parentRow.find('td').eq(2).text();       // "학부"
    rowData.departmentName = parentRow.find('td').eq(3).text();    // "학과"
    return rowData;
};
