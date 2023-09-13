package kr.ac.icia.service.admin.mm.coursehistory;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.icia.dao.admin.mm.coursehistory.CourseHistoryDao;
import kr.ac.icia.dto.course.CourseHistoryMMDto;
import kr.ac.icia.dto.sreg.st.StDto;


@Service
public class CourseHistoryService {
	
	@Autowired
	private CourseHistoryDao courseHistoryDao;
	
	public ArrayList<CourseHistoryMMDto> findByCondition(CourseHistoryMMDto CourseHistoryMMDto){
		ArrayList<CourseHistoryMMDto> list = courseHistoryDao.findByCondition(CourseHistoryMMDto);
		return list;
	}

//	등록
	public boolean write(CourseHistoryMMDto courseHistoryMMDto) {
		/*
		 * String course_start_period =
		 * courseHistoryMMDto.getCourse_start_period();//오른쪽부터 읽기 String
		 * course_end_period = courseHistoryMMDto.getCourse_end_period(); String
		 * course_date = course_start_period +"~"+ course_end_period; //
		 * 20201111~20201212 courseHistoryMMDto.setCourse_time(course_date);
		 */
		boolean result = courseHistoryDao.write(courseHistoryMMDto);

		return result;
	}

	
}
