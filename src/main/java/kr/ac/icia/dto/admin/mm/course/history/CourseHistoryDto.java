package kr.ac.icia.dto.admin.mm.course.history;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CourseHistoryDto {
    private String courseId;
    private String deptId;
    private String pfId;
    private String courseDivision;
    private String courseName;
    private String limitMaxCount;
    private String credit;
    private String grade;
    private String semester;
    private String courseDay;
    private String courseStartTime;
    private String courseEndTime;
}
