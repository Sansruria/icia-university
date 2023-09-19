package kr.ac.icia.dto.course;

import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Builder
@Accessors(chain = true)
public class CourseRegisterDto {
<<<<<<< HEAD
	private String course_division;
	private String credit;
	private String course_name;
	private String pf_name;
	private String course_time;
	private String grade;
	private String semester;
	private String reg_course_id;
	private String course_id;
	private String req_st_id;
	private String req_st_count;
}
