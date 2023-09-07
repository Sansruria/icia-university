package kr.ac.icia.dao.sreg.st;

import java.util.ArrayList;

import kr.ac.icia.dto.sreg.common.SregSearchDto;
import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.sreg.st.StDto;

@Mapper
public interface StDao {
	
	public ArrayList<StDto> findByCondition(SregSearchDto searchDto);
	
	public Integer findAllCount(SregSearchDto searchDto);
	
	public StDto detail(String stId);
	
	public boolean write(StDto stDto);
	
	public boolean update(StDto stDto);
	
	public boolean delete(String stId);
	
	public Integer findLastNum(StDto stDto);

}
