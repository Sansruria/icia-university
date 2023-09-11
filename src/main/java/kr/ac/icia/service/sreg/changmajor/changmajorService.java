package kr.ac.icia.service.sreg.changmajor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.sreg.changmajor.ChangMajorDao;
import kr.ac.icia.dto.sreg.changmajor.UserDto;

@Service
public class changmajorService {

	@Autowired
	private ChangMajorDao uDao;

	
	public List<UserDto> getAllfaculty() {
		return uDao.getAllfaculty();
	}

	//학부에에서 학과 데이터 
	public List<UserDto> getDepartments(String facultyId) {
		return uDao.getDepartments(facultyId);
	}


}