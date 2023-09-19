package kr.ac.icia.controller.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dto.course.FilteringDto2;
import kr.ac.icia.service.course.CourseSelectService;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
@RequestMapping(value = "/course/courseselect/oper", method = { RequestMethod.GET, RequestMethod.POST })
public class CourseSelectOperController {
	
	@Autowired
	private CourseSelectService csSer;
	
	//로그인 한 학생의 학번 데이터 기준 선택한 학년 기반으로 학기 데이터 가져오기
	@GetMapping({"/filtering"})
	public List<FilteringDto2> filteringSemester(@RequestParam String grade, HttpSession session) {
		 String stId = (String) session.getAttribute("ST_ID");
		return csSer.filtering(grade, stId);
	}
	
}
