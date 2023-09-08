package kr.ac.icia.controller.sreg.changmajor;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ch.qos.logback.core.model.Model;
import kr.ac.icia.dto.course.FilteringDto;
import kr.ac.icia.service.sreg.changmajor.RegService;


//학적 <전과> 컨트롤러

@RequestMapping("/sreg") 
@Controller
public class RegChangMajorController {

	@Autowired
	private RegService rSer;
	
	
	// 전과메인페이지
	@GetMapping("/stchangm")
	public String changeMajorPage() {
		return "/sreg/changm/majormain";
	}

	// 전과신청페이지로 이동- 데이터조회요청접수
	@GetMapping("/stchangm/update")
	public String showUpdatePage(Model model) {
		List<FilteringDto> changmajorList=rSer.getAllchangmajor();
		return "/sreg/changm/majorupdate";
	}

	// 전공신청 목록을 담으면 어쩌구..
	@GetMapping("/stchangm/majorupdate")
	public String Majorcart() {
		return "/sreg/changm/requestlist";

	}

//전과신청조회페이지로 이동
	@GetMapping("/stchangm/update/list")
	public String changeMlist(){
		return "/sreg/changm/requestlist";
	}
   
}