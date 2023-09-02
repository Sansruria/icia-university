package kr.ac.icia.controller.sreg.pf;

import kr.ac.icia.dto.sreg.pf.PfDto;
import kr.ac.icia.service.sreg.pf.PfService;
import kr.ac.icia.service.sreg.st.StService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

@RequiredArgsConstructor
@RequestMapping("/sreg")
@Controller
public class PfController {

	@Autowired
	private final PfService pfService;
	
//	목록
	@GetMapping("/pf")
	public String list(Model model) {
		ArrayList<PfDto> pfList = pfService.findByCondition();
		model.addAttribute("pfList", pfList);

		return "sreg/pf/pfList";
	}
	
//	등록화면
	@GetMapping("/pf/write")
	public String write() {
		return "sreg/pf/pfWrite";
	}
	
//	상세화면
	@GetMapping("/pf/detail/{id}")
	public String detail(@PathVariable("id") String pfId, Model model) {
		PfDto pfDto = pfService.detail(pfId);
		model.addAttribute("pfDto", pfDto);

		return "sreg/pf/pfDetail";
	}

//	수정화면
	@GetMapping("/pf/update/{id}")
	public String update(@PathVariable("id") String pfId, Model model) {
		PfDto pfDto = pfService.detail(pfId);
		model.addAttribute("pfDto", pfDto);

		return "sreg/pf/pfUpdate";
	}
}
