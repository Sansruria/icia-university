package kr.ac.icia.controller.course;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dto.course.FilteringDto2;
import kr.ac.icia.dto.course.FilterringSearchListDto2;
import kr.ac.icia.service.course.CourseSelectService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/course/courseselect/oper", method = { RequestMethod.GET, RequestMethod.POST })
public class CourseSelectOperController {

	@Autowired
	private CourseSelectService csSer;

	@GetMapping({ "/search" })
	public List<FilterringSearchListDto2> filteringSearchList2(@RequestParam("grade") String req_grade,
			@RequestParam("semester") String req_semester, HttpSession session) {
		String stId = (String) session.getAttribute("ST_ID");
		return csSer.filteringSearch2(stId, req_grade, req_semester);
	}
	
	
	@GetMapping({"/userid"})
	@ResponseBody
	public Map<String, String> getUserId(HttpSession session) {
	    Map<String, String> map = new HashMap<>();
	    map.put("userId", session.getAttribute("ST_ID").toString());
	    return map;
	}

}
