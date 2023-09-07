package kr.ac.icia.service.sreg.st;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import kr.ac.icia.dto.sreg.common.SearchDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.sreg.st.StDao;
import kr.ac.icia.dto.common.PagingVO;
import kr.ac.icia.dto.sreg.st.StDto;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class StService {
	
	@Autowired
	private final StDao stDao;
	
	public ArrayList<StDto> findByCondition(SearchDto searchDto) {
		ArrayList<StDto> stList = stDao.findByCondition(searchDto);
		int count = findAllCount(searchDto)+1;

		for (StDto dto : stList) {
			dto.setRnum(count - dto.getRnum()); ;
			dto.setGender(dto.getGender().equals("1") ? "남" : "여");
		}
		return stList;
	}
	
	public Integer findAllCount(SearchDto searchDto) {
		return stDao.findAllCount(searchDto);
	}
	
	public StDto detail(String stId) {
		return stDao.detail(stId);
	}
	
	public String write(StDto stDto) {
		String stId = DateTimeFormatter.ofPattern("YYMM").format(LocalDate.now());
		stDto.setStId(stId.substring(0, 2));
		String numbering = stDao.countStOfYear(stDto);

		// 자릿수가 1개일 경우 앞에 0을 붙여줌
		if (numbering.length() == 1) {
			numbering = "0" + numbering;
		}

		stId += stDto.getDeptId() + numbering;
		stDto.setStId(stId);

		// 주민등록번호 뒷자리를 비밀번호로 함
		String password = stDto.getRrn();
		String[] splitPassword = password.split("-");
		stDto.setPassword(splitPassword[1]);
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
