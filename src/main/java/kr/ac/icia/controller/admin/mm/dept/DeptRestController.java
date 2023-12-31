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
	public HashMap<String, Object> list(CampusSearchDto searchDto
			, @RequestParam(value="nowPage", required = false) String nowPage
			, @RequestParam(value="cntPerPage", required = false) String cntPerPage) {
		log.info("/dept/list api...");
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
		HashMap <String, Object> modal = new HashMap<String, Object>();
		modal.put("searchDto", searchDto);
		modal.put("makePagingHtml", searchDto.makePagingHtml());
		modal.put("makeListHtml", deptService.makeListHtml(searchDto));

		return modal;
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
