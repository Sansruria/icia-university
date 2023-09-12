package kr.ac.icia.service.course.reg;

import kr.ac.icia.dao.course.reg.CourseRegDao;
import kr.ac.icia.dto.course.CourseSearchDto;
import kr.ac.icia.dto.course.reg.CourseRegDto;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

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
}
