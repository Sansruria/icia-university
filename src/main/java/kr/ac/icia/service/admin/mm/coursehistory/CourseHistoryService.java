package kr.ac.icia.service.admin.mm.coursehistory;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.icia.dao.admin.mm.coursehistory.CourseHistoryDao;
import kr.ac.icia.dto.course.CourseHistoryMMDto;
import kr.ac.icia.dto.course.CourseHistorySearchListDto;
import kr.ac.icia.dto.sreg.common.SregSearchDto;
import kr.ac.icia.dto.sreg.st.StDto;
import lombok.RequiredArgsConstructor;


@Service
public class CourseHistoryService {
	
	@Autowired
	private CourseHistoryDao courseHistoryDao;
	
//  목록	
	public List<CourseHistorySearchListDto> list(){
		
				
		return courseHistoryDao.list();
	}
//	public Integer findAllCount(CourseHistoryMMDto courseHistoryMMDto) {
//		return courseHistoryDao.findAllCount(courseHistoryMMDto);
//	}
	
//	상세보기
	public  CourseHistorySearchListDto detail(String coursehId) {
		return courseHistoryDao.detail(coursehId);
	}

//	등록
	public boolean write(CourseHistoryMMDto courseHistoryMMDto) {
		
//		  String course_start_period =
//		  courseHistoryMMDto.getCourse_start_period();//오른쪽부터 읽기 String
//		  course_end_period = courseHistoryMMDto.getCourse_end_period(); String
//		  course_date = course_start_period +"~"+ course_end_period; //
//		  20201111~20201212 courseHistoryMMDto.setCourse_time(course_date);
		 
		boolean result = courseHistoryDao.write(courseHistoryMMDto);

		return result;
	}
}
