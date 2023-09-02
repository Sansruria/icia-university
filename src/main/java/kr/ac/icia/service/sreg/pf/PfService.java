package kr.ac.icia.service.sreg.pf;

import kr.ac.icia.dao.sreg.pf.PfDao;
import kr.ac.icia.dto.sreg.pf.PfDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@Slf4j
@RequiredArgsConstructor
@Service
public class PfService {

    @Autowired
    private final PfDao pfDao;

    public ArrayList<PfDto> findByCondition() {
        ArrayList<PfDto> pfList = pfDao.findByCondition();
        for (PfDto dto : pfList) {
            dto.setGender((dto.getGender().equals("1")) ? "남" : "여");
        }
        return pfList;
    }

    public PfDto detail(String pfId) {
        return pfDao.detail(pfId);
    }

    public String write(PfDto pfDto) {
        String pfId = DateTimeFormatter.ofPattern("YYMM").format(LocalDate.now());
        pfDto.setPfId(pfId.substring(0, 2));
        log.info("pfId : {}", pfDto.getPfId());
        String numbering = pfDao.countPfOfYear(pfDto);

        // 자릿수가 1개일 경우 앞에 0을 붙여줌
        if (numbering.length() == 1) {
            numbering = "0" + numbering;
        }

        pfId += pfDto.getDeptId() + numbering;
        pfDto.setPfId(pfId);

        // 주민등록번호 뒷자리를 비밀번호로 함
        String password = pfDto.getRrn();
        String[] splitPassword = password.split("-");
        pfDto.setPassword(splitPassword[1]);
        boolean result = pfDao.write(pfDto);

        if (result) {
            return "저장에 성공하였습니다";
        }
        return "저장에 실패했습니다";
    }

    public String update(PfDto pfDto) {
        boolean result = pfDao.update(pfDto);

        if (result) {
            return "수정에 성공하였습니다";
        }
        return "수정에 실패했습니다";
    }

    public String delete(String pfId) {
        boolean result = pfDao.delete(pfId);

        if (result) {
            return "삭제에 성공하였습니다";
        }
        return "삭제에 실패했습니다";
    }

    public String national(String national) {
        switch (national) {
            case "KR" :
                return "한국";
            case "JP" :
                return "일본";
            case "CN" :
                return "중국";
            case "US" :
                return "미국";
            case "UK" :
                return "영국";
        }
        return null;
    }

}
