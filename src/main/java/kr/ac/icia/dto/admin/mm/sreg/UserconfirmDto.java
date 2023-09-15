package kr.ac.icia.dto.admin.mm.sreg;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class UserconfirmDto {

	
	private String st_Id;// 학번
	private String st_name;
	private String department_name;// 학과명
	private String email;
	private String status;// 승인상태
	private int rnum;// 번호
	private String confirm; //승인
	private String unconfirm;//승인보류
	
	}


	

