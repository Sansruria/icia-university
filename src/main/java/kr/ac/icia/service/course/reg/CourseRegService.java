package kr.ac.icia.service.course.reg;

import kr.ac.icia.dao.course.reg.CourseRegDao;
import kr.ac.icia.dto.course.CourseSearchDto;
import kr.ac.icia.dto.course.reg.CourseRegDto;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.UUID;

@RequiredArgsConstructor
@Service
public class CourseRegService {

    @Autowired
    private final CourseRegDao courseRegDao;

    public ArrayList<CourseRegDto> findByCondition(CourseSearchDto courseSearchDto) {
        return courseRegDao.findByCondition(courseSearchDto);
    }

    public Integer findAllCount(CourseSearchDto searchDto) {
        return courseRegDao.findAllCount(searchDto);
    }

    public String applyCourse(CourseRegDto courseRegDto) {
        courseRegDto.setReqCourseId(UUID.randomUUID().toString());
        boolean result = courseRegDao.applyCourse(courseRegDto);

        if (result) {
            return "수강신청되었습니다.";
        }

        return "수강신청에 실패하였습니다.";
    }
}
