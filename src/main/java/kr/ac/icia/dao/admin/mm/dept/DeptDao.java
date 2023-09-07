package kr.ac.icia.dao.admin.mm.dept;

import java.util.ArrayList;

import kr.ac.icia.dto.admin.mm.common.CampusSearchDto;
import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.admin.mm.dept.DeptDto;

@Mapper
public interface DeptDao {
	
	public ArrayList<DeptDto> findByCondition(CampusSearchDto campusSearchDto);
	
	public DeptDto detail(String deptId);
	
	public boolean write(DeptDto deptDto);
	
	public boolean update(DeptDto depDto);
	
	public boolean delete(String deptId);

    Integer findAllCount(CampusSearchDto campusSearchDto);
}
