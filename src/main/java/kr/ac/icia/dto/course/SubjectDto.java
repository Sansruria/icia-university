package kr.ac.icia.dto.course;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

//과목DTO
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class SubjectDto {
	private String course_id; //pk //학수번호 
	private String department_id; //fk //학과번호
	private String pf_id; //fk //교수번호 
	private String course_division; // 이수구분 
	private String course_name; // 과목명 
	private String limit_max_count; //수강인원 
	private String st_count; // 신청인원 
	private String credit; // 학점 
	private String course_time; //강의시간 
	//subject테이블에는 없는 컬럼이지만 사용하려고 넣었음
	private String faculty_id; //Faculty테이블의pk //학부번호
	private String faculty_name; //Faculty테이블 컬럼 //학부이름 
	private String department_name; //department테이블 컬럼 //학과이름
}
