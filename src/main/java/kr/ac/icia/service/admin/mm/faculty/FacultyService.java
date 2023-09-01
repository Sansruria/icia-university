package kr.ac.icia.service.admin.mm.faculty;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.admin.mm.faculty.FacultyDao;
import kr.ac.icia.dto.admin.mm.faculty.FacultyDto;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class FacultyService {
	
	@Autowired
	private final FacultyDao facultyDao;
	
//	목록
	public ArrayList<FacultyDto> findByCondition() {
		return facultyDao.findByCondition();
	}
	
//	상세
	public FacultyDto detail(String facultyId) {
		return facultyDao.detail(facultyId);
	}
	
//	등록
	public String write(FacultyDto facultyDto) {
		boolean result = facultyDao.write(facultyDto);
		
		if (result) {
			return "저장에 성공하였습니다";
		}
		return "저장에 실패했습니다";
	}
	
//	수정
	public String update(FacultyDto facultyDto) {
		boolean result = facultyDao.update(facultyDto);
		
		if (result) {
			return "수정에 성공하였습니다";
		}
		return "수정에 실패했습니다";
	}
	
//	삭제
	public String delete(String facultyId) {
		boolean result = facultyDao.delete(facultyId);
		
		if (result) {
			return "삭제에 성공하였습니다";
		}
		return "삭제에 실패하였습니다";
	}
	
	public String makeListHtml(String kind) {
		String str = "";
		String prefix = "<div class=\"col\">";
		String suffix = "</div>";
		for (FacultyDto dto : findByCondition()) {
			str += "<div class=\"row\" "
					+ "onclick=selected('" + dto.getFacultyId() + "','" + dto.getFacultyName() + "','" + kind +"') style='cursor:pointer'>";
			str += prefix;
			str += dto.getRnum();
			str += suffix;
			
			str += prefix;
			str += dto.getFacultyId();
			str += suffix;
			
			str += prefix;
			str += dto.getFacultyName();
			str += suffix;
			str += "</div>";
		}
		
		return str;
	}
	
}
