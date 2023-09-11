package kr.ac.icia.controller.course;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMethod;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dto.course.CourseRegisterDto;
import kr.ac.icia.dto.course.FilteringDto;
import kr.ac.icia.dto.course.FilterringSearchListDto;
import kr.ac.icia.service.course.CourseService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/course/coursereg/oper", method = { RequestMethod.GET, RequestMethod.POST })
public class CourseOperController {

	@Autowired
	private CourseService cSer;

	@Autowired
	private HttpSession session;

	// 선택한 학부 기반으로 학과 데이터 가져오기
	@GetMapping("/filtering")
	public List<FilteringDto> FilteringDepartment(@RequestParam String facultyId) {
		return cSer.filtering(facultyId);
	}

	// 필터링된 수강신청(수강신청 테이블이 아닌 과목 테이블) 리스트 가져오기
	@GetMapping("/search")
	public List<FilterringSearchListDto> filteringSearchList(@RequestParam Map<String, String> filterConditionMap) {
		return cSer.filteringSearch(filterConditionMap);
	}

	// 강의 추가
	@PostMapping("/apply")
	public ResponseEntity<String> addCourse(@RequestBody FilterringSearchListDto FSLDto) {
		try {
			List<FilterringSearchListDto> courseRegList = (List<FilterringSearchListDto>) session
					.getAttribute("courseRegList");
			if (courseRegList == null) {
				courseRegList = new ArrayList<>();
			}
			courseRegList.add(FSLDto);
			session.setAttribute("courseRegList", courseRegList);
			return new ResponseEntity<>("강의가 성공적으로 추가되었습니다.", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>("강의 추가에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 강의 취소
	@PostMapping("/cancel")
	public ResponseEntity<String> cancelCourse(@RequestBody FilterringSearchListDto FSLDto) {
		try {
			List<FilterringSearchListDto> courseRegList = (List<FilterringSearchListDto>) session
					.getAttribute("courseRegList");
			if (courseRegList != null) {
				courseRegList.remove(FSLDto);
				session.setAttribute("courseRegList", courseRegList);
			}
			return new ResponseEntity<>("강의가 성공적으로 취소되었습니다.", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>("강의 취소에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}


	@PostMapping("/finalapply")
	public ResponseEntity<String> finalApply(@RequestBody List<CourseRegisterDto> CRDto) {
		try {
			boolean result = cSer.finalApply(CRDto);
			if (result) {
				return new ResponseEntity<>("수강신청 성공", HttpStatus.OK);
			} else {
				return new ResponseEntity<>("수강신청 실패", HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			return new ResponseEntity<>("서버 에러", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
