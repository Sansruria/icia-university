 package kr.ac.icia.controller.coursehistroy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CourseHistroyMM {
	// 수강내역관리 페이지 이동
		@GetMapping("/admin/mm/courselist/list")
		public String coursehistroy() {
			return "admin/mm/coursehistory/courseHistoryMM";
		}
		@GetMapping("/admin/mm/courselist/write")
		public String coursehistorywrite() {
			return "/admin/mm/coursehistory/courseHistoryMMwrite";
		}
}
