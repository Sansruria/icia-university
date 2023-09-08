package kr.ac.icia.dto.course;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

//학생&교수DTO

@Data
@Builder
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
public class PersonDto {
	private String st_id; //pk //학생 학번
	private String pf_id; //pk //교수번호
	private String department_id; //fk //학과번호
	private String rrn; //주민등록번호
	private String password; //비밀번호
	private String st_name; //학생명
	private String pf_name; //교수명 
	private String gender; //성별
	private String adderss; //주소
	private String email; //이메일
	private String profile; //프로필
	private String national; //국적 
}
