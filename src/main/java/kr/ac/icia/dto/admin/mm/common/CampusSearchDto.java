package kr.ac.icia.dto.admin.mm.common;

import kr.ac.icia.dto.common.Paging;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CampusSearchDto extends Paging {
    private String deptLineName;
    private String facultyName;
    private String deptName;

    public CampusSearchDto(int total, int nowPage, int cntPerPage, CampusSearchDto campusSearchDto) {
        super(total, nowPage, cntPerPage);
        this.deptLineName = campusSearchDto.getDeptLineName();
        this.facultyName = campusSearchDto.getFacultyName();
        this.deptName = campusSearchDto.getDeptName();
    }
}
