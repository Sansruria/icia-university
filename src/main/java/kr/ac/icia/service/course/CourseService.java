package kr.ac.icia.service.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.course.CourseDao;
import kr.ac.icia.dto.course.SubjectDto;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CourseService {
	
	@Autowired
	private CourseDao cDao ;
	
	//수강신청 리스트 출력 
	public List<SubjectDto> courseReg(String department_id, String faculty_id) {
	      // 학부, 학과 아이디를 리스트 검색조건으로 사용 
	      if(department_id == null && faculty_id == null) {
	          return cDao.AllCourseReg();
	      } else {
	          return cDao.courseReg(department_id, faculty_id);
	      }
	  }
	
	//출력할 수강신청 리스트 필터링  : 학부에 따른  학과 목록으로 필터링
	public List<SubjectDto> filteringSearch(String faculty_id) {
        return cDao.filteringSearch(faculty_id);
    }
}
