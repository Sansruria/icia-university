package kr.ac.icia.controller.sreg.st;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.icia.dto.sreg.dropout.DropOutDto;
import kr.ac.icia.service.sreg.dropout.DropOutService;

@Controller
@RequestMapping({"/sreg/dropout"})
public class StDropOutController {
	
	@Autowired
	private DropOutService DOSer;
	
	@GetMapping("/list")
	public String app() {
		return "sreg/st/dropoutapp";
	}
	
	@PostMapping("/write")
	public String write(DropOutDto DODto) {
		return DOSer.DropOutInsert(DODto);
		
	}
}
