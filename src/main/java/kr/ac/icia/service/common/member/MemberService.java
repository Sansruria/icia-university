package kr.ac.icia.service.common.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.common.member.MemberDao;
import kr.ac.icia.dto.common.member.MemberDto;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberService {
	
	@Autowired
	private final MemberDao memberDao;
	
//	로그인
	public MemberDto login() {
		boolean result = false;
		
//		학생일 때
		result = memberDao.findPwByStId();
		
//		교수일 때
		result = memberDao.findPwByPfId();
		
		return null;
	}
	
//	비밀번호 가져오기
	public String findPassword() {
		return null;
	}
	
//	회원정보 가져오기
	public MemberDto findMemberInfo() {
		return null;
	}

}
