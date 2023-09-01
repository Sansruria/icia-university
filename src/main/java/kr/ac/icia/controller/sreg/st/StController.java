package kr.ac.icia.controller.sreg.st;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.icia.dto.sreg.st.StDto;
import kr.ac.icia.service.sreg.st.StService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/sreg")
@Controller
public class StController {
	
	@Autowired
	private final StService stService;
	
//	목록
	@GetMapping("/st")
	public String list(Model model) {
		ArrayList<StDto> stList = stService.findByCondition();
		model.addAttribute("stList", stList);
		
		return "sreg/st/stList";
	}
	
//	등록화면
	@GetMapping("/st/write")
	public String write() {
		return "sreg/st/stWrite";
	}
	
//	수정화면
	@GetMapping("/st/detail/{id}")
	public String detail() {
		return "sreg/st/stDetail";
	}

}
