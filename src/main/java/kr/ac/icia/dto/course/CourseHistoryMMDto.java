package kr.ac.icia.dto.course;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //getter, setter 어노테이션 대신 사용
@AllArgsConstructor // 모든 필드 값을 파라미터로 받는 생성자를 만들어 줌
@NoArgsConstructor //파라미터가 없는 기본 생성자를 생성
public class CourseHistoryMMDto  {
	private String course_Id;//학수번호
	private String pf_id;//교수번호
	private String credit;//학점 X
	private String course_name;// 과목명
	private String deptId;//학과명 
	private String pf_name;//교수명 x
	private String department_id;//학과번호
	private String course_division; // 이수구분 
	private String course_start_period;//수강시작기간
	private String course_end_period;//수강종료기간
	private int limit_max_count;//수강인원최대인원 X
	private String grade;//학년
	private String semester;//학기 
	private String course_time;//수강시간
}

