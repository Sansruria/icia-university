package kr.ac.icia.service.sreg.st;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.sreg.st.StDao;
import kr.ac.icia.dto.sreg.st.StDto;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class StService {
	
	@Autowired
	private final StDao stDao;
	
	public ArrayList<StDto> findByCondition() {
		ArrayList<StDto> stList = stDao.findByCondition();
		for (StDto dto : stList) {
			if (dto.getGender().equals("1")) {
				dto.setGender("남");
			}
			else {
				dto.setGender("여");
			}
		}
		
		return stList;
	}
	
	public StDto detail(String stId) {
		return stDao.detail(stId);
	}
	
	public String write(StDto stDto) {
		String stId = DateTimeFormatter.ofPattern("YYMM").format(LocalDate.now());
		stDto.setStId(stId.substring(0, 2));
		String numbering = stDao.countStOfYear(stDto);
		
		if (numbering.length() == 1) {
			if (numbering.equals("0")) {
				numbering = "1";
			}
			numbering = "0" + numbering;
		}
		stId += stDto.getDeptId() + numbering;
		stDto.setStId(stId);
		
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
			return "저장에 성공하였습니다";
		}
		return "저장에 실패했습니다";
	}
	
	public String delete(String stId) {
		boolean result = stDao.delete(stId);
		
		if (result) {
			return "저장에 성공하였습니다";
		}
		return "저장에 실패했습니다";
	}

}
