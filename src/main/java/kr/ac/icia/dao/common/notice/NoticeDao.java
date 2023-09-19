package kr.ac.icia.dao.common.notice;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.icia.dto.common.notice.NoticeDto;
import kr.ac.icia.dto.common.notice.NoticeSearchDto;

@Mapper
public interface NoticeDao {
	
	public ArrayList<NoticeDto> findByCondition(NoticeSearchDto searhDto);
	
	public ArrayList<NoticeDto> findAll();
	
	public Integer findAllCount(NoticeSearchDto searchDto);
	
	public NoticeDto detail(String id);
	
	public boolean write(NoticeDto noticeDto);
	
	public boolean update(NoticeDto noticeDto);
	
	public boolean delete(String id);
	
}
