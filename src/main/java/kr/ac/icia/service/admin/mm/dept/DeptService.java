package kr.ac.icia.service.admin.mm.dept;

import java.util.ArrayList;

import kr.ac.icia.dto.admin.mm.common.CampusSearchDto;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.admin.mm.dept.DeptDao;
import kr.ac.icia.dto.admin.mm.dept.DeptDto;
import kr.ac.icia.dto.admin.mm.deptline.DeptLineDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Service
public class DeptService {
	
	private final DeptDao deptDao;

//	목록
	public ArrayList<DeptDto> findByCondition(CampusSearchDto searchDto) {
		return deptDao.findByCondition(searchDto);
	}

	public Integer findAllCount(CampusSearchDto searchDto) {
		return deptDao.findAllCount(searchDto);
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
	
	public String makeListHtml(CampusSearchDto searchDto) {
		String str = "";
		String prefix = "<td>";
		String suffix = "</td>";

		int count = findAllCount(searchDto)+1;

		for (DeptDto dto : findByCondition(searchDto)) {
			str += "<tr>";
			str += prefix;
			str += count - dto.getRnum();
			str += suffix;

			str += prefix;
			str += dto.getDeptId();
			str += suffix;

			str += prefix;
			str += "<a href=\"#\" onclick=selected('" + dto.getDeptId() + "','" + dto.getDeptName() + "') "
					+ "style=\"cursor:pointer\" "
					+ "class=\"link-offset-2 link-underline link-underline-opacity-0\">";
			str += dto.getDeptName();
			str += "</a>";
			str += suffix;
			str += "</tr>";
		}
		
		return str;
	}
}
