package kr.ac.icia.dao.common.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {

	public boolean findPwByStId();
	
	public boolean findPwByPfId();

}
