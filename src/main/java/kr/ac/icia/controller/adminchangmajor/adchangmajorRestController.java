package kr.ac.icia.controller.adminchangmajor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import kr.ac.icia.dto.admin.mm.sreg.UserconfirmDto;
import kr.ac.icia.service.admin.mm.changmajor.UserService;
import lombok.extern.slf4j.Slf4j;

//<관리자> 기능컨트롤러
@Slf4j
@RestController
@RequestMapping("/admin/mm/changmajor/rest")

public class adchangmajorRestController {
	@Autowired
	UserService uSer;

	// 전과한학생들 목록
	@GetMapping("/list")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("admin/mm/changmajor/adminpage");
		List<UserconfirmDto> userList = uSer.getAllUsers();
		mv.addObject("userList", userList);
		return mv;
	}
	 //전과승인해주기
	@PostMapping("/update")
	public String updateUserStatus(@PathVariable String st_Id, @RequestParam String status) {
		uSer.updateUserStatus(st_Id, status);
		log.info("전과상태저장성공!");
		return "redirect:/user/list";
	}
}
