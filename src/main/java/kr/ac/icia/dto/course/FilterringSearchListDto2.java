package kr.ac.icia.dto.course;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class FilterringSearchListDto2 {
	private String req_course_id; //수강신청번호
	private String st_id; // 학번
	private String course_id; // 학수번호
	private String req_grade; // 학년
	private String req_semester; // 학기
	private String req_course_division; // 이수구분
	private String req_credit; // 학점
	private String req_course_name; // 과목명
	private String req_pf_name; // 교수명
	private String req_course_time; // 수강시간
	private String reapply; //재수강
}
