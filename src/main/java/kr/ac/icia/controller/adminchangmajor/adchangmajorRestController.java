package kr.ac.icia.controller.adminchangmajor;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@GetMapping("/list")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("admin/mm/changmajor/adminpage");
		List<UserconfirmDto> userList = uSer.getAllUsers();
		mv.addObject("userList", userList);
		return mv;
		
		
	}
	}

	
	

