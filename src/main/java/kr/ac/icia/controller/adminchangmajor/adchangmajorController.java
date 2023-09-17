package kr.ac.icia.controller.adminchangmajor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.icia.dto.sreg.changmajor.UserDto;
import kr.ac.icia.service.admin.mm.changmajor.UserService;
import lombok.extern.slf4j.Slf4j;

// <관리자> 페이지이동 컨트롤러
//관리자페이지 > 전과 신청한 학생의  신청이 보이는 페이지 
@Controller
@Slf4j
@RequestMapping("/admin/mm")
public class adchangmajorController {

	@Autowired
	UserService uSer;

	// 전과학생로 이동
	@GetMapping("/changm")
	public String showadminchagm(Model model) {
		log.info("전과관리승인페이지...");
		model.addAttribute("userList", uSer.findAll());
		return "admin/mm/changmajor/adminpage";

	}
	
	@PostMapping("/confirm")
	public String confirm(UserDto userDto) {
		
		uSer.confirm(userDto);
		
		return "redirect:/admin/mm/changm";
		
	}
}
