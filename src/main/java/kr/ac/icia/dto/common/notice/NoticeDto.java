package kr.ac.icia.dto.common.notice;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeDto {
	private Integer rnum;
	private String noticeId; // 공지번호
	private String title;     // 제목
	private String contents;  // 내용
	private String writer;    // 작성자
	private Integer hit;      // 조회수
	private String createDate;// 등록일자
	private String modifyDate;// 수정일자
}
