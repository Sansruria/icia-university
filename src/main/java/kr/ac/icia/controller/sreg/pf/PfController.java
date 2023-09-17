package kr.ac.icia.controller.sreg.pf;


import kr.ac.icia.dto.sreg.common.SregSearchDto;
import kr.ac.icia.dto.sreg.pf.PfDto;
import kr.ac.icia.service.sreg.pf.PfService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/sreg")
@Controller
public class PfController {

	@Autowired
	private final PfService pfService;

	@GetMapping("/pf/main")
	public String mainPage() {
		return "sreg/pf/pfMain";
	}
	
//	목록
	@GetMapping("/pf")
	public String list(Model model, SregSearchDto searchDto
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
		ArrayList<PfDto> pfList = pfService.findByCondition(searchDto);
		model.addAttribute("searchDto", searchDto);
		model.addAttribute("paging", searchDto.makePagingHtml());
		model.addAttribute("pfList", pfList);

		return "sreg/pf/pfList";
	}
	
//	등록화면
	@GetMapping("/pf/write")
	public String write() {
		return "sreg/pf/pfWrite";
	}
	
//	상세화면
	@GetMapping("/pf/detail/{id}")
	public String detail(@PathVariable("id") String pfId, Model model) {
		PfDto pfDto = pfService.detail(pfId);
		model.addAttribute("pfDto", pfDto);

		return "sreg/pf/pfDetail";
	}

//	수정화면
	@GetMapping("/pf/update/{id}")
	public String update(@PathVariable("id") String pfId, Model model) {
		PfDto pfDto = pfService.detail(pfId);
		model.addAttribute("pfDto", pfDto);

		return "sreg/pf/pfUpdate";
	}

	@GetMapping("/pf/modal/list")
	public String listModal(Model model, SregSearchDto searchDto
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
		ArrayList<PfDto> pfList = pfService.findByCondition(searchDto);
		model.addAttribute("searchDto", searchDto);
		model.addAttribute("paging", searchDto.makePagingHtml());
		model.addAttribute("pfListModal", pfList);

		return "sreg/pf/pfListModal";
	}

}
