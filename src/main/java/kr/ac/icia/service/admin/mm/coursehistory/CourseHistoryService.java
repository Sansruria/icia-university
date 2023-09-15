package kr.ac.icia.service.admin.mm.coursehistory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.admin.mm.coursehistory.CourseHistoryDao;
import kr.ac.icia.dto.course.CourseHistoryMMDto;


@Service
public class CourseHistoryService {
	
	@Autowired
	private CourseHistoryDao courseHistoryDao;

//	등록
	public String write(CourseHistoryMMDto courseHistoryMMDto) {
		String course_start_period = courseHistoryMMDto.getCourse_start_period();//오른쪽부터 읽기
		String course_end_period = courseHistoryMMDto.getCourse_end_period();
		String course_date = course_start_period +"~"+ course_end_period; // 20201111~20201212
		courseHistoryMMDto.setCourse_time(course_date);
	
		
		boolean result = courseHistoryDao.write(courseHistoryMMDto);
		if (result) {
			return "저장에 성공하였습니다";
		}
		return "저장에 실패했습니다";
	}
	
}
