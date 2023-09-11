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
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Accessors(chain = true)
public class CourseHistoryMMDto  {
	private String course_id; //학수번호
	private String department_id; //학과번호
	private String pf_id; //교수번호
	private String credit; //학점
	private String course_name; // 과목명
	private String deptName; //학과명
	private String pf_name;
	private String course_division; // 이수구분 
	private String course_time; //수강시간
//	private String course_start_period;//수강시작기간
//	private String course_end_period;//수강종료기간
	private String grade; //학년
	private String semester; //학기
	private int limit_max_count;//수강인원최대인원
	}

