package kr.ac.icia.controller.admin.mm.deptline;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.icia.dto.admin.mm.deptline.DeptLineDto;
import kr.ac.icia.service.admin.mm.deptline.DeptLineService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/mm/deptline/api")
@RestController
public class DeptLineRestController {
	
	private final DeptLineService deptLineService;
	
	@GetMapping("list/{kind}")
	public String list(@PathVariable("kind") String kind, Model model) {
		log.info("departmentline api...");
		String deptLineList = deptLineService.makeListHtml(kind); 
		
		return deptLineList;
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
