package kr.ac.icia.dto.sreg.changmajor;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)

public class UserDto {
	private String st_id;// 학번
	private String faculty_name;// 학부명
	private String faculty_id;// 학부명
	private String department_name;// 학과명
	private String st_department_name;// 학과명
	private String department_line_id;// 학과계열번호
	private String department_line_name;// 학과계열번호
	private String st_department_line_name;// 학과계열번호
	private String st_name;
	private String status;// 승인상태
	private String a_status;// 승인상태

	private String reg_change_status;// 재학?복학? 학적상태
	private String reg_st_name;// 신청한 학생이름
	private String r_date;// 신청일자
	private int rnum;// 번호
	private String semester; //학년,학기

}
