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

	private String faculty_name;// 학부명
	private String faculty_id;// 학부명
	private String department_name;// 학과명
	private String st_name;
	private String st_Id;// 학번
	private String status;// 승인상태
	private String email;
	private int rnum;// 번호

}
