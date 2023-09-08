package kr.ac.icia.controller.admin.mm.faculty;

import kr.ac.icia.dto.admin.mm.common.CampusSearchDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.ac.icia.dto.admin.mm.faculty.FacultyDto;
import kr.ac.icia.service.admin.mm.faculty.FacultyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/mm/faculty/api")
@RestController
public class FacultyRestController {
	
	@Autowired
	private final FacultyService facultyService;

	@GetMapping("/list")
	public HashMap<String, Object> list(CampusSearchDto searchDto
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
		HashMap <String, Object> modal = new HashMap<String, Object>();
		modal.put("searchDto", searchDto);
		modal.put("makePagingHtml", searchDto.makePagingHtml());
		modal.put("makeListHtml", facultyService.makeListHtml(searchDto));

		return modal;
	}
	
//	@GetMapping("/list/{kind}")
//	public String list(@PathVariable("kind") String kind, Model model) {
//		log.info("FacultyList api...");
//		String facultyList = facultyService.makeListHtml(kind);
//
//		return facultyList;
//	}
//
	
	// 상세
	@GetMapping("/detail/{id}")
	public FacultyDto detail(@PathVariable("id") String id) {
		return facultyService.detail(id);
	}
	
	// 등록
	@PutMapping("/write")
	public String write(FacultyDto facultyDto) {
		return facultyService.write(facultyDto);
	}
	
	// 수정
	@PatchMapping("/update")
	public String update(FacultyDto facultyDto) {
		return facultyService.update(facultyDto);
	}
	
	// 삭제
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable("id") String id) {
		return facultyService.delete(id);
	}

}
