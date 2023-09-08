package kr.ac.icia.controller.sreg.changmajor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.icia.dto.course.FilteringDto;
import kr.ac.icia.service.sreg.changmajor.RegService;

//<전과 기능>컨트롤러
@RestController
public class RegChangMajorRestController {
	
	@Autowired
	private RegService rSer;
	
	//선택한 학부기반으로 학과데이터가져오기
	 @GetMapping("/search")
	    public List<FilteringDto> search(@RequestParam String changemajorId) {
	        return rSer.filtering(changemajorId);
	    }

}
