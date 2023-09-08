package kr.ac.icia.service.sreg.dropout;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.sreg.dropout.DropOutDao;
import kr.ac.icia.dto.sreg.dropout.DropOutDto;

@Service
public class DropOutService {

	@Autowired
	private DropOutDao DODao;

	public String DropOutInsert(DropOutDto dODto) {
		// TODO Auto-generated method stub
		return null;
	} 
	
	
}
