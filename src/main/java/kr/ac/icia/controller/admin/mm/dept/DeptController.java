package kr.ac.icia.controller.admin.mm.dept;

import java.util.ArrayList;

import kr.ac.icia.dto.admin.mm.common.CampusSearchDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.icia.dto.admin.mm.dept.DeptDto;
import kr.ac.icia.service.admin.mm.dept.DeptService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/mm")
@Controller
public class DeptController {
	
	@Autowired
	private final DeptService deptService; 
	
//	목록
	@GetMapping("/dept")
	public String list(Model model, CampusSearchDto searchDto) {
		log.info("dept...");
//		ArrayList<DeptDto> deptList = deptService.findByCondition();
//		model.addAttribute("deptList", deptList);
		
		return "admin/mm/dept/deptList";
	}
	
}
