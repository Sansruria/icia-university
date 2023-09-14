package kr.ac.icia.controller.course.reg;

import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dao.course.reg.CourseRegDao;
import kr.ac.icia.dto.common.member.MemberDto;
import kr.ac.icia.dto.course.CourseDto;
import kr.ac.icia.dto.course.CourseSearchDto;
import kr.ac.icia.dto.course.reg.CourseRegDto;
import kr.ac.icia.service.common.member.MemberService;
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

    @Autowired
    private final MemberService memberService;

    @GetMapping("/reg")
    public String list(Model model, HttpSession session, CourseSearchDto searchDto
            , @RequestParam(value="nowPage", required = false) String nowPage
            , @RequestParam(value="cntPerPage", required = false) String cntPerPage) {

        MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");

        if (memberInfo != null) {
            String isPf = memberInfo.getUserId().substring(0,1);
            if (isPf.equals("P") || memberInfo.getUserId().equals("admin")) {
                return "course/reg/courseRegList";
            } else {
                MemberDto stInfo = memberService.findStInfoById(memberInfo.getUserId());
                searchDto.setStId(stInfo.getUserId());
                searchDto.setGrade(stInfo.getGrade());
                searchDto.setSemester(stInfo.getSemester());
            }

        } else {
            return "course/reg/courseRegList";
        }

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

    @PostMapping("/reg/apply")
    public String applyCourse(@RequestParam("applyCourseId") String applyCourseId,
                              @RequestParam(value = "reqCourseId", required = false) String reqCourseId,
                              RedirectAttributes rttr, HttpSession session) {
        MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
        MemberDto stInfo = memberService.findStInfoById(memberInfo.getUserId());

        CourseRegDto courseRegDto = new CourseRegDto();
        courseRegDto.setCourseId(applyCourseId);
        courseRegDto.setStId(stInfo.getUserId());
        courseRegDto.setGrade(stInfo.getGrade());
        courseRegDto.setSemester(stInfo.getSemester());

        if (reqCourseId != null) {
            courseRegDto.setReqCourseId(reqCourseId);
        }

        String msg = courseRegService.applyCourse(courseRegDto);
        rttr.addFlashAttribute("msg", msg);

        return "redirect:/course/reg";
    }

}
