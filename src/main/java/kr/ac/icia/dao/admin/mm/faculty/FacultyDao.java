package kr.ac.icia.dao.admin.mm.faculty;

import java.util.ArrayList;

import kr.ac.icia.dto.admin.mm.common.CampusSearchDto;
import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.admin.mm.faculty.FacultyDto;

@Mapper
public interface FacultyDao {
	
	public ArrayList<FacultyDto> findByCondition(CampusSearchDto searchDto);
	
	public FacultyDto detail(String facultyId);
	
	public boolean write(FacultyDto facultyDto);
	
	public boolean update(FacultyDto facultyDto);
	
	public boolean delete(String facultyId);

	Integer findAllCount(CampusSearchDto searchDto);
	
}
