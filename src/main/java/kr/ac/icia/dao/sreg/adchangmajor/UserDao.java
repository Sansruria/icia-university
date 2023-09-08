package kr.ac.icia.dao.sreg.adchangmajor;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.sreg.changmajor.UserDto;

@Mapper
public interface UserDao {

	List<UserDto> getAllUser();
	
}
