package kr.ac.icia.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.ac.icia.controller.admin.mm.dropout.DropOutController;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MainController {
	@GetMapping("/stmain")
	public String stmain() {
		return "/common/stmain";
	}
}