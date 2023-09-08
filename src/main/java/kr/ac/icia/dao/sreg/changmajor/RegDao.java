package kr.ac.icia.dao.sreg.changmajor;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.ac.icia.dto.course.FilteringDto;


@Mapper
public interface RegDao {

	List<FilteringDto> getAllchangmajor();
	List<FilteringDto> filtering(String changemajorId);
	
}
