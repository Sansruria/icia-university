package kr.ac.icia.dao.course;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.course.FilteringDto2;
import kr.ac.icia.dto.course.FilterringSearchListDto2;

@Mapper
public interface CourseSelectDao {

	List<FilteringDto2> getGrade(String stId);

	List<FilterringSearchListDto2> filteringSearch2(String stId, String req_grade, String req_semester);

}
