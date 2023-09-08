package kr.ac.icia.controller.adminchangmajor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.icia.service.sreg.adchangmajor.UserService;
import lombok.extern.slf4j.Slf4j;

// <관리자> 페이지이동 컨트롤러


@Controller
@Slf4j
@RequestMapping("/regadmin")
public class adchangmajorController {
	
	@Autowired
	UserService uSer;
	
	//관리자페이지 > 학생이 보이는 페이지 
	@GetMapping("/changm")
    public String adminPage(){
		log.info("관리자페이지로그인성공");
            return "sreg/changm/adminpage";
        }
    
//회원관리처리페이지
	
//	@PostMapping("/changm")
//    public String userChange(){

	
	
//        return "sreg/changmadminpage";
//    }
}



