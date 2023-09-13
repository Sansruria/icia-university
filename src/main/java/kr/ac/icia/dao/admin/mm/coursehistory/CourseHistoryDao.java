package kr.ac.icia.dao.admin.mm.coursehistory;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.course.CourseHistoryMMDto;
import kr.ac.icia.dto.course.CourseHistorySearchListDto;

@Mapper
public interface CourseHistoryDao {
	
	boolean write(CourseHistoryMMDto courseHistoryMMDto);//추상메소드 

	ArrayList<CourseHistoryMMDto> findByCondition(CourseHistoryMMDto courseHistoryMMDto);
	
	
	
}
