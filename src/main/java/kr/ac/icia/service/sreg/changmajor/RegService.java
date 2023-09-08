package kr.ac.icia.service.sreg.changmajor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.sreg.changmajor.RegDao;
import kr.ac.icia.dto.course.FilteringDto;

@Service
public class RegService {

	@Autowired
	private RegDao rDao;

	public List<FilteringDto> getAllchangmajor() {
		
		return rDao.getAllchangmajor();
	}

	public List<FilteringDto> filtering(String changemajorId) {
		
		return null;
	}
	

	
}
