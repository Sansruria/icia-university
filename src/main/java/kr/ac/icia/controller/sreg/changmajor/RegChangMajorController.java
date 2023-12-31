package kr.ac.icia.controller.sreg.changmajor;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dto.sreg.changmajor.UserDto;
import kr.ac.icia.service.sreg.changmajor.changmajorService;
import lombok.extern.slf4j.Slf4j;

//학적 <전과> 페이지컨트롤러
@Slf4j
@RequestMapping("/sreg")
@Controller
public class RegChangMajorController {

	@Autowired
	private changmajorService cSer;

	// 전과메인페이지
	@GetMapping("/stchangm")
	public String changeMajorPage() {
		log.info("전과 신청페이지!");
		return "sreg/changm/majormain";
	}

	// 전과신청페이지로 이동- 데이터조회요청접수
	@GetMapping("/stchangm/update")
	public String showUpdatePage(Model model) {
		List<UserDto> departmentLineList = cSer.getAllfaculty();
		model.addAttribute("departmentLineList", departmentLineList);
		log.info("전과신청 메인페이지..");
		return "sreg/changm/majorupdate";
	}

//전과신청조회페이지로 이동
	@GetMapping("/stchangm/update/list")
	public String finalchangmajorList(HttpSession session, Model model) {
		model.addAttribute("st_changmajor", cSer.requestChangMajorList2(session)); // 화면에서받는값
		log.info("전과신청조회페이지!");
		return "sreg/changm/requestlist";
	}

//전과신청버튼누르며냐 조회화면이동

	@PostMapping("/requestlist") // 화면에서 받아오는 데이터들
	public String addToRequestList(@RequestParam String department_line_name, @RequestParam String facultyName,
			@RequestParam String departmentName, HttpSession session) {
		cSer.requestChangMajorList(session, department_line_name, facultyName, departmentName);

		return "redirect:/sreg/stchangm/update/list";
	}

}