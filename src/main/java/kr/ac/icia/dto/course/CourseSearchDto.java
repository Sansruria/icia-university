package kr.ac.icia.dto.course;

import kr.ac.icia.dto.common.Paging;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CourseSearchDto extends Paging {
    private String courseId;      // 수강번호
    private String courseName;    // 수강명
    private String courseDivision;// 이수구분
    private String deptName;      // 학과명
    private String pfName;        // 교수명
    private String grade;   // 학생학년
    private String semester;// 학생학기

    public CourseSearchDto(int total, int nowPage, int cntPerPage, CourseSearchDto searchDto) {
        super(total, nowPage, cntPerPage);
        this.courseId = searchDto.getCourseId();
        this.courseName = searchDto.getCourseName();
        this.courseDivision = searchDto.getCourseDivision();
        this.deptName = searchDto.getDeptName();
        this.pfName = searchDto.getPfName();
        this.grade = searchDto.getGrade();
        this.semester = searchDto.getSemester();
    }
}
