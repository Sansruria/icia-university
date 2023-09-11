package kr.ac.icia.dao.admin.mm.changmajor;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import kr.ac.icia.dto.admin.mm.sreg.User;

@Mapper
public interface UserDao {
	
	List<User> getAllUsers();
	
	

}
