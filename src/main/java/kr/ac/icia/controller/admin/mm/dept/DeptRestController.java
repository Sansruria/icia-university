package kr.ac.icia.controller.admin.mm.dept;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.icia.dto.admin.mm.dept.DeptDto;
import kr.ac.icia.service.admin.mm.dept.DeptService;
import kr.ac.icia.service.admin.mm.faculty.FacultyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/mm/dept/api")
@RestController
public class DeptRestController {
	
	@Autowired
	private final DeptService deptService;
	
//	목록
	@GetMapping("/list")
	public String list() {
		log.info("/dept/list api...");
		return deptService.makeListHtml();
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
