 package kr.ac.icia.controller.coursehistroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.icia.dto.course.CourseHistoryMMDto;
import kr.ac.icia.service.admin.mm.coursehistory.CourseHistoryService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CourseHistroyMM {
	
	@Autowired
	private CourseHistoryService courseHistoryService;
	
	// 수강내역관리 페이지 이동
		@GetMapping("/admin/mm/courselist/list")
		public String coursehistroy() {
			return "admin/mm/coursehistory/courseHistoryMM";
		}
		@GetMapping("/admin/mm/courselist/write")
		public String coursehistorywrite() {
			return "/admin/mm/coursehistory/courseHistoryMMwrite";
		}

		@PostMapping("/admin/mm/coursehistory/write")
		public String write(CourseHistoryMMDto courseHistoryMMDto) {
//			log.info("dto : {}", courseHistoryMMDto);
//			return null;
			return courseHistoryService.write(courseHistoryMMDto);
		}
		
}
