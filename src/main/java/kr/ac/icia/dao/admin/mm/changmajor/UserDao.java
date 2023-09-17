package kr.ac.icia.dao.admin.mm.changmajor;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.ac.icia.dto.admin.mm.sreg.UserconfirmDto;
import kr.ac.icia.dto.sreg.changmajor.UserDto;

@Mapper

public interface UserDao {

	List<UserconfirmDto> getAllUsers();

	void updateUserStatus(@Param("st_Id") String st_Id, @Param("status") String status);

	List<UserDto> LineSearchList(Map<String, String> serchConditionMap);

}
