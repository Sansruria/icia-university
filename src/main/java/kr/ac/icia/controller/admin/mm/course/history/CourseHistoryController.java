package kr.ac.icia.controller.admin.mm.course.history;

import kr.ac.icia.dto.course.CourseSearchDto;
import kr.ac.icia.dto.admin.mm.course.history.CourseHistoryDto;
import kr.ac.icia.service.admin.mm.course.history.CourseHistoryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin/mm/course")
@Controller
public class CourseHistoryController {

    @Autowired
    private final CourseHistoryService courseHistoryService;

    @GetMapping("/history")
    public String list(Model model, CourseSearchDto searchDto
            , @RequestParam(value="nowPage", required = false) String nowPage
            , @RequestParam(value="cntPerPage", required = false) String cntPerPage) {

        int total = courseHistoryService.findAllCount(searchDto);

        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "5";
        }
		else if (nowPage == null) {
            nowPage = "1";
        }
        else if (cntPerPage == null) {
            cntPerPage = "5";
        }

        searchDto = new CourseSearchDto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), searchDto);
        ArrayList<CourseHistoryDto> courseHistoryList = courseHistoryService.findByCondition(searchDto);
        model.addAttribute("searchDto", searchDto);
        model.addAttribute("paging", searchDto.makePagingHtml());
        model.addAttribute("courseHistoryList", courseHistoryList);

        return "admin/mm/course/history/courseHistoryList";
    }

    @GetMapping("/history/write")
    public String write() {
        return "admin/mm/course/history/courseHistoryWrite";
    }

    @GetMapping("/history/detail/{id}")
    public String detail(@PathVariable("id") String courseId, Model model) {
        model.addAttribute("courseHistoryDto", courseHistoryService.detail(courseId));
        return "admin/mm/course/history/courseHistoryDetail";
    }

    @GetMapping("/history/update/{id}")
    public String update(@PathVariable("id") String courseId, Model model) {
        model.addAttribute("courseHistoryDto", courseHistoryService.detail(courseId));
        return "admin/mm/course/history/courseHistoryUpdate";
    }

}
