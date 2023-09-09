package kr.ac.icia.dao.common.member;

import kr.ac.icia.dto.common.member.MemberDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {

	public String findPwById(MemberDto memberDto);

    public MemberDto findStInfoById(String userId);

    public MemberDto findPfInfoById(String userId);
}
