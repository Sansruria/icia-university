package kr.ac.icia.dto.common.member;

import kr.ac.icia.dto.sreg.common.PersonInfoDto;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDto extends PersonInfoDto {
	private String userId; // 계정 (학번, 교수번호)
	private String status; // 학적상태
	private String columnName;
	private String tableName;
	private String profileId;
	private String originalFileName;
	private String systemFileName;
}
