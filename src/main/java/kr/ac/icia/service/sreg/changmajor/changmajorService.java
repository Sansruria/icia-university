package kr.ac.icia.service.sreg.changmajor;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.ac.icia.dao.sreg.changmajor.ChangMajorDao;
import kr.ac.icia.dto.sreg.changmajor.ChangApplyDto;
import kr.ac.icia.dto.sreg.changmajor.UserDto;

@Service
public class changmajorService {

	@Autowired
	private ChangMajorDao cDao;

	// 학과전부 불러서 채우기
	public List<UserDto> getAllfaculty() {
		return cDao.getAllfaculty();
	}

	// 학부테이블에서 학과 테이블 가져오기
	public List<UserDto> getFaculty(String departmet_line_id) {
		return cDao.getFaculty(departmet_line_id);
	}

	// 목록담기리스트
	public List<UserDto> SearchList(Map<String, String> searcConditionMap) {
		return cDao.SearchList(searcConditionMap);
	}

	// 신청버튼

	public void applyForMajor(ChangApplyDto CADto) {
		cDao.applyForMajor(CADto);

	}

	// 취소버튼
	public void deleteDept(ChangApplyDto CADto) {
		cDao.deleteDept(CADto);

	}

}
