 package kr.ac.icia.controller.coursehistroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.icia.dto.course.CourseHistoryMMDto;
import kr.ac.icia.dto.course.CourseHistorySearchListDto;
import kr.ac.icia.service.admin.mm.coursehistory.CourseHistoryService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CourseHistroyMM {
	
	@Autowired
	private CourseHistoryService courseHistoryService;
	
	// 수강내역관리 페이지 이동
		@GetMapping("/admin/mm/courselist/list")
//		public String coursehistroy() {
			public String list(Model model, CourseHistoryMMDto CourseHistoryMMDto) {
				model.addAttribute("list", CourseHistoryMMDto);	
			return "admin/mm/coursehistory/courseHistoryMM"; //jsp파일 이름
		}
		@GetMapping("/admin/mm/courselist/write")
		public String coursehistorywrite() {
			return "/admin/mm/coursehistory/courseHistoryMMwrite";
		}
//	  목록
//		@GetMapping("/admin/mm/course/CourseHistoryMMDto")
//		public String list(Model model, CourseHistoryMMDto CourseHistoryMMDto) {
//		model.addAttribute("list", CourseHistoryMMDto);	
//		return "/admin/mm/courselist/list";
//		}
		
		//등록 화면
		@PostMapping("/admin/mm/coursehistory/write")
		public String write(CourseHistoryMMDto courseHistoryMMDto,RedirectAttributes rttr) {
//			log.info("dto : {}", courseHistoryMMDto);
//			return null;
//			log.info("cour : {}",courseHistoryMMDto);
//			boolean result = courseHistoryService.write(courseHistoryMMDto);
//			
//			if (result) {
//				rttr.addFlashAttribute("msg","저장에 성공하였습니다.");
//				return "redirect:/admin/mm/courselist/list";
//			}	
			return "redirect:/admin/mm/courselist/write";
		}
		
}
