package kr.ac.icia.service.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.course.CourseSelectDao;
import kr.ac.icia.dto.course.FilteringDto2;
import kr.ac.icia.dto.course.FilterringSearchListDto2;

@Service
public class CourseSelectService {
	
	@Autowired
	private CourseSelectDao csDao;

	public List<FilteringDto2> getGrade(String stId) {
        return csDao.getGrade(stId);
    }

	public List<FilterringSearchListDto2> filteringSearch2(String stId, String req_grade, String req_semester) {
        return csDao.filteringSearch2(stId, req_grade, req_semester);
    }


}
