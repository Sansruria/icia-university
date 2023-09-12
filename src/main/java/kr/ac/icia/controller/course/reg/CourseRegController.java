package kr.ac.icia.controller.course.reg;

import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dao.course.reg.CourseRegDao;
import kr.ac.icia.dto.common.member.MemberDto;
import kr.ac.icia.dto.course.CourseSearchDto;
import kr.ac.icia.dto.course.reg.CourseRegDto;
import kr.ac.icia.service.course.reg.CourseRegService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
        searchDto.setGrade(memberInfo.getGrade());
        searchDto.setSemester(memberInfo.getSemester());
        ArrayList<CourseRegDto> courseRegList = courseRegService.findByCondition(searchDto);
        model.addAttribute("searchDto", searchDto);
        model.addAttribute("paging", searchDto.makePagingHtml());
        model.addAttribute("courseRegList", courseRegList);

        return "course/reg/courseRegList";
    }

}
