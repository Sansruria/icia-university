package kr.ac.icia.controller.sreg.st;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StLeaveReturnController {

	
	@GetMapping("/sreg/stleavereturn")
	public String lrpage() {
		return "leavereturn";
	}
	
	
}
