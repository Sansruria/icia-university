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
//function updateTable(departmentLineId, facultyId) {
//	$.ajax({
//		url: "/sreg/changmajor/rest/getdepart",
//		type: "GET",
//		data: {
//			departmentLineId: departmentLineId,
//			facultyId: facultyId
//		},
//		success: function(data) {
//			// 테이블 갱신 로직
//			let tableBody = $("#st_data_changmajor"); // 테이블의 tbody에 해당하는 id를 지정하세요.
//			tableBody.empty();
//
//			$.each(data, function(indexl, row) {
//				let newRow = $("<tr>");
//				console.log(row);
//				newRow.append("<td>" + "${memberInfo.grade}학년"+"/"+"${memberInfo.semester}학기" + "</td>");
//				newRow.append("<td>" + row.department_line_name + "</td>");
//				newRow.append("<td>" + row.faculty_name + "</td>");
//				newRow.append("<td>" + row.department_name + "</td>");
//				newRow.append("<td><button class='applyButton' type='button'>신청</button></td>");
//				tableBody.append(newRow);
//			});
//		},
//		error: function(error) {
//			console.error("데이터를 불러오지 못했습니다.", error);
//		}
//	});
//}
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
	newRow.append("<td><input type='hidden' name='department_line_name' value='"+ data.departmentLineName +"'>" + data.departmentLineName + "</td>");
	newRow.append("<td><input type='hidden' name='facultyName' value='"+ data.facultyName +"'>" + data.facultyName + "</td>");
	newRow.append("<td><input type='hidden' name='departmentName' value='"+ data.departmentName +"'>" + data.departmentName + "</td>");
	newRow.append("<td><button type='button' class='btn btn-danger deleteButton'>삭제</button></td>");
	$("#apply_table tbody").append(newRow);
	$("#apply_table tbody tr:contains('조회된 내역이 없습니다.')").remove();
});


/*-------취소버튼실행------------------------*/


$(document).on('click', '.deleteButton', function() {
    const confirmResult = confirm("이 학과 신청을 삭제하시겠습니까?");
    if (confirmResult) {
        const rowElement = $(this).closest('tr');
        rowElement.remove(); // 해당 행 제거

        alert("학과 신청이 삭제되었습니다.");

        // "조회된 내역이 없습니다." 메시지를 표시하는 로직
        const applyTableBody = $("#apply_table tbody");
        if (applyTableBody.children().length === 0) {
            applyTableBody.append("<tr><td colspan='5'>조회된 내역이 없습니다.</td></tr>");
        }
    }
});






