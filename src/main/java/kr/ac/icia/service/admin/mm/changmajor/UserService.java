package kr.ac.icia.service.admin.mm.changmajor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.ac.icia.dao.admin.mm.changmajor.UserDao;
import kr.ac.icia.dto.admin.mm.sreg.User;

@Service
public class UserService {

	@Autowired
	UserDao uDao;

	public List<User> getAllUsers() {
		return uDao.getAllUsers();
	}

}