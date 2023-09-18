package kr.ac.icia.dto.common.notice;

import kr.ac.icia.dto.common.Paging;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class NoticeSearchDto extends Paging {
	private String title;     // 제목
	private String contents;  // 내용
	private String writer;    // 작성자
	private Integer hit;      // 조회수
	private String createDate;// 등록일자
	
	public NoticeSearchDto(int total, int nowPage, int cntPerPage, NoticeSearchDto searchDto) {
		super(total, nowPage, cntPerPage);
		this.title = searchDto.title;
		this.contents = searchDto.contents;
		this.writer = searchDto.writer;
		this.hit = searchDto.hit;
		this.createDate = searchDto.createDate;
	}
	
	
}
