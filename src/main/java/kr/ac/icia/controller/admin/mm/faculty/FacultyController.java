package kr.ac.icia.controller.admin.mm.faculty;

import java.util.ArrayList;

import kr.ac.icia.dto.admin.mm.common.CampusSearchDto;
import kr.ac.icia.dto.admin.mm.dept.DeptDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.icia.dto.admin.mm.faculty.FacultyDto;
import kr.ac.icia.service.admin.mm.deptline.DeptLineService;
import kr.ac.icia.service.admin.mm.faculty.FacultyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/mm")
@Controller
public class FacultyController {
	
	@Autowired
	private final FacultyService facultyService;
	
	@Autowired
	private final DeptLineService deptLineService;
	
	@GetMapping("/faculty")
	public String list(Model model, CampusSearchDto searchDto
			, @RequestParam(value="nowPage", required = false) String nowPage
			, @RequestParam(value="cntPerPage", required = false) String cntPerPage) {

		int total = facultyService.findAllCount(searchDto);

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
		ArrayList<FacultyDto> facultyList = facultyService.findByCondition(searchDto);
		model.addAttribute("searchDto", searchDto);
		model.addAttribute("paging", searchDto.makePagingHtml());
		model.addAttribute("facultyList", facultyList);
		
		return "admin/mm/faculty/facultyList";
	}

	@GetMapping("/faculty/modal/list")
	public String listModal(Model model, CampusSearchDto searchDto
			, @RequestParam(value="nowPage", required = false) String nowPage
			, @RequestParam(value="cntPerPage", required = false) String cntPerPage) {

		int total = facultyService.findAllCount(searchDto);

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
		ArrayList<FacultyDto> deptListModal = facultyService.findByCondition(searchDto);
		model.addAttribute("searchDto", searchDto);
		model.addAttribute("paging", searchDto.makePagingHtml());
		model.addAttribute("facultyListModal", deptListModal);

		return "admin/mm/faculty/facultyListModal";
	}

	@GetMapping("/faculty/modal/mm/list")
	public String listModalForMM(Model model, CampusSearchDto searchDto
			, @RequestParam(value="nowPage", required = false) String nowPage
			, @RequestParam(value="cntPerPage", required = false) String cntPerPage) {

		int total = facultyService.findAllCount(searchDto);

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
		ArrayList<FacultyDto> deptListModal = facultyService.findByCondition(searchDto);
		model.addAttribute("searchDto", searchDto);
		model.addAttribute("paging", searchDto.makePagingHtml());
		model.addAttribute("facultyListModal", deptListModal);

		return "admin/mm/faculty/facultyListModalForMM";
	}

	@GetMapping("/faculty/modal/detail/{id}")
	public String detail(Model model, @PathVariable("id") String id) {
		model.addAttribute("facultyDto", facultyService.detail(id));
		return "admin/mm/faculty/facultyDetailModal";
	}
}
