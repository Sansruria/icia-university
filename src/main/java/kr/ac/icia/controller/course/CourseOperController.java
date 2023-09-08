package kr.ac.icia.controller.course;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.icia.dto.course.FilteringDto;
import kr.ac.icia.dto.course.FilterringSearchListDto;
import kr.ac.icia.service.course.CourseService;
import lombok.experimental.Accessors;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping({ "/course/coursereg/oper" })
public class CourseOperController {

	@Autowired
	private CourseService cSer;
	
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

}
