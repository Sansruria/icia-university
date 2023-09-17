package kr.ac.icia.controller.coursehistroy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	public String list(Model model) {
		// 목록 가져오기
		List<CourseHistorySearchListDto> courseHistoryList = courseHistoryService.list();
		model.addAttribute("list", courseHistoryList); // 이 부분은 필요 없습니다.

		// 여기에서 courseHistoryList를 JSON 형식으로 변환하여 반환
		System.out.println("CourseHistorySearchListDto " + courseHistoryList);
		return "admin/mm/coursehistory/courseHistoryMM"; // JSP 파일 이름
	}
	@PostMapping("/admin/mm/coursehistory/write")
	public String write(CourseHistoryMMDto courseHistoryMMDto, RedirectAttributes rttr) {
		log.info("dto : {}", courseHistoryMMDto);
//			return null;
		log.info("cour : {}", courseHistoryMMDto);
		boolean result = courseHistoryService.write(courseHistoryMMDto);

		if (result) {
			rttr.addFlashAttribute("msg", "저장에 성공하였습니다.");
			return "redirect:/admin/mm/courselist/list";
		}
		return "redirect:/admin/mm/courselist/write";
	}
	
//	등록 페이지 이동
	@GetMapping("/admin/mm/courselist/write")
	public String coursehistorywrite() {
		return "/admin/mm/coursehistory/courseHistoryMMwrite";
	}
	
	
//	상세화면
	@GetMapping("/admin/mm/coursehistory/courseHistoryMMdetail/{id}")
	public String detail(@PathVariable("id")String coursehId, Model model) {
		model.addAttribute("detail", courseHistoryService.detail(coursehId));
		return "/admin/mm/coursehistory/courseHistoryMMdetail";
	}
	
	
//  수정화면
	@GetMapping("/admin/mm/coursehistory/courseHistoryMMupdate")
	 public String update()  {
		return "admin/mm/coursehistory/courseHistoryMMUpdate";
	}

}
