package kr.ac.icia.dao.admin.mm.coursehistory;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.course.CourseHistoryMMDto;

@Mapper
public interface CourseHistoryDao {

	boolean write(CourseHistoryMMDto courseHistoryMMDto);//추상메소드 

}
