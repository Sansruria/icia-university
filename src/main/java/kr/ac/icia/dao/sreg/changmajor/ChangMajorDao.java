package kr.ac.icia.dao.sreg.changmajor;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import kr.ac.icia.dto.sreg.changmajor.UserDto;

@Mapper
public interface ChangMajorDao {

	

	//드롭다운 데이터 채우기
	List<UserDto> getAllfaculty();
	
	//학부의 학과 데이터 가져오기
	List<UserDto> getDepartments(String facultyId);
	


	
	
}
