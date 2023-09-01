package kr.ac.icia.controller.sreg.st;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.icia.dto.sreg.st.StDto;
import kr.ac.icia.service.sreg.st.StService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/sreg/st/api")
@RestController
public class StRestController {
	
	@Autowired
	private final StService stService;
	
//	등록
	@PutMapping("/write")
	public String write(StDto stDto) {
		return stService.write(stDto);
	}
	
//	수정
	@PatchMapping("/update")
	public String update(StDto stDto) {
		return stService.update(stDto);
	}
	
//	삭제
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable("id") String stId) {
		return stService.delete(stId);
	}

}
