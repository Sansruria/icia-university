package kr.ac.icia.dto.sreg.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PersonInfoDto {
	private Integer rnum; 	// 번호
	private String deptId;// 학과번호
	private String deptName; // 학과명
	private String rrn;		// 주민등록번호
	private String password;// 비밀번호
	private String name;	// 이름
	private String gender;	// 성별
	private String address; // 주소
	private String email;   // 이메일
	private String profile;	// 프로필
	private String national;// 국적
}
