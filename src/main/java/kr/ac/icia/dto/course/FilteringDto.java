package kr.ac.icia.dto.course;

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
public class FilteringDto {
	private String faculty_id; //학부번호 
	private String department_id; //학과번호 
	private String faculty_name; //학부이름 
	private String department_name; //학과이름 
}
