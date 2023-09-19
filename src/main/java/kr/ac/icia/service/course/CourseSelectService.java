package kr.ac.icia.service.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.course.CourseSelectDao;
import kr.ac.icia.dto.course.FilteringDto2;

@Service
public class CourseSelectService {
	
	@Autowired
	private CourseSelectDao csDao;

	public List<FilteringDto2> getGrade(String stId) {
        return csDao.getGrade(stId);
    }

	public List<FilteringDto2> filtering2(String grade, String stId) {
		return csDao.filtering2(grade, stId);
	}

}
