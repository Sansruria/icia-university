package kr.ac.icia.controller.admin.mm.deptline;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.icia.dto.admin.mm.deptline.DeptLineDto;
import kr.ac.icia.service.admin.mm.deptline.DeptLineService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/mm")
@Controller
public class DeptLineController {
	
	@Autowired
	private final DeptLineService deptLineService;
	
	@GetMapping("/deptline")
	public String list(Model model) {
		log.info("departmentline...");
		ArrayList<DeptLineDto> deptLineList = deptLineService.findByCondition(); 
		model.addAttribute("deptLineList", deptLineList);
		
		return "admin/mm/deptline/deptLineList";
	}

}
