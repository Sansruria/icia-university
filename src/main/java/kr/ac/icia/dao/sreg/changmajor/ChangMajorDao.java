package kr.ac.icia.dao.sreg.changmajor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.sreg.changmajor.ChangApplyDto;
import kr.ac.icia.dto.sreg.changmajor.UserDto;

@Mapper
public interface ChangMajorDao {

	

	//드롭다운 데이터 채우기
	List<UserDto> getAllfaculty();
	//학부의 학과 데이터 가져오기
	List<UserDto> getFaculty(String departmet_line_id);
	//목록담기
	List<UserDto> SearchList(Map<String, String> searcConditionMap);
	//신청버튼
	void applyForMajor(ChangApplyDto cADto);
	//취소버튼
	void deleteDept(ChangApplyDto cADto);
	//전과신청기능
	void requestChangMajorList(HashMap<String, String> map);
	//전과신청목록조회
	UserDto requestChangMajorList2(String st_id);

}
