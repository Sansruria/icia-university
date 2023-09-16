package kr.ac.icia.controller.adminchangmajor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import kr.ac.icia.dto.admin.mm.sreg.UserconfirmDto;
import kr.ac.icia.dto.sreg.changmajor.UserDto;
import kr.ac.icia.service.admin.mm.changmajor.UserService;
import lombok.extern.slf4j.Slf4j;

//<관리자> 기능컨트롤러
@Slf4j
@RestController
@RequestMapping("/admin/mm/changmajor/rest")

public class adchangmajorRestController {
	@Autowired
	UserService uSer;

	// 전과한학생들 리스트
	@GetMapping("/list")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("admin/mm/changmajor/adminpage");
		List<UserconfirmDto> userList = uSer.getAllUsers();
		mv.addObject("userList", userList);
		return mv;
	}
	
	//목록조회 
	  @GetMapping("/search")
	  public List<UserDto> LineSearchList(@RequestParam Map<String,String> serchConditionMap){
		log.info("전과한학생들목록입니다");
		  return uSer.LineSearchList(serchConditionMap);  
	  }
	
	/*
	 * @GetMapping("/search") public List<FilterringSearchListDto>
	 * filteringSearchList(@RequestParam Map<String, String> filterConditionMap) {
	 * return cSer.filteringSearch(filterConditionMap); }
	 * 
	 * // 전과승인해주기
	 *
	 * 
	 * @POSTMAPPING("/UPDATE") PUBLIC STRING
	 * 
	 * UPDATEUSERSTATUS(@PATHVARIABLE STRING ST_ID, @REQUESTPARAM STRING STATUS) {
	 * USER.UPDATEUSERSTATUS(ST_ID, STATUS); LOG.INFO("전과상태저장성공!"); RETURN
	 * "REDIRECT:/USER/LIST"; }
	 */
}
