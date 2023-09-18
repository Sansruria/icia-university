package kr.ac.icia.controller.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.icia.service.common.notice.NoticeService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MainController {
	
	@Autowired
	private NoticeService nSer;
	
	@GetMapping("/stmain")
	public String stmain() {
		
		return "/common/stmain";
	}
	
	@RequestMapping("/notices")
		public String showMainNotic(Model model) {
		log.info("공지사항!");
		model.addAttribute("noticesList", nSer.findAll());
		return"sreg/st/stMain";
		}
	}
