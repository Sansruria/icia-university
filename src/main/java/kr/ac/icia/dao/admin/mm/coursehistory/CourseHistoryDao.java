package kr.ac.icia.dao.admin.mm.coursehistory;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.course.CourseHistoryMMDto;
import kr.ac.icia.dto.course.CourseHistorySearchListDto;

@Mapper
public interface CourseHistoryDao {
	//xml의 id와 똑같아야 한다
	public List<CourseHistorySearchListDto> list();
	
//	public Integer findAllCount(CourseHistoryMMDto courseHistoryMMDto);
	
	boolean write(CourseHistoryMMDto courseHistoryMMDto);//추상메소드 

	public CourseHistorySearchListDto detail(String coursehId);

}
