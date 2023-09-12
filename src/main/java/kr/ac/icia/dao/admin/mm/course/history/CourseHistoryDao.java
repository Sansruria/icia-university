package kr.ac.icia.dao.admin.mm.course.history;

import kr.ac.icia.dto.course.CourseSearchDto;
import kr.ac.icia.dto.admin.mm.course.history.CourseHistoryDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface CourseHistoryDao {
    ArrayList<CourseHistoryDto> findByCondition(CourseSearchDto searchDto);

    CourseHistoryDto detail(String courseId);

    public boolean write(CourseHistoryDto courseHistoryDto);

    Integer findLastNum(CourseHistoryDto courseHistoryDto);

    Integer findAllCount(CourseSearchDto searchDto);

    public boolean delete(String courseId);

    boolean update(CourseHistoryDto courseHistoryDto);
}
