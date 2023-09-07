package kr.ac.icia.controller.admin.mm.dept;

import kr.ac.icia.dto.admin.mm.common.CampusSearchDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import kr.ac.icia.dto.admin.mm.dept.DeptDto;
import kr.ac.icia.service.admin.mm.dept.DeptService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/mm/dept/api")
@RestController
public class DeptRestController {
	
	@Autowired
	private final DeptService deptService;
	
//	목록
	@GetMapping("/list")
	public HashMap<String, Object> list(CampusSearchDto campusSearchDto
			, @RequestParam(value="nowPage", required = false) String nowPage
			, @RequestParam(value="cntPerPage", required = false) String cntPerPage) {
		log.info("/dept/list api...");
		int total = deptService.findAllCount(campusSearchDto);

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

		campusSearchDto = new CampusSearchDto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), campusSearchDto);
		campusSearchDto.isModal = true;
		HashMap <String, Object> modal = new HashMap<String, Object>();
		modal.put("searchDto", campusSearchDto);
		modal.put("makePagingHtml", campusSearchDto.makePagingHtml());
		modal.put("makeListHtml", deptService.makeListHtml(campusSearchDto));

		return modal;
	}
	
//	상세
	@GetMapping("/detail/{id}")
	public DeptDto detail(@PathVariable("id") String deptId) {
		log.info("/dept/detail api...");
		return deptService.detail(deptId);
	}
	
//	등록
	@PutMapping("/write")
	public String write(DeptDto deptDto) {
		log.info("/dept/write api...");
		return deptService.write(deptDto);
	}
	
//	수정
	@PatchMapping("/update")
	public String update(DeptDto deptDto) {
		log.info("/dept/update api...");
		return deptService.update(deptDto);
	}
	
//	삭제
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable("id") String deptId) {
		log.info("/dept/delete api...");
		return deptService.delete(deptId);
	}
	
}
