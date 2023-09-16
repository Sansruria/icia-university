package kr.ac.icia.controller.coursehistroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.icia.dto.course.CourseHistoryMMDto;
import kr.ac.icia.service.admin.mm.coursehistory.CourseHistoryService;

@RequestMapping("/admin/mm/coursehistory/api")
@Controller
public class CourseHistoryMMRestController {

	@Autowired
	private CourseHistoryService courseHistoryService;
	
	// select, detail, delete는 GetMapping으로
	//등록, 수정은 PostMapping으로
	//등록
	@PostMapping("/write")
	public String write(CourseHistoryMMDto courseHistoryMMDto,RedirectAttributes rttr) {
		boolean result = courseHistoryService.write(courseHistoryMMDto);
		
		if (result) {
			rttr.addFlashAttribute("msg","저장에 성공하였습니다.");
			return "redirect:/admin/mm/courselist/list";
		}
		
		return "redirect:/admin/mm/courselist/write";
	}
	/*
	 * //목록
	 * 
	 * @GetMapping("/list") public String list() {
	 * 
	 * return "/admin/mm/courselist/list"; }
	 */
}
