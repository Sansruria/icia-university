package kr.ac.icia.controller.admin.mm.course.history;

import kr.ac.icia.dto.course.CourseDto;
import kr.ac.icia.service.admin.mm.course.history.CourseHistoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RequestMapping("/admin/mm/course/history/api")
@RestController
public class CourseHistoryRestController {

    @Autowired
    private final CourseHistoryService courseHistoryService;

    @PutMapping("/write")
    public String write(CourseDto courseDto) {
        return courseHistoryService.write(courseDto);
    }

    @PatchMapping("/update")
    public String update(CourseDto courseDto) {
        return courseHistoryService.update(courseDto);
    }

    @DeleteMapping("/delete/{id}")
    public String delete(@PathVariable("id") String courseId) {
        return courseHistoryService.delete(courseId);
    }

}
