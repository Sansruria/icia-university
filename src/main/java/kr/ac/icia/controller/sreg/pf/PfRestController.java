package kr.ac.icia.controller.sreg.pf;

import kr.ac.icia.dto.sreg.common.SregSearchDto;
import kr.ac.icia.dto.sreg.pf.PfDto;
import kr.ac.icia.dto.sreg.st.StDto;
import kr.ac.icia.service.sreg.pf.PfService;
import kr.ac.icia.service.sreg.st.StService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;

@RequiredArgsConstructor
@RequestMapping("/sreg/pf/api")
@RestController
public class PfRestController {

	@Autowired
	private final PfService pfService;

	@GetMapping("/list")
	public HashMap<String, Object> list(SregSearchDto searchDto
			, @RequestParam(value="nowPage", required = false) String nowPage
			, @RequestParam(value="cntPerPage", required = false) String cntPerPage) {

		int total = pfService.findAllCount(searchDto);

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}
		else if (nowPage == null) {
			nowPage = "1";
		}
		else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		searchDto = new SregSearchDto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), searchDto);
		searchDto.isModal = true;
		HashMap <String, Object> modal = new HashMap<String, Object>();
		modal.put("searchDto", searchDto);
		modal.put("makePagingHtml", searchDto.makePagingHtml());
		modal.put("makeListHtml", pfService.makeListHtml(searchDto));

		return modal;
	}
	
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
