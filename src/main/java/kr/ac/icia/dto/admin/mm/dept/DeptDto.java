package kr.ac.icia.dto.admin.mm.dept;

import kr.ac.icia.dto.admin.mm.faculty.FacultyDto;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DeptDto extends FacultyDto {
	private String deptId;
	private String deptName;
	private String status;
}
