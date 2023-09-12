package kr.ac.icia.dto.admin.mm.course.history;

import kr.ac.icia.dto.course.CourseDto;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CourseHistoryDto extends CourseDto {
    private String deptName;        // 학과명
    private String pfName;          // 교수명
}
