package kr.ac.icia.dao.admin.mm.course.history;

import kr.ac.icia.dto.admin.mm.course.history.CourseHistoryDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CourseHistoryDao {

    public boolean write(CourseHistoryDto courseHistoryDto);

}
