package kr.ac.icia.dao.sreg.pf;

import kr.ac.icia.dto.admin.mm.common.CampusSearchDto;
import kr.ac.icia.dto.sreg.common.SregSearchDto;
import kr.ac.icia.dto.sreg.pf.PfDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface PfDao {
	
	public ArrayList<PfDto> findByCondition(SregSearchDto searchDto);

	public Integer findAllCount(SregSearchDto searchDto);
	
	public PfDto detail(String pfId);
	
	public boolean write(PfDto pfDto);
	
	public boolean update(PfDto pfDto);
	
	public boolean delete(String pfId);
	
	public String countPfOfYear(PfDto pfDto);

    Integer findLastNum(PfDto pfDto);

}
