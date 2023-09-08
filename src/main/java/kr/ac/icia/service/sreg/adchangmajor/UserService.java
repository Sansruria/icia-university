package kr.ac.icia.service.sreg.adchangmajor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.sreg.adchangmajor.UserDao;
import kr.ac.icia.dto.sreg.changmajor.UserDto;

@Service
public class UserService {

	
	@Autowired
	UserDao uDao;
	
	public List<UserDto>getAllUser(){
		return uDao.getAllUser();
	}
	
	
	
	
	
	
	
}
