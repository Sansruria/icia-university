//$(document).ready(function() {
//	function fetchDataAndPopulateTable() {
//		$.ajax({
//			method: "GET",
//			url: '/admin/mm/courselist/list',
//			dataType: 'json',
//			success: function(data) {
//				var tableBody = $('#table-body');
//				tableBody.empty();
//
//				$.each(data, function(index, courseh) {
//					var row = '<tr>' +
//						'<td>' + courseh.rnum + '</td>' +
//						'<td>' + courseh.course_id + '</td>' +
//						'<td>' + courseh.course_division + '</td>' +
//						'<td>' + courseh.deptName + '</td>' +
//						'<td>' + courseh.course_name + '</td>' +
//						'<td>' + courseh.pf_name + '</td>' +
//						'<td>' + courseh.course_schedule + '</td>' +
//						'<td>' + courseh.limit_max_count + '</td>' +
//						'<td>' + courseh.status + '</td>' +
//						'</tr>';
//					tableBody.append(row);
//				});
//
//				console.log(data);
//			},
//			error: function() {
//				console.error('데이터를 가져오는 중 오류가 발생했습니다.');
//			}
//		});
//	}
//
//	$(document).ready(function() {
//		// "저장" 버튼 클릭 시 save 메소드 호출
//		$('.btn-save').click(function() {
//			save();
//			fetchDataAndPopulateTable();
//		});
//	});
//});