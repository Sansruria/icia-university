package kr.ac.icia.dao.sreg.st;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.common.PagingVO;
import kr.ac.icia.dto.sreg.st.StDto;

@Mapper
public interface StDao {
	
	public ArrayList<StDto> findByCondition(PagingVO pagingVO);
	
	public Integer findAllCount();
	
	public StDto detail(String stId);
	
	public boolean write(StDto stDto);
	
	public boolean update(StDto stDto);
	
	public boolean delete(String stId);
	
	public String countStOfYear(StDto stDto);

}
