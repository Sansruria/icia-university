package kr.ac.icia.dto.sreg.changmajor;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
public class UserDto {
	
	
    private String st_name;
    private String st_Id;//학번
    private String department_name;//학과명
    private String status;//승인상태
    private String email;
	private int rnum;
	
	
	

}
