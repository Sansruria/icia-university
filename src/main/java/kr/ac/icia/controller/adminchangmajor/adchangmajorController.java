package kr.ac.icia.controller.adminchangmajor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.icia.dto.admin.mm.sreg.User;
import kr.ac.icia.service.admin.mm.changmajor.UserService;
import lombok.extern.slf4j.Slf4j;

// <관리자> 페이지이동 컨트롤러
//관리자페이지 > 전과 신청한 학생의  신청이 보이는 페이지 

@Controller
@Slf4j
@RequestMapping("/admin/mm")
public class adchangmajorController {
	
	@Autowired
	UserService uSer;
	
	@GetMapping("/changm")
    public String adminPage(){
		log.info("관리자페이지메인");
            return "admin/mm/changmajor/adminpage";
        }
	
	//전과신청한 학생들 불러오기...

	@GetMapping("/changm/list")
	public String showUserList(Model model) {
		List<User>UserList=uSer.getAllUsers();
		model.addAllAttributes(UserList);
		log.info("전과신청한학생들조회페이지");
	
		return "admin/mm/changmajor/adminpage";
	}
	
	
}
