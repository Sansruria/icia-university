package kr.ac.icia.dto.course;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CourseDto {
    private int rnum;
    private String deptId;          // 학과번호
    private String pfId;            // 교수번호
    private String courseId;        // 수강내역번호
    private String courseName;      // 수강명
    private String courseDivision;  // 이수구분
    private String limitMaxCount;   // 수강신청최대인원
    private String grade;           // 학년
    private String credit;          // 학점
    private String semester;        // 학기
    private String courseDay;       // 요일
    private String courseStartTime; // 수강시작시간
    private String courseEndTime;   // 수강종료시간
}
