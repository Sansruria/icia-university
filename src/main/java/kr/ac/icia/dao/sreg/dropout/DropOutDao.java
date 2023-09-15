package kr.ac.icia.dao.sreg.dropout;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.sreg.dropout.DropOutDto;

@Mapper
public interface DropOutDao {

	String DropOutInsert(DropOutDto dODto);

	static boolean write(DropOutDto dODto) {
	
		return false;
	}
	
}
