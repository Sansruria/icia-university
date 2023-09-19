$(document).ready(function() {
	
	// 학년(grade) 드롭다운이 바뀔 때 실행되는 함수
	$("#gradeSelect").change(function() {
		let grade = $(this).val();
		$.ajax({
			type: 'GET',
			url: '/course/courseselect/oper/filtering',
			data: { 'grade': grade },
			success: function(data) {
				// 학기(semester) 드롭다운 채우기
				let semesterSelect = $("#semesterSelect");
				semesterSelect.empty();
				semesterSelect.append('<option value="">선택하세요</option>');
				$.each(data, function(index, item) {
					semesterSelect.append('<option value="' + item.semester + '">' + item.semester + '</option>');
				});
			}
		});
	});
    
});