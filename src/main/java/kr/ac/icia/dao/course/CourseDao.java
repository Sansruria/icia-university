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
	List<FilterringSearchListDto> filteringSearch(Map<String, String> filterConditionMap); // ST_ID를 포함한 Map

	// 특정 강좌에 등록된 학생 수를 가져오기
	int getStudentCount(String courseId);

	// 마지막으로 사용된 시퀀스 번호를 가져오기
	Integer getLastSequenceNumber();

	/// 수강 신청 정보를 삽입
	int finalApply(CourseRegisterDto CRDto);

	// 특정 강의의 최대 학생 수를 가져오기
	int getMaxStudentLimitForCourse(String course_id);

}
