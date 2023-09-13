package kr.ac.icia.controller.course.reg;

import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dao.course.reg.CourseRegDao;
import kr.ac.icia.dto.common.member.MemberDto;
import kr.ac.icia.dto.course.CourseDto;
import kr.ac.icia.dto.course.CourseSearchDto;
import kr.ac.icia.dto.course.reg.CourseRegDto;
import kr.ac.icia.service.course.reg.CourseRegService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/course")
@Controller
public class CourseRegController {

    @Autowired
    private final CourseRegService courseRegService;

    @GetMapping("/reg")
    public String list(Model model, HttpSession session, CourseSearchDto searchDto
            , @RequestParam(value="nowPage", required = false) String nowPage
            , @RequestParam(value="cntPerPage", required = false) String cntPerPage) {

        MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
        searchDto.setStId(memberInfo.getUserId());
        searchDto.setGrade(memberInfo.getGrade());
        searchDto.setSemester(memberInfo.getSemester());

        int total = courseRegService.findAllCount(searchDto);

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
        ArrayList<CourseRegDto> courseRegList = courseRegService.findByCondition(searchDto);
        model.addAttribute("searchDto", searchDto);
        model.addAttribute("paging", searchDto.makePagingHtml());
        model.addAttribute("courseRegList", courseRegList);

        return "course/reg/courseRegList";
    }

    @PostMapping("/req/apply")
    public String applyCourse(@RequestParam("reqCourseId") String reqCourseId, RedirectAttributes rttr, HttpSession session) {
        MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
        CourseRegDto courseRegDto = new CourseRegDto();
        courseRegDto.setCourseId(reqCourseId);
        courseRegDto.setStId(memberInfo.getUserId());
        String msg = courseRegService.applyCourse(courseRegDto);
        rttr.addFlashAttribute("msg", msg);

        return "redirect:/course/reg";
    }

}
