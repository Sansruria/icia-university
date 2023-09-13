package kr.ac.icia.dto.course.reg;

import kr.ac.icia.dto.course.CourseDto;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CourseRegDto extends CourseDto {
    private String reqCourseId;
    private String stId;
    private String grade;
    private String semester;
}
