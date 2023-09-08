package kr.ac.icia.controller.admin.mm.dept;

import java.util.ArrayList;

import kr.ac.icia.dto.admin.mm.common.CampusSearchDto;
import kr.ac.icia.dto.sreg.common.SregSearchDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.icia.dto.admin.mm.dept.DeptDto;
import kr.ac.icia.service.admin.mm.dept.DeptService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/mm")
@Controller
public class DeptController {
	
	@Autowired
	private final DeptService deptService; 
	
//	목록
	@GetMapping("/dept")
	public String list(Model model, CampusSearchDto searchDto
			, @RequestParam(value="nowPage", required = false) String nowPage
			, @RequestParam(value="cntPerPage", required = false) String cntPerPage) {

		int total = deptService.findAllCount(searchDto);

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

		searchDto = new CampusSearchDto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), searchDto);
		ArrayList<DeptDto> deptList = deptService.findByCondition(searchDto);
		model.addAttribute("searchDto", searchDto);
		model.addAttribute("paging", searchDto.makePagingHtml());
		model.addAttribute("deptList", deptList);
		
		return "admin/mm/dept/deptList";
	}

	@GetMapping("/dept/modal/list")
	public String listModal(Model model, CampusSearchDto searchDto
			, @RequestParam(value="nowPage", required = false) String nowPage
			, @RequestParam(value="cntPerPage", required = false) String cntPerPage) {

		int total = deptService.findAllCount(searchDto);

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

		searchDto = new CampusSearchDto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), searchDto);
		searchDto.isModal = true;
		ArrayList<DeptDto> deptListModal = deptService.findByCondition(searchDto);
		model.addAttribute("searchDto", searchDto);
		model.addAttribute("paging", searchDto.makePagingHtml());
		model.addAttribute("deptListModal", deptListModal);

		return "admin/mm/dept/deptListModal";
	}

	//	상세
	@GetMapping("/dept/modal/detail/{id}")
	public String detail(Model model, @PathVariable("id") String deptId) {
		model.addAttribute("deptDto", deptService.detail(deptId));
		return "admin/mm/dept/deptDetailModal";
	}
	
}
