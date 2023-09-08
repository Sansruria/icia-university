package kr.ac.icia.controller.coursehistroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.icia.dto.course.CourseHistoryMMDto;
import kr.ac.icia.service.admin.mm.coursehistory.CourseHistoryService;

@RequestMapping("/admin/mm/coursehistory/api")
@RestController
public class CourseHistoryMMRestController {

	@Autowired
	private CourseHistoryService courseHistoryService;
	
	// select, detail, delete는 GetMapping으로
	//등록, 수정은 PostMapping으로
	//등록
	@PostMapping("/write")
	public String write(CourseHistoryMMDto courseHistoryMMDto) {
		return courseHistoryService.write(courseHistoryMMDto);
	}
}
