package kr.ac.icia.dto.sreg.st;

import kr.ac.icia.dto.sreg.common.PersonInfoDto;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StDto extends PersonInfoDto {
	private String stId;     // 학번
	private String status;   //학적상태
	private String grade;    //학년
	private String semester; //학기
}
