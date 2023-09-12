package kr.ac.icia.controller.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.icia.service.course.CourseService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping({"/course"})	
public class CourseController {
	@Autowired
	private CourseService cSer;

	// 수강신청 페이지 이동
	@GetMapping({"/coursereg/list"})
	public String ListPage() {
		return "course/courseReg";
	}

}
