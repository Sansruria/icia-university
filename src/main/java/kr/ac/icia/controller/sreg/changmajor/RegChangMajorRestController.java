package kr.ac.icia.controller.sreg.changmajor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import kr.ac.icia.dto.sreg.changmajor.UserDto;
import kr.ac.icia.service.sreg.changmajor.changmajorService;

//<전과 기능>컨트롤러
@RestController
@RequestMapping({ "/sreg/changmajor/rest" })
public class RegChangMajorRestController {

	@Autowired
	private changmajorService uSer;

	// 학부선택하면 학과데이터 가져오기
	@GetMapping("/showdepart")
	public List<UserDto> getDepartments(@RequestParam String facultyId) {
		return uSer.getDepartments(facultyId);
	}

}