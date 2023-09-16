package kr.ac.icia.service.admin.mm.changmajor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.ac.icia.dao.admin.mm.changmajor.UserDao;
import kr.ac.icia.dto.admin.mm.sreg.UserconfirmDto;
import kr.ac.icia.dto.sreg.changmajor.UserDto;

@Service
public class UserService {

	@Autowired
	UserDao uDao;

	public List<UserconfirmDto> getAllUsers() {

		return uDao.getAllUsers();
	}

	public void updateUserStatus(String st_Id, String status) {
		uDao.updateUserStatus(st_Id, status);
	}


	public List<UserDto> LineSearchList(Map<String, String> serchConditionMap) {

		return uDao.LineSearchList(serchConditionMap);
	}

}
