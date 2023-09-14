package kr.ac.icia.service.common.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	public MemberDto login(MemberDto memberDto) {
//		입력 받은 아이디가 교수인지 학생인지 구분
//		입력 받은 아이디가 존재하는지와 입력한 비밀번호 조회
		String foundPw;
		String isPf = memberDto.getUserId().substring(0,1);
		if (isPf.equals("P") || memberDto.getUserId().equals("admin")) {
//			교수일 때
			memberDto.setTableName("pf");
			memberDto.setColumnName("pf_id");
		} else {
//			학생일 때
			memberDto.setTableName("st");
			memberDto.setColumnName("st_id");
		}

		foundPw = memberDao.findPwById(memberDto);
		if (foundPw != null) {
//			입력받은 비밀번호를 암호화하고 가져온 비밀번호와 일치하는지 비교함
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			if (passwordEncoder.matches(memberDto.getPassword(), foundPw)) {
				if (isPf.equals("P") || memberDto.getUserId().equals("admin")) {
					return memberDao.findPfInfoById(memberDto.getUserId());
				} else {
					return memberDao.findStInfoById(memberDto.getUserId());
				}

			} else {
				return null;
			}

		} else {
			return null;
		}
		
	}

	public String findId(MemberDto memberDto) {
		String foundId = memberDao.findId(memberDto);
		if (foundId != null || foundId != "") {
			return foundId;
		}

		return null;
	}

	public String findPw(MemberDto memberDto) {
		memberDto = kindOfPerson(memberDto); // 교수인지 학생인지 구분하는 작업
		boolean isExist = memberDao.findPw(memberDto);
		if (isExist) {
			MemberDto updateMember;
			if (memberDto.getTableName().equals("pf")) {
				updateMember = memberDao.findPfInfoById(memberDto.getUserId());
			} else {
				updateMember = memberDao.findStInfoById(memberDto.getUserId());
			}

			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String[] splitPassword = updateMember.getRrn().split("-");
			updateMember.setPassword(passwordEncoder.encode(splitPassword[1]));
			updateMember.setTableName(memberDto.getTableName());
			updateMember.setColumnName(memberDto.getColumnName());
			boolean result = memberDao.resetPw(updateMember);

			if (result) {
				return "비밀번호가 초기화되었습니다.\n초기화된 비밀번호는 주민번호뒷자리입니다.";
			} else {
				return null;
			}
		}

		return null;
	}

	public MemberDto findStInfoById(String stId) {
		return memberDao.findStInfoById(stId);
	}

	public MemberDto kindOfPerson(MemberDto memberDto) {
		String isPf = memberDto.getUserId().substring(0,1);
		if (isPf.equals("P") || memberDto.getUserId().equals("admin")) {
//			교수일 때
			memberDto.setTableName("pf");
			memberDto.setColumnName("pf_id");
		} else {
//			학생일 때
			memberDto.setTableName("st");
			memberDto.setColumnName("st_id");
		}
		return memberDto;
	}

}