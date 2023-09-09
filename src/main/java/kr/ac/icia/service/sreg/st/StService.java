package kr.ac.icia.service.sreg.st;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import kr.ac.icia.dto.sreg.common.SregSearchDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.sreg.st.StDao;
import kr.ac.icia.dto.sreg.st.StDto;
import lombok.RequiredArgsConstructor;

@Slf4j
@RequiredArgsConstructor
@Service
public class StService {
	
	@Autowired
	private final StDao stDao;
	
	public ArrayList<StDto> findByCondition(SregSearchDto searchDto) {
		ArrayList<StDto> stList = stDao.findByCondition(searchDto);
		int count = findAllCount(searchDto)+1;

		for (StDto dto : stList) {
			dto.setRnum(count - dto.getRnum()); ;
			dto.setGender(dto.getGender().equals("1") ? "남" : "여");
		}
		return stList;
	}
	
	public Integer findAllCount(SregSearchDto searchDto) {
		return stDao.findAllCount(searchDto);
	}
	
	public StDto detail(String stId) {
		return stDao.detail(stId);
	}
	
	public String write(StDto stDto) {
		String stId = DateTimeFormatter.ofPattern("YYMM").format(LocalDate.now());
		stDto.setStId(stId.substring(0, 2));
		Integer lastNum = stDao.findLastNum(stDto);
		log.info("lastNum : {}", lastNum);
		String numbering = "";

		// 조회 결과가 없을 경우에 0으로 초기화
		if (lastNum == null) {
			lastNum = 0;
		}

		// 조회 결과가 9 미만일 경우
		if (lastNum < 9) {
			numbering = "0" + (++lastNum);
		} else {
			// 조회 결과가 9 이상일 경우
			numbering += ++lastNum;
		}

		stId += stDto.getDeptId() + numbering;
		stDto.setStId(stId);

		// 주민등록번호 뒷자리를 비밀번호로 함
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String password = stDto.getRrn();
		String[] splitPassword = password.split("-");
		stDto.setPassword(passwordEncoder.encode(splitPassword[1]));
		boolean result = stDao.write(stDto);
		
		if (result) {
			return "저장에 성공하였습니다";
		}
		return "저장에 실패했습니다";
	}
	
	public String update(StDto stDto) {
		boolean result = stDao.update(stDto);
		
		if (result) {
			return "수정에 성공하였습니다";
		}
		return "수정에 실패했습니다";
	}
	
	public String delete(String stId) {
		boolean result = stDao.delete(stId);
		
		if (result) {
			return "삭제에 성공하였습니다";
		}
		return "삭제에 실패했습니다";
	}

	public String national(String national) {
		switch (national) {
			case "KR" :
				return "한국";
			case "JP" :
				return "일본";
			case "CN" :
				return "중국";
			case "US" :
				return "미국";
			case "UK" :
				return "영국";
		}
		return null;
	}

}
