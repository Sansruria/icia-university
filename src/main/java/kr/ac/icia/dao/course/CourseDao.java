package kr.ac.icia.dao.course;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.course.SubjectDto;

@Mapper
public interface CourseDao {
	
	//모든 수강신청 리스트 출력
	List<SubjectDto> AllCourseReg();
	
	//학부, 학과 검색조건으로 수강신청 리스트 출력 
	List<SubjectDto> courseReg(String department_id, String faculty_id);

	//출력할 수강신청 리스트 필터링  : 학부에 따른  학과 목록으로 필터링
	List<SubjectDto> filteringSearch(String faculty_id);

}
