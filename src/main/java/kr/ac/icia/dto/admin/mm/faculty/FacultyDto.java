package kr.ac.icia.dto.admin.mm.faculty;

import kr.ac.icia.dto.admin.mm.deptline.DeptLineDto;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FacultyDto extends DeptLineDto {
	private String facultyId;
	private String facultyName;
}
