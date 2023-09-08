package kr.ac.icia.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommonController {
	
//	@GetMapping("/")
//	public String login() {
//		return "index";
//	}
	@GetMapping("/footer")
	public String footer() {
		return "footer";
	}

	@GetMapping("/dropoutdetail")
	public String list() {
		return "dropoutdetail";
	}

//	@GetMapping("/main")
//	public String main() {
//		return "main";
//	}
}

