package kr.ac.icia.dto.sreg.dropout;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@Getter
@Setter
public class DropOutDto {
	private String register_change_id; //학적변경번호
	private String st_id; //학번
	private String c_reason; //변경사유
	private String a_status; //승인상태
	private String r_date; //신청일자
	private String reg_st_name; //학생이름
	private String reg_chage_status; //학적변경상태
}
