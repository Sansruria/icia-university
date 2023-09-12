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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/course")
@Controller
public class CourseRegController {

    @Autowired
    private final CourseRegService courseRegService;

    @GetMapping("/reg")
    public String list(HttpSession session, CourseSearchDto searchDto
            , @RequestParam(value="nowPage", required = false) String nowPage
            , @RequestParam(value="cntPerPage", required = false) String cntPerPage) {

        MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
        searchDto.setGrade(memberInfo.getGrade());
        searchDto.setSemester(memberInfo.getSemester());
        courseRegService.findByCondition(searchDto);

        return "course/reg/courseRegList";
    }

}
