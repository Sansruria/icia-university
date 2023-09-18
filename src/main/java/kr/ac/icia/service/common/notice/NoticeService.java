package kr.ac.icia.service.common.notice;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dao.common.notice.NoticeDao;
import kr.ac.icia.dto.common.member.MemberDto;
import kr.ac.icia.dto.common.notice.NoticeDto;
import kr.ac.icia.dto.common.notice.NoticeSearchDto;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class NoticeService {
	
	@Autowired
	private final NoticeDao noticeDao;
	
//	목록
	public ArrayList<NoticeDto> findByCondition(NoticeSearchDto searchDto) {
		return noticeDao.findByCondition(searchDto);
	}
	
	public Integer findAllCount(NoticeSearchDto searchDto) {
		return noticeDao.findAllCount(searchDto);
	}
	
//	상세
	public NoticeDto detail(String id) {
		return noticeDao.detail(id);
	}
	
//	등록
	public String write(NoticeDto noticeDto, HttpSession session) {
		MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
		noticeDto.setWriter(memberInfo.getUserId());
		
		boolean result = noticeDao.write(noticeDto);
		
		if (result) {
			return "공지를 등록하였습니다";
		}
		
		return "공지 등록에 실패하였습니다";
	}
	
//	수정
	public String update(NoticeDto noticeDto, HttpSession session) {
		MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
		noticeDto.setWriter(memberInfo.getUserId());
		
		boolean result = noticeDao.update(noticeDto);
		
		if (result) {
			return "공지를 수정하였습니다";
		}
		
		return "공지 수정에 실패하였습니다";
	}
	
//	삭제
	public String delete(String id) {
		boolean result = noticeDao.delete(id);
		
		if (result) {
			return "공지를 삭제하였습니다";
		}
		
		return "공지 삭제에 실패하였습니다";
	}

}
