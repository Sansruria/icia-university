package kr.ac.icia.dao.course;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.course.FilteringDto2;

@Mapper
public interface CourseSelectDao {

	List<FilteringDto2> getGrade(String stId);

	List<FilteringDto2> filtering(String grade, String stId);

}
