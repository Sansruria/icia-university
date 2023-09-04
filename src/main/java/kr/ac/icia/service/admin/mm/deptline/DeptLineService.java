package kr.ac.icia.service.admin.mm.deptline;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.admin.mm.deptline.DeptLineDao;
import kr.ac.icia.dto.admin.mm.deptline.DeptLineDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class DeptLineService {
	
	@Autowired
	private final DeptLineDao deptLineDao;
	
	public String write(DeptLineDto deptLineDto) {
		boolean result = deptLineDao.write(deptLineDto);
		
		if (result) {
			return "저장에 성공하였습니다";
		}
		return "저장에 실패했습니다";
	}

	public ArrayList<DeptLineDto> findByCondition() {
		return deptLineDao.findByCondition();
	}
	
	public DeptLineDto detail(String deptLineId) {
		return deptLineDao.detail(deptLineId);
	}

	public String update(DeptLineDto deptLineDto) {
		boolean result = deptLineDao.update(deptLineDto);
		
		if (result) {
			return "수정에 성공하였습니다";
		}
		return "수정에 실패했습니다";
	}

	public String delete(String id) {
		boolean result = deptLineDao.delete(id);
		
		if (result) {
			return "삭제에 성공하였습니다";
		}
		return "삭제에 실패했습니다";
	}
	
	public String makeListHtml(String kind) {
		String str = "";
		String prefix = "<td>";
		String suffix = "</td>";
		for (DeptLineDto dto : findByCondition()) {
			str += "<tr>";
			str += prefix;
			str += dto.getRnum();
			str += suffix;
			
			str += prefix;
			str += dto.getDeptLineId();
			str += suffix;
			
			str += prefix;
			str += "<a href=\"#\" onclick=selected('" + dto.getDeptLineId() + "','" + dto.getDeptLineName() + "','" + kind +"') "
					+ "style=\"cursor:pointer\" "
					+ "class=\"link-offset-2 link-underline link-underline-opacity-0\">";
			str += dto.getDeptLineName();
			str += "</a>";
			str += suffix;
			str += "</tr>";
		}
//		String str = "";
//		String prefix = "<div class=\"col\">";
//		String suffix = "</div>";
//		for (DeptLineDto dto : findByCondition()) {
//			str += "<div class=\"row\" "
//					+ "onclick=selected('" + dto.getDeptLineId() + "','" + dto.getDeptLineName() + "','" + kind +"') style='cursor:pointer'>";
//			str += prefix;
//			str += dto.getRnum();
//			str += suffix;
//			
//			str += prefix;
//			str += dto.getDeptLineId();
//			str += suffix;
//			
//			str += prefix;
//			str += dto.getDeptLineName();
//			str += suffix;
//			str += "</div>";
//		}
		
		return str;
	}

}
