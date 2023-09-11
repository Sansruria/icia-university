package kr.ac.icia.dao.course;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.course.CourseRegisterDto;
import kr.ac.icia.dto.course.FilteringDto;
import kr.ac.icia.dto.course.FilterringSearchListDto;

@Mapper
public interface CourseDao {

	// 수강신청 페이지 이동 시 필터링 부분 학부 드롭다운 자동 채우기
	List<FilteringDto> getAllfaculty();

	// 선택한 학부 기반으로 학과 데이터 가져오기
	List<FilteringDto> filtering(String facultyId);

	// 필터링된 수강신청(수강신청 테이블이 아닌 과목 테이블)할 리스트 가져오기
	List<FilterringSearchListDto> filteringSearch(Map<String, String> filterConditionMap);

	// 특정 강좌에 등록된 학생 수를 가져옵니다.
	int getStudentCount(String courseId);

	// 마지막으로 사용된 시퀀스 번호를 가져옵니다.
	int getLastSequenceNumber();

	// 새로운 강좌 등록 정보를 데이터베이스에 삽입합니다.
	void finalApply(CourseRegisterDto course);

}
