package kr.ac.icia.dao.admin.mm.course.history;

import kr.ac.icia.dto.course.CourseDto;
import kr.ac.icia.dto.course.CourseSearchDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface CourseHistoryDao {
    ArrayList<CourseDto> findByCondition(CourseSearchDto searchDto);

    CourseDto detail(String courseId);

    public boolean write(CourseDto courseDto);

    Integer findLastNum(CourseDto courseDto);

    Integer findAllCount(CourseSearchDto searchDto);

    public boolean delete(String courseId);

    boolean update(CourseDto courseDto);
}
