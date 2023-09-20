package kr.ac.icia.service.course;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.icia.dao.course.CourseDao;
import kr.ac.icia.dto.course.CourseRegisterDto;
import kr.ac.icia.dto.course.FilteringDto;
import kr.ac.icia.dto.course.FilterringSearchListDto;
import kr.ac.icia.exception.course.CourseFullException;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CourseService {

	@Autowired
	private CourseDao cDao;

	// 수강신청 페이지 이동 시 필터링 부분 학부 드롭다운 자동 채우기
	public List<FilteringDto> getAllfaculty() {
		return cDao.getAllfaculty();
	}

	// 선택한 학부 기반으로 학과 데이터 가져오기
	public List<FilteringDto> filtering(String facultyId) {
		// 필요한 경우 stId 사용하는 코드 추가
		return cDao.filtering(facultyId);
	}

	// 필터링된 수강신청(수강신청 테이블이 아닌 과목 테이블)할 리스트 가져오기
	public List<FilterringSearchListDto> filteringSearch(Map<String, String> filterConditionMap) {
		// 필요한 경우 filterConditionMap.get("stId") 사용하는 코드 추가
		return cDao.filteringSearch(filterConditionMap);
	}

	// 수강 신청 최종 처리 함수
	@Transactional
	public List<CourseRegisterDto> finalApply(List<CourseRegisterDto> CRDto) throws Exception {
		// 필요한 요청 본문이 누락되었는지 먼저 확인
		if (CRDto == null || CRDto.isEmpty()) {
			log.error("CRDto 리스트가 누락되었습니다.");
			throw new IllegalArgumentException("CRDto 리스트가 누락되었습니다.");
		}
		System.out.println("서버에 요청이 도착했습니다. (Service)");
		log.info("서버에 요청이 도착했습니다.");
		System.out.println("서비스에서 처리 전 CRDto: " + CRDto);
		log.info("서비스에서 처리 전 CRDto: " + CRDto);

		// 마지막으로 사용된 시퀀스 번호를 가져오기
		Integer lastSequence = cDao.getLastSequenceNumber();
		int sequence = lastSequence != null ? lastSequence : 0;

		for (CourseRegisterDto course : CRDto) {
			// 등록된 학생 수를 확인합니다.
			int count = cDao.getStudentCount(course.getCourse_id());

			// 해당 강의의 최대 학생 수를 확인합니다.
			int maxCount = cDao.getMaxStudentLimitForCourse(course.getCourse_id());

			// 현재 등록된 학생 수가 최대 학생 수 이상이면 예외를 발생시킵니다.
			if (count >= maxCount) {
				throw new CourseFullException(course.getCourse_id() + " 강의가 만석입니다.");
			}

			// 시퀀스를 기반으로 새로운 PK를 생성합니다. (예: CR1, CR2, ...)
			String newPk = "CR" + (++sequence);
			course.setReg_course_id(newPk);

			// 학생 수를 1명 증가시킵니다.
			course.setReq_st_count(String.valueOf(count + 1));

			// DB에 삽입합니다.
			cDao.finalApply(course);
		}

		log.info("서비스에서 처리 후 CRDto: " + CRDto);
		System.out.println("서비스에서 처리 후 CRDto: " + CRDto);

		return CRDto;
	}

}
