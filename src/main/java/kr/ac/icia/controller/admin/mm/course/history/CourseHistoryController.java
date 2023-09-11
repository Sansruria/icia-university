package kr.ac.icia.controller.admin.mm.course.history;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/mm/course")
@Controller
public class CourseHistoryController {

    @GetMapping("/history")
    public String list() {
        return "admin/mm/course/history/courseHistoryList";
    }

    @GetMapping("/history/write")
    public String write() {
        return "admin/mm/course/history/courseHistoryWrite";
    }

}
