package kr.ac.icia.dao.admin.mm.deptline;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.admin.mm.deptline.DeptLineDto;

@Mapper
public interface DeptLineDao {
	
	public ArrayList<DeptLineDto> findByCondition();
	
	public DeptLineDto detail(String deptLineId);
	
	public boolean write(DeptLineDto deptLineDto);
	
	public boolean update(DeptLineDto deptLineDto);
	
	public boolean delete(String id);
	
}
