package kr.ac.icia.dto.course;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class FilteringDto2 {
	private String grade; //학년
	private String semester; //학기
	private String st_id;  //학번
	private String req_course_id; //수강신청번호
}
