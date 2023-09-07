package kr.ac.icia.dto.sreg.common;

import kr.ac.icia.dto.common.Paging;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SregSearchDto extends Paging {
    private String pfId; // 교수번호
    private String stId; // 학번
    private String name; // 이름
    private String status; //학적상태
    private String deptName; // 학과명

    public SregSearchDto(int total, int nowPage, int cntPerPage, SregSearchDto searchDto) {
        super(total, nowPage, cntPerPage);
        this.pfId = searchDto.getPfId();
        this.stId = searchDto.getStId();
        this.name = searchDto.getName();
        this.status = searchDto.getStatus();
        this.deptName = searchDto.getDeptName();
    }

}
