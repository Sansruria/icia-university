package kr.ac.icia.dto.common.member;

import kr.ac.icia.dto.sreg.common.PersonInfoDto;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDto extends PersonInfoDto {
	private String userId; // 계정 (학번, 교수번호)
	private String status; // 학적상태

}
