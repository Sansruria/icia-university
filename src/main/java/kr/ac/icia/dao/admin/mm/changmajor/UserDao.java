package kr.ac.icia.dao.admin.mm.changmajor;


import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.ac.icia.dto.admin.mm.sreg.UserconfirmDto;
@Mapper

public interface UserDao {

	List<UserconfirmDto> getAllUsers();

void updateUserStatus(@Param("st_Id") String st_Id, @Param("status") String status);
	
	

}
	


