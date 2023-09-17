package kr.ac.icia.service.sreg.changmajor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dao.sreg.changmajor.ChangMajorDao;
import kr.ac.icia.dto.common.member.MemberDto;
import kr.ac.icia.dto.sreg.changmajor.ChangApplyDto;
import kr.ac.icia.dto.sreg.changmajor.UserDto;

@Service
public class changmajorService {

	@Autowired
	private ChangMajorDao cDao;

	// 학과전부 불러서 채우기
	public List<UserDto> getAllfaculty() {
		return cDao.getAllfaculty();
	}

	// 학부테이블에서 학과 테이블 가져오기
	public List<UserDto> getFaculty(String departmet_line_id) {
		return cDao.getFaculty(departmet_line_id);
	}

	// 목록담기리스트
	public List<UserDto> SearchList(Map<String, String> searcConditionMap) {
		return cDao.SearchList(searcConditionMap);
	}

	// 신청버튼

	public void applyForMajor(ChangApplyDto CADto) {
		cDao.applyForMajor(CADto);

	}

	// 취소버튼
	public void deleteDept(ChangApplyDto CADto) {
		cDao.deleteDept(CADto);

	}

	public void requestChangMajorList(HttpSession session, String department_line_name, String facultyName,
			String departmentName) {
	    MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
	    memberInfo.getUserId(); // 접속한 학생의 아이디(학번)가져오기
	    memberInfo.getName();   // 접속한 학생의 이름 가져오기
	    memberInfo.getGrade();  // 접속한 학생의 학년 가져오기
	    memberInfo.getSemester(); // 접속한 학생의 학기 가져오기
	    memberInfo.getDeptName();
	    memberInfo.getStatus();
		//키값 넣는거 다노...ㅋ
	    
		HashMap<String,String> map = new HashMap<>();
		map.put("st_id", memberInfo.getUserId());
		map.put("st_name", memberInfo.getName());
		map.put("grade", memberInfo.getGrade());
		map.put("semester",  memberInfo.getSemester());
		map.put("status",  memberInfo.getStatus());
		map.put("a_status",  "0");//처리상태=0  ()
		map.put("department_line_name",department_line_name);
		map.put("faculty_name",facultyName);
		map.put("department_name",departmentName);
		cDao.requestChangMajorList(map);		
	}
	//학생 신청목록조회
	public UserDto requestChangMajorList2(HttpSession session) {
		
		 MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
		return cDao.requestChangMajorList2(memberInfo.getUserId());
	}
	
	
}
