package kr.ac.icia.controller.admin.mm.dropout;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.ac.icia.service.sreg.dropout.DropOutService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DropOutController {
	@Autowired 
	DropOutService drSer;
	
	@GetMapping("/sreg/mm/dropoout/list")
	public String list() {
		return "/admin/mm/dropout/dropoutlist";
	}

}