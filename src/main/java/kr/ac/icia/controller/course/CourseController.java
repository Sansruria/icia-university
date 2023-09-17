package kr.ac.icia.controller.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.ac.icia.dto.course.FilteringDto;
import kr.ac.icia.service.course.CourseService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping({ "/course" })
public class CourseController {

	@Autowired
	private CourseService cSer;

	// 수강신청 페이지 이동 및 검색 필터링인 (학부 드롭다운 채우기) 
	@GetMapping({"/coursereg/list"})
	public String ListPage(Model model) {
	    List<FilteringDto> facultyList = cSer.getAllfaculty();
	    model.addAttribute("facultyList", facultyList);
	    return "course/courseReg";
	}
	
}
