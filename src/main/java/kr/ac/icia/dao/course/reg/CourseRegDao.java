package kr.ac.icia.dao.course.reg;

import kr.ac.icia.dto.course.CourseSearchDto;
import kr.ac.icia.dto.course.reg.CourseRegDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface CourseRegDao {

    public ArrayList<CourseRegDto> findByCondition(CourseSearchDto courseSearchDto);

    public Integer findAllCount(CourseSearchDto searchDto);

    boolean applyCourse(CourseRegDto courseRegDto);
}
