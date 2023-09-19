package kr.ac.icia.service.common.file;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dao.common.member.MemberDao;
import kr.ac.icia.dto.common.file.FileDto;
import kr.ac.icia.dto.common.member.MemberDto;
import kr.ac.icia.service.common.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class FileService {
	
	@Autowired
	private final MemberDao memberDao;
	
	public String profileUpload(MultipartFile[] uploadFiles, HttpSession session){
	    MemberDto memberDto = (MemberDto) session.getAttribute("memberInfo");
	    String isPf = memberDto.getUserId().substring(0,1);
		if (isPf.equals("P") || memberDto.getUserId().equals("admin")) {
//			교수일 때
			memberDto.setTableName("pf");
			memberDto.setColumnName("pf_id");
		} else {
//			학생일 때
			memberDto.setTableName("st");
			memberDto.setColumnName("st_id");
		}
		
		String realPath = session.getServletContext().getRealPath("/");
		realPath += "upload/";
		
		File dir = new File(realPath);
		if (dir.isDirectory() == false) {
			dir.mkdir();
		}
		
	    for(MultipartFile file : uploadFiles){
	        String originalName = file.getOriginalFilename();
	        String fileName = originalName.substring(originalName.lastIndexOf("\\") + 1);
	        String uuid = UUID.randomUUID().toString();
	        String savefileName = realPath + File.separator + uuid + "_" + fileName;
	        Path savePath = Paths.get(savefileName);
	        
	        FileDto fileDto = new FileDto();
	        fileDto.setProfileId(UUID.randomUUID().toString());
	        fileDto.setUserId(memberDto.getUserId());
	        fileDto.setOriginalFileName(originalName);
	        fileDto.setSystemFileName(uuid + "_" + fileName);
	
	        try {
	            file.transferTo(savePath);
	            
	            boolean result = memberDao.isExistProfile(memberDto.getUserId());
	            if (result) {
	            	String deleteFilePath = realPath + memberDto.getSystemFileName();
	            	profileDelete(session, deleteFilePath);
	            	memberDao.profileUpdate(fileDto);
	            	
	            } else {
	            	memberDao.profileUpload(fileDto);
	            }
	            
	            memberDto.setOriginalFileName(originalName);
	            memberDto.setSystemFileName(uuid + "_" + fileName);
	            session.setAttribute("memberInfo", memberDto);
	            
	        } catch (IOException e) {
	            e.printStackTrace();
	            return "파일등록에 실패하였습니다.";
	        }
	    }
	    
	    return "파일을 등록하였습니다.";
	    
	}
	
	public void profileDelete(HttpSession session, String path) {
		File file = new File(path);
		log.info("path : {}", path);
		
		if (file.exists()) {
			file.delete();
			log.info("서버 파일 삭제 완료");
		} else {
			log.info("이미 삭제된 파일");
		}
	}

}
