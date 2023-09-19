package kr.ac.icia.controller.course;

import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dto.course.FilteringDto;
import kr.ac.icia.dto.course.FilteringDto2;
import kr.ac.icia.service.course.CourseSelectService;
import kr.ac.icia.service.course.CourseService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping({ "/course" })
public class CourseController {

	@Autowired
	private CourseService cSer;

	@Autowired
	private CourseSelectService csSer;

	// 수강신청 페이지 이동 및 검색 필터링인 (학부 드롭다운 채우기)
	@GetMapping({ "/coursereg/list" })
	public String ListPage(Model model) {
		List<FilteringDto> facultyList = cSer.getAllfaculty();
		model.addAttribute("facultyList", facultyList);
		return "course/courseReg";
	}
	
	// 수강신청조회 페이지 이동 시 학년 드롭다운 채우기(드롭다운 중복 제거)
	@GetMapping({ "/courseselect/list" })
	public String SelectListPage(Model model, HttpSession session) {
		String stId = (String) session.getAttribute("ST_ID");
		List<FilteringDto2> gradeList = csSer.getGrade(stId); // 해당 학생의 학년 목록을 가져옴	

		// HashSet을 사용하여 중복 제거
		HashSet<String> uniqueGrades = new HashSet<>();
		for (FilteringDto2 dto : gradeList) {
			uniqueGrades.add(dto.getGrade());
		}

		// HashSet을 List로 변환
		List<String> uniqueGradeList = uniqueGrades.stream().collect(Collectors.toList());

		model.addAttribute("gradeList", uniqueGradeList); // 중복이 제거된 목록을 추가
		return "course/courseSelect";
	}

}
