package kr.ac.icia.controller.admin.mm.st;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/mm")
@Controller
public class StController {
	
	@GetMapping("/st")
	public String list() {
		return "admin/mm/st/stList";
	}

}
