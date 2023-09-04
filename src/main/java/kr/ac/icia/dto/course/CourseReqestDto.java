package kr.ac.icia.dto.course;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

//수강신청DTO
@Data
@Builder
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
public class CourseReqestDto {
	private String req_course_id; //pk //수강신청번호
	private String course_id; //fk //학수번호
	private String st_id; //fk //학번
	private String gender; //학년
	private String semester; //학
}
