package kr.ac.icia.dto.course;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // getter, setter 어노테이션 대신 사용
@AllArgsConstructor // 모든 필드 값을 파라미터로 받는 생성자를 만들어 줌
@NoArgsConstructor // 파라미터가 없는 기본 생성자를 생성
public class CourseHistorySearchListDto2 {
	private Integer rnum;
	private String deptId;
	private String deptName;
	private String deptLineId;
	private String deptLineName;
	private String facultyId;
	private String facultyName;
	private String createDate;
	private String status;
	
	private String stId; // 학번
	private String stName;
	private String pfId; // 교수번호
	private String pfName;
	
	private String course_id; //학수번호 o
	private String course_name; // 과목명 o
	private String course_division; // 이수구분 o
	private String course_day; // 수강요일
	private String course_start_time;//수강시작기간 x
	private String course_end_time;//수강종료기간 x
	private String grade; //학년 o
	private String semester; //학기 o
	private String credit;
	private int limit_max_count;//수강최대인원 x
}
