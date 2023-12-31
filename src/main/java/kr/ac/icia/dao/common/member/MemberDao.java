package kr.ac.icia.dao.common.member;

import kr.ac.icia.dto.common.file.FileDto;
import kr.ac.icia.dto.common.member.MemberDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {

	public String findPwById(MemberDto memberDto);

    public MemberDto findStInfoById(String userId);

    public MemberDto findPfInfoById(String userId);

    public String findId(MemberDto memberDto);

    public boolean findPw(MemberDto memberDto);

    public boolean resetPw(MemberDto memberDto);
    
    public boolean isExistProfile(String userId);
    
    public boolean profileUpload(FileDto fileDto);

    public boolean profileUpdate(FileDto fileDto);

}
