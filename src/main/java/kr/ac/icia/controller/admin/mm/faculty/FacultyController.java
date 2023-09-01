package kr.ac.icia.controller.admin.mm.faculty;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.icia.dto.admin.mm.faculty.FacultyDto;
import kr.ac.icia.service.admin.mm.deptline.DeptLineService;
import kr.ac.icia.service.admin.mm.faculty.FacultyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

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
	public String list(Model model) {
		log.info("departmentline...");
		ArrayList<FacultyDto> facultyList = facultyService.findByCondition();
		model.addAttribute("facultyList", facultyList);
		
		return "admin/mm/faculty/facultyList";
	}

}
