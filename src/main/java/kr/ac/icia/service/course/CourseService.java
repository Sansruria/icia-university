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
		return cDao.filtering(facultyId);
	}

	// 필터링된 수강신청(수강신청 테이블이 아닌 과목 테이블)할 리스트 가져오기
	public List<FilterringSearchListDto> filteringSearch(Map<String, String> filterConditionMap) {
		return cDao.filteringSearch(filterConditionMap);
	}

	// 수강 신청 최종 처리 함수
	@Transactional
	public boolean finalApply(List<CourseRegisterDto> CRDto) throws Exception {
		// 데이터 유효성 검사
		// TODO: CRDto 검증

		// 마지막으로 사용된 시퀀스 번호를 가져옵니다.
		int sequence = cDao.getLastSequenceNumber();

		for (CourseRegisterDto course : CRDto) {
			// 등록된 학생 수를 확인합니다. (최대 30명)
			int count = cDao.getStudentCount(course.getCourse_id());
			if (count >= 30) {
				throw new CourseFullException(course.getCourse_id() + " 강의가 만석입니다.");
			}

			// 시퀀스를 기반으로 새로운 PK를 생성합니다. (CR1, CR2, ...)
			String newPk = "CR" + (++sequence);
			course.setReg_course_id(newPk);

			// 학생 수를 1명 증가시킵니다.
			course.setReq_st_count(String.valueOf(count + 1));

			// DB에 삽입합니다.
			cDao.finalApply(course);
		}
		return true;
	}

}
