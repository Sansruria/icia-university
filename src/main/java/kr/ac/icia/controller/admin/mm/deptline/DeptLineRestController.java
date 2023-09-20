package kr.ac.icia.controller.admin.mm.deptline;

import kr.ac.icia.dto.admin.mm.common.CampusSearchDto;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.ac.icia.dto.admin.mm.deptline.DeptLineDto;
import kr.ac.icia.service.admin.mm.deptline.DeptLineService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/mm/deptline/api")
@RestController
public class DeptLineRestController {
	
	private final DeptLineService deptLineService;

	@GetMapping("list")
	public HashMap<String, Object> list(Model model, CampusSearchDto searchDto
			, @RequestParam(value="nowPage", required = false) String nowPage
			, @RequestParam(value="cntPerPage", required = false) String cntPerPage) {

		int total = deptLineService.findAllCount(searchDto);

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
		HashMap<String, Object> modal = new HashMap<String, Object>();
		modal.put("searchDto", searchDto);
		modal.put("makePagingHtml", searchDto.makePagingHtml());
		modal.put("makeListHtml", deptLineService.makeListHtml(searchDto));

		return modal;
	}
	
	@PutMapping("/write")
	public String write(DeptLineDto deptLineDto) {
		log.info("deptLine Write...");
		return deptLineService.write(deptLineDto);
	}
	
	@GetMapping("/detail/{id}")
	public DeptLineDto detail(@PathVariable("id") String deptLineId) {
		log.info("deptLine Detail...");
		return deptLineService.detail(deptLineId);
	}
	
	@PatchMapping("/update")
	public String update(DeptLineDto deptLineDto) {
		log.info("deptLine Update...");
		return deptLineService.update(deptLineDto);
	}
	
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable("id") String id) {
		log.info("deptLine Delete...");
		return deptLineService.delete(id);
	}

}
