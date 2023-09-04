package kr.ac.icia.controller.courseev;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CourseEvRegController {
	
	// 강의평가 페이지 이동
	@GetMapping("/course/courseevreg/list")
	public String course() {
		return "courseev/courseEvReg";
	}
}
