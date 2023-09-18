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
import kr.ac.icia.dto.common.member.MemberDto;
import kr.ac.icia.service.common.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Service
public class FileService {
	
	@Value("${project.uploadpath}")
	private String uploadPath;
	
	@Autowired
	private final MemberDao memberDao;
	
	public String profileUpload(MultipartFile[] uploadFiles, HttpSession session){
		Path savePath = null;
		
	    for(MultipartFile file : uploadFiles){
	        String originalName = file.getOriginalFilename();
	        String fileName = originalName.substring(originalName.lastIndexOf("\\") + 1);
	        String uuid = UUID.randomUUID().toString();
	        String savefileName = uploadPath + File.separator + uuid + "_" + fileName;
	        savePath = Paths.get(savefileName);
	
	        try {
	            file.transferTo(savePath);
	            
	        } catch (IOException e) {
	            e.printStackTrace();
	            return "파일등록에 실패하였습니다.";
	        }
	    }
	    
	    String path = null;
	    
//	    저장된 파일 경로 반환
	    if (savePath != null) {
	    	path = savePath.toString();
	    	path = path.substring(path.indexOf("img"));
	    }
	    
	    // TODO 학생, 교수여부에 따라 테이블, 컬럼명을 구분하여 넣어준 후 업데이트 하기
	    // TODO Member에서 profile도 가져오도록 수정해야함
	    MemberDto member = new MemberDto();
	    memberDao.profileUpload(member);
	    
	    return "파일을 등록하였습니다.";
	    
	}
	
	public String uploadFile(MultipartFile[] uploadFiles){
		
		Path savePath = null;
		
	    for(MultipartFile file : uploadFiles){
	
	        String originalName = file.getOriginalFilename();
	        String fileName = originalName.substring(originalName.lastIndexOf("\\") + 1);
	        String uuid = UUID.randomUUID().toString();
	        String savefileName = uploadPath + File.separator + uuid + "_" + fileName;
	        savePath = Paths.get(savefileName);
	
	        try {
	            file.transferTo(savePath);
	            
	        } catch (IOException e) {
	            e.printStackTrace();
	            return "파일등록에 실패하였습니다.";
	        }
	    }
	    
	    String path = null;
	    
//	    저장된 파일 경로 반환
	    if (savePath != null) {
	    	path = savePath.toString();
	    	path = path.substring(path.indexOf("img"));
	    }
	    
	    return path;
	    
	}

}
