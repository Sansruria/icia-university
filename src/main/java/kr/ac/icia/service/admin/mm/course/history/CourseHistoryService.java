package kr.ac.icia.service.admin.mm.course.history;

import kr.ac.icia.dao.admin.mm.course.history.CourseHistoryDao;
import kr.ac.icia.dto.course.CourseSearchDto;
import kr.ac.icia.dto.admin.mm.course.history.CourseHistoryDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class CourseHistoryService {

    private final CourseHistoryDao courseHistoryDao;

    public ArrayList<CourseHistoryDto> findByCondition(CourseSearchDto searchDto) {
        ArrayList<CourseHistoryDto> courseHistoryList = courseHistoryDao.findByCondition(searchDto);
        int count = findAllCount(searchDto)+1;

        for (CourseHistoryDto dto : courseHistoryList) {
            dto.setRnum(count - dto.getRnum());
        }
        return courseHistoryList;
    }

    public String write(CourseHistoryDto courseHistoryDto) {
        Integer lastNum = courseHistoryDao.findLastNum(courseHistoryDto);
        String numbering = "";

        // 조회 결과가 없을 경우에 0으로 초기화
        if (lastNum == null) {
            lastNum = 0;
        }

        // 조회 결과가 9 미만일 경우
        if (lastNum < 9) {
            numbering = "0" + (++lastNum);
        } else {
            // 조회 결과가 9 이상일 경우
            numbering += ++lastNum;
        }

        String courseId = courseHistoryDto.getDeptId();
               courseId += courseHistoryDto.getCourseDivision();
               courseId += numbering;
        courseHistoryDto.setCourseId(courseId);
        boolean result = courseHistoryDao.write(courseHistoryDto);
        if (result) {
            return "수강내역을 등록하였습니다.";
        }

        return "수강내역등록에 실패하였습니다.";
    }

    public String update(CourseHistoryDto courseHistoryDto) {
        boolean result = courseHistoryDao.update(courseHistoryDto);
        if (result) {
            return "수강내역을 수정하였습니다.";
        }

        return "수강내역수정에 실패하였습니다.";
    }

    public Integer findAllCount(CourseSearchDto searchDto) {
        return courseHistoryDao.findAllCount(searchDto);
    }

    public CourseHistoryDto detail(String courseId) {
        return courseHistoryDao.detail(courseId);
    }

    public String delete(String courseId) {
        boolean result = courseHistoryDao.delete(courseId);
        if (result) {
            return "삭제했습니다.";
        }
        return "삭제에 실패했습니다.";
    }


}
