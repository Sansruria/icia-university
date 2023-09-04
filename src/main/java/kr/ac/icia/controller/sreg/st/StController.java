package kr.ac.icia.controller.sreg.st;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.icia.dto.common.Paging;
import kr.ac.icia.dto.common.PagingVO;
import kr.ac.icia.dto.sreg.st.StDto;
import kr.ac.icia.service.sreg.st.StService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@RequestMapping("/sreg")
@Controller
public class StController {
	
	@Autowired
	private final StService stService;
	
//	목록
	@GetMapping("/st")
	public String list(Model model, PagingVO pagingVO
			, @RequestParam(value="nowPage", required = false) String nowPage
			, @RequestParam(value="cntPerPage", required = false) String cntPerPage) {
		
		int total = stService.findAllCount();
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
		
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pagingVO);
		ArrayList<StDto> stList = stService.findByCondition(pagingVO);
		model.addAttribute("stList", stList);
		
		return "sreg/st/stList";
	}
	
//	등록화면
	@GetMapping("/st/write")
	public String write() {
		return "sreg/st/stWrite";
	}
	
//	상세화면
	@GetMapping("/st/detail/{id}")
	public String detail(@PathVariable("id") String stId, Model model) {
		StDto stDto = stService.detail(stId);
		model.addAttribute("stDto", stDto);

		return "sreg/st/stDetail";
	}

//	수정화면
	@GetMapping("/st/update/{id}")
	public String update(@PathVariable("id") String stId, Model model) {
		StDto stDto = stService.detail(stId);
		model.addAttribute("stDto", stDto);

		return "sreg/st/stUpdate";
	}
}