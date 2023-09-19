package kr.ac.icia.controller.common.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import kr.ac.icia.service.common.file.FileService;

@RestController
public class FileRestController {
	
	@Autowired
	private FileService fileService;
	
	@PostMapping(value = "/file/api/profile/upload")
	public String profileUpload(MultipartFile[] uploadFiles, HttpSession session){
		fileService.profileUpload(uploadFiles, session);
		return null;
	}

}