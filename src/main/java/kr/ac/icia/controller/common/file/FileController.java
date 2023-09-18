package kr.ac.icia.controller.common.file;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FileController {
	
	@GetMapping("/file/modal/upload")
	public String fileUpload() {
		return "common/file/fileUploadModal";
	}

}
