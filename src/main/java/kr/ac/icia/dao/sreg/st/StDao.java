package kr.ac.icia.dao.sreg.st;

import java.util.ArrayList;

import kr.ac.icia.dto.sreg.common.SearchDto;
import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.sreg.st.StDto;

@Mapper
public interface StDao {
	
	public ArrayList<StDto> findByCondition(SearchDto searchDto);
	
	public Integer findAllCount(SearchDto searchDto);
	
	public StDto detail(String stId);
	
	public boolean write(StDto stDto);
	
	public boolean update(StDto stDto);
	
	public boolean delete(String stId);
	
	public Integer findLastNum(StDto stDto);

}
