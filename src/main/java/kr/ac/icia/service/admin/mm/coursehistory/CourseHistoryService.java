package kr.ac.icia.service.admin.mm.coursehistory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.admin.mm.coursehistory.CourseHistoryDao;
import kr.ac.icia.dto.course.CourseHistoryMMDto;
import lombok.RequiredArgsConstructor;

@Service
public class CourseHistoryService {
	
	@Autowired
	private CourseHistoryDao courseHistoryDao;

//	등록
	public String write(CourseHistoryMMDto courseHistoryMMDto) {
		boolean result = courseHistoryDao.write(courseHistoryMMDto);
		
		if (result) {
			return "저장에 성공하였습니다";
		}
		return "저장에 실패했습니다";
	}
}
