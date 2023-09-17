package kr.ac.icia.dto.sreg.changmajor;

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
public class ChangApplyDto {
	
	private String semester;
    private String departmentLineName;
    private String facultyName;
    private String departmentName;

}
