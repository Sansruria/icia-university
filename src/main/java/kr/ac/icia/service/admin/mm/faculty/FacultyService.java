package kr.ac.icia.service.admin.mm.faculty;

import java.util.ArrayList;

import kr.ac.icia.dto.admin.mm.common.CampusSearchDto;
import kr.ac.icia.dto.admin.mm.dept.DeptDto;
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
	public ArrayList<FacultyDto> findByCondition(CampusSearchDto searchDto) {
		ArrayList<FacultyDto> facultyList = facultyDao.findByCondition(searchDto);
		int count = findAllCount(searchDto)+1;
		
		for (FacultyDto dto : facultyList) {
			dto.setRnum(count - dto.getRnum());
		}
		
		return facultyList;
	}

	public Integer findAllCount(CampusSearchDto searchDto) {
		return facultyDao.findAllCount(searchDto);
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
	
	public String makeListHtml(CampusSearchDto searchDto) {
		String str = "";
		String prefix = "<td>";
		String suffix = "</td>";

		for (FacultyDto dto : findByCondition(searchDto)) {
			str += "<tr>";
			str += prefix;
			str += dto.getRnum();
			str += suffix;

			str += prefix;
			str += dto.getFacultyId();
			str += suffix;

			str += prefix;
			str += "<a href=\"#\" onclick=selected('" + dto.getFacultyId() + "','" + dto.getFacultyName() + "') "
					+ "style=\"cursor:pointer\" "
					+ "class=\"link-offset-2 link-underline link-underline-opacity-0\">";
			str += dto.getFacultyName();
			str += "</a>";
			str += suffix;
			str += "</tr>";
		}
		
		return str;
	}
	
}
