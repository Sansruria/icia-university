package kr.ac.icia.dto.sreg.pf;

import kr.ac.icia.dto.sreg.common.PersonInfoDto;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PfDto extends PersonInfoDto {
	private String pfId; // 교수번호
}
