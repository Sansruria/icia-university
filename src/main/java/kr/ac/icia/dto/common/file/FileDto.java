package kr.ac.icia.dto.common.file;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileDto {
	private String profileId;
	private String userId;
	private String originalFileName;
	private String systemFileName;
}
