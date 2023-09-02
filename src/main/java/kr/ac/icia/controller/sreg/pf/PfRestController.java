package kr.ac.icia.controller.sreg.pf;

import kr.ac.icia.dto.sreg.pf.PfDto;
import kr.ac.icia.dto.sreg.st.StDto;
import kr.ac.icia.service.sreg.pf.PfService;
import kr.ac.icia.service.sreg.st.StService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RequestMapping("/sreg/pf/api")
@RestController
public class PfRestController {

	@Autowired
	private final PfService pfService;
	
//	등록
	@PutMapping("/write")
	public String write(PfDto pfDto) {
		return pfService.write(pfDto);
	}
	
//	수정
	@PatchMapping("/update")
	public String update(PfDto pfDto) {
		return pfService.update(pfDto);
	}
	
//	삭제
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable("id") String pfId) {
		return pfService.delete(pfId);
	}

}
