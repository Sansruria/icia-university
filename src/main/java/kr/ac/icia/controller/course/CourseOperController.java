package kr.ac.icia.controller.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.icia.dto.course.SubjectDto;
import kr.ac.icia.service.course.CourseService;
import lombok.experimental.Accessors;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping({ "/course" })
public class CourseOperController {
	@Autowired
	private CourseService cSer;

	// 수강신청 리스트 출력
	@GetMapping("/coursereg/oper/list")
	@ResponseBody
	public List<SubjectDto> searchList(@RequestParam(required = false) String department_id,
															@RequestParam(required = false) String faculty_id, Model model) {
		List<SubjectDto> cList = cSer.courseReg(department_id, faculty_id);	
		return cList; // JSON 형태로 데이터 반환
	}
	
	//출력할 수강신청 리스트 필터링  : 학부에 따른  학과 목록으로 필터링
	@GetMapping("/coursereg/oper/search")
	@ResponseBody
	public List<SubjectDto> search(@RequestParam String faculty_id) {
	    try {
	        return cSer.filteringSearch(faculty_id);
	    } catch (Exception e) {
	        log.error("filteringsearch 메소드 오류", e);
	    }
	    return null;
	}
}
