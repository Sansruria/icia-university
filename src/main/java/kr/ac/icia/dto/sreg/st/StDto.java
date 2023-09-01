package kr.ac.icia.dto.sreg.st;

import kr.ac.icia.dto.sreg.common.PersonInfoDto;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StDto extends PersonInfoDto {
	private String stId; // 학번
}
