package kr.ac.icia.controller.common.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dto.common.notice.NoticeDto;
import kr.ac.icia.service.common.notice.NoticeService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/common/notice/api")
@RestController
public class NoticeRestController {
	
	@Autowired
	private final NoticeService noticeService;
	
//	등록
	@PutMapping("/write")
	public String write(NoticeDto noticeDto, HttpSession session) {
		return noticeService.write(noticeDto, session);
	}
	
//	수정
	@PatchMapping("/update")
	public String update(NoticeDto noticeDto, HttpSession session) {
		return noticeService.update(noticeDto, session);
	}
	
//	삭제
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable("id") String id) {
		return noticeService.delete(id);
	}

}
