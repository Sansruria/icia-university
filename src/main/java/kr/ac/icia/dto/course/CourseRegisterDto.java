package kr.ac.icia.dto.course;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

@Data
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class CourseRegisterDto {
	private String reg_course_id; //수강신청번호
	private String course_id; //학수번호
	private String req_st_id; //학번
	private String pf_id; //교수번호
	private String department_id; //학과번호
	private String req_course_division; //이수구분
	private String req_credit; //학점
	private String req_grade; //학년
	private String req_semester; //학기
	private String req_course_name; //과목명
	private String req_pf_name; //교수명
	private String req_course_time; //수강시간
	private String req_st_count; //수강신청인원	
}
