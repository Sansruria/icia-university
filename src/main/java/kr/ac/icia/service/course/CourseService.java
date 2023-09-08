package kr.ac.icia.service.course;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.icia.dao.course.CourseDao;
import kr.ac.icia.dto.course.FilteringDto;
import kr.ac.icia.dto.course.FilterringSearchListDto;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CourseService {
	
	@Autowired
	private CourseDao cDao ;
	
	//	수강신청 페이지 이동 시 필터링 부분 학부 드롭다운 자동 채우기
	public List<FilteringDto> getAllfaculty() {
	    return cDao.getAllfaculty();
	}
	
	// 선택한 학부 기반으로 학과 데이터 가져오기
	public List<FilteringDto> filtering(String facultyId) {
        return cDao.filtering(facultyId);
    }
	
	 // 필터링된 수강신청(수강신청 테이블이 아닌 과목 테이블)할 리스트 가져오기
	public List<FilterringSearchListDto> filteringSearch(Map<String, String> filterConditionMap) {
		return cDao.filteringSearch(filterConditionMap);
	}
	
}
