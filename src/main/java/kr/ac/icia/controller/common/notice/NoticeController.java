package kr.ac.icia.controller.common.notice;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.icia.dto.common.notice.NoticeDto;
import kr.ac.icia.dto.common.notice.NoticeSearchDto;
import kr.ac.icia.service.common.notice.NoticeService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/common")
@Controller
public class NoticeController {
	
	@Autowired
	private final NoticeService noticeService;
	
//	목록
	@GetMapping("/notice")
	public String list(NoticeSearchDto searchDto, Model model
			, @RequestParam(value="nowPage", required = false) String nowPage
			, @RequestParam(value="cntPerPage", required = false) String cntPerPage) {
		
		int total = noticeService.findAllCount(searchDto);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}
		else if (nowPage == null) {
			nowPage = "1";
		}
		else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		
		searchDto = new NoticeSearchDto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), searchDto);
		ArrayList<NoticeDto> noticeList = noticeService.findByCondition(searchDto);
		model.addAttribute("searchDto", searchDto);
		model.addAttribute("paging", searchDto.makePagingHtml());
		model.addAttribute("noticeList", noticeList);
		
		return "common/notice/noticeList";
	}
	
//	상세
	@GetMapping("/notice/{id}")
	public String detail(@PathVariable("id") String id, Model model) {
		model.addAttribute("noticeDto", noticeService.detail(id));
		return "common/notice/noticeDetail";
	}
	
//	글쓰기
	@GetMapping("/notice/write")
	public String write() {
		return "common/notice/noticeWrite";
	}
	
//	수정
	@GetMapping("/notice/update/{id}")
	public String update(@PathVariable("id") String id, Model model) {
		model.addAttribute("noticeDto", noticeService.detail(id));
		return "common/notice/noticeUpdate";
	}

}
