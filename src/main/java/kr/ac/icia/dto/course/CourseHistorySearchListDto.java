package kr.ac.icia.dto.course;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // getter, setter 어노테이션 대신 사용
@AllArgsConstructor // 모든 필드 값을 파라미터로 받는 생성자를 만들어 줌
@NoArgsConstructor // 파라미터가 없는 기본 생성자를 생성
public class CourseHistorySearchListDto {
	private String rnum;
	private String course_id; // 학수번호
	private String course_division; // 이수구분
	private String deptId; // 학과명
	private String deptname; // 학과명
	private String course_name; // 과목명
	private String pfId; //교수 아이디
	private String pfName; // 교수명
	private String pf_id;
	private String pf_name;
	// 수강요일에 수강시가 종료 월 8:00~15:00 만들것
	private String course_day; // 수강요일
	private String course_start_time;// 수강시작기간 x
	private String course_end_time;// 수강종료기간 x
	private int limit_max_count;// 수강최대인원 x
	private String course_schedule; // xml 수강요일+수강시작기간+수강종료기간 합친거
	private String grade; // 학년 o
	private String semester; // 학기 o
	private String credit; //학점
}
