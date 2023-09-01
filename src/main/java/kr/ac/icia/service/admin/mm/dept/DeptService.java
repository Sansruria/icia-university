package kr.ac.icia.service.admin.mm.dept;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.ac.icia.dao.admin.mm.dept.DeptDao;
import kr.ac.icia.dto.admin.mm.dept.DeptDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class DeptService {
	
	private final DeptDao deptDao;

//	목록
	public ArrayList<DeptDto> findByCondition() {
		return deptDao.findByCondition();
	}
	
//	상세
	public DeptDto detail(String deptId) {
		return deptDao.detail(deptId);
	}
	
//	등록
	public String write(DeptDto deptDto) {
		boolean result = deptDao.write(deptDto);
		
		if (result) {
			return "저장에 성공하였습니다";
		}
		return "저장에 실패했습니다";
	}
	
//	수정
	public String update(DeptDto deptDto) {
		boolean result = deptDao.update(deptDto);
		
		if (result) {
			return "수정에 성공하였습니다";
		}
		return "수정에 실패했습니다";
	}
	
//	삭제
	public String delete(String deptId) {
		boolean result = deptDao.delete(deptId);
		
		if (result) {
			return "삭제에 성공하였습니다";
		}
		return "삭제에 실패했습니다";
	}
	
}
