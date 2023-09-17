package kr.ac.icia.controller.sreg.changmajor;

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
import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dto.sreg.changmajor.ChangApplyDto;
import kr.ac.icia.dto.sreg.changmajor.UserDto;
import kr.ac.icia.service.sreg.changmajor.changmajorService;
import lombok.extern.slf4j.Slf4j;

//<전과 기능>컨트롤러
@RestController
@RequestMapping({ "/sreg/changmajor/rest" })
@Slf4j
public class RegChangMajorRestController {

	@Autowired
	private changmajorService cSer;

	// 학부의 학과 데이터가져오기
	@GetMapping("/getdepart")
	public List<UserDto> getFaculty(@RequestParam String departmentLineId) {
		log.info("departmennLineId : {}", departmentLineId);
		return cSer.getFaculty(departmentLineId);
	}

	// 목록담기 버튼 누르면 리스트에 담기.
	@GetMapping("/search")
	public List<UserDto> SearchList(@RequestParam Map<String, String> SearcConditionMap) {
		return cSer.SearchList(SearcConditionMap);
	}

	// 신청목록>선택버튼 누르면 신청내역에 추가
	@PostMapping("/apply")
	public ResponseEntity<String> applyForMajor(@RequestBody ChangApplyDto CADto, HttpSession session) {
		cSer.applyForMajor(CADto);
		return new ResponseEntity<>("신청이 완료되었습니다.", HttpStatus.OK);
	}

	// 신청내역>취소
	@PostMapping("/delete")
	public ResponseEntity<String> deleteDept(@RequestBody ChangApplyDto CADto, HttpSession session) {
		cSer.deleteDept(CADto);
		return new ResponseEntity<>("신청 취소가 완료되었습니다.", HttpStatus.OK);
	}
	
	
	
	
}
