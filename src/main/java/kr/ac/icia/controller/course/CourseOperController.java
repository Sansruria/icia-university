package kr.ac.icia.controller.course;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMethod;
import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dto.course.CourseRegisterDto;
import kr.ac.icia.dto.course.FilteringDto;
import kr.ac.icia.dto.course.FilterringSearchListDto;
import kr.ac.icia.exception.course.CourseFullException;
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
		String stId = (String) session.getAttribute("ST_ID"); // 세션에서 ST_ID 가져오기
		filterConditionMap.put("stId", stId); // ST_ID를 필터 조건에 추가
		return cSer.filteringSearch(filterConditionMap); // 변경된 필터 조건으로 검색
	}

	// 강의 추가
	@PostMapping("/apply")
	public ResponseEntity<String> addCourse(@RequestBody FilterringSearchListDto FSLDto) {
		try {
			List<FilterringSearchListDto> courseRegList = (List<FilterringSearchListDto>) 
					session.getAttribute("courseRegList");
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
			List<FilterringSearchListDto> courseRegList = (List<FilterringSearchListDto>)
					session.getAttribute("courseRegList");
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
	public ResponseEntity<String> finalApply(@RequestBody List<CourseRegisterDto> CRDto, HttpSession session) { // HttpSession
																																																			// 주입하기
		log.info("서버에 요청이 도착했습니다.");
		log.info("CRDto: " + CRDto);

		try {
			String stId = (String) session.getAttribute("ST_ID");

			// 디버깅: 세션의 "ST_ID" 속성이 null 이거나 빈 문자열인지 확인
			if (stId == null || stId.isEmpty()) {
				log.error("ST_ID가 누락되었습니다.");
				return ResponseEntity.badRequest().body("ST_ID가 누락되었습니다.");
			}

			for (CourseRegisterDto course : CRDto) {
				course.setReq_st_id(stId); // 각 과목 등록 데이터에 대해 ST_ID 설정
			}

			// 최종 수강 신청 로직 실행
			boolean result = cSer.finalApply(CRDto);
			if (result) {
				// 수강 신청이 성공적이면 HTTP 상태 코드 200 (OK)와 함께 메시지 반환
				return new ResponseEntity<>("수강 신청 성공", HttpStatus.OK);
			} else {
				// 실패시 HTTP 상태 코드 400 (BAD_REQUEST)와 함께 메시지 반환
				return new ResponseEntity<>("수강 신청 실패", HttpStatus.BAD_REQUEST);
			}
		} catch (CourseFullException e) {
			// 수강 정원 초과시 오류 발생, HTTP 상태 코드 403 (FORBIDDEN) 반환
			return new ResponseEntity<>(e.getMessage(), HttpStatus.FORBIDDEN);
		} catch (Exception e) {
			// 그 외의 다른 예외가 발생하면 서버 오류로 간주하고 HTTP 상태 코드 500 반환
			return new ResponseEntity<>("서버 오류", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
