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
public class FilterringSearchListDto {
	private String course_id; //학수번호
	private String pf_id; //교수번호
	private String department_id; //학과번호
	private String course_division; //이수구분
	private String credit; //학점
	private String grade; //학년
	private String semester; //학기
	private String course_name; //과목명
	private String pf_name; //교수명
	private String course_time; //수강시간
	
}
