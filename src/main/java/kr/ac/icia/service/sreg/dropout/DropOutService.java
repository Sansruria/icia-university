package kr.ac.icia.service.sreg.dropout;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.sreg.dropout.DropOutDao;
import kr.ac.icia.dto.admin.mm.dept.DeptDto;
import kr.ac.icia.dto.sreg.dropout.DropOutDto;

@Service
public class DropOutService {

	@Autowired
	private DropOutDao DODao;

	public String DropOutInsert(DropOutDto dODto) {
		return DODao.DropOutInsert(dODto);
	} 
//	등록
	public String write(DropOutDto dODto) {
		boolean result = DropOutDao.write(dODto);
		
		if (result) {
			return "등록 되었습니다.";
		}
		return "등록이 실패했습니다.";
	}
	
}
