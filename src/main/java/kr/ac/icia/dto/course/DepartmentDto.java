package kr.ac.icia.dto.course;

import java.sql.Timestamp;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

//학과DTO
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class DepartmentDto {
	private String department_id; //pk //학과번호
	private String faculty_id; //fk //학부번호
	private String department_name; //학과명
	private Timestamp create_date; //개설일자
	private String status; //운영상태 
}
