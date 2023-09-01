package kr.ac.icia.controller.admin.mm.faculty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.icia.dto.admin.mm.faculty.FacultyDto;
import kr.ac.icia.service.admin.mm.faculty.FacultyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/mm/faculty/api")
@RestController
public class FacultyRestController {
	
	@Autowired
	private final FacultyService facultyService;
	
	@GetMapping("/list/{kind}")
	public String list(@PathVariable("kind") String kind, Model model) {
		log.info("FacultyList api...");
		String facultyList = facultyService.makeListHtml(kind);
		
		return facultyList;
	}
	
	
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
