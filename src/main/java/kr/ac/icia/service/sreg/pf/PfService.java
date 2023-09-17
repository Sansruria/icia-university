package kr.ac.icia.service.sreg.pf;

import kr.ac.icia.dao.sreg.pf.PfDao;
import kr.ac.icia.dto.admin.mm.common.CampusSearchDto;
import kr.ac.icia.dto.admin.mm.dept.DeptDto;
import kr.ac.icia.dto.sreg.common.SregSearchDto;
import kr.ac.icia.dto.sreg.pf.PfDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

    public ArrayList<PfDto> findByCondition(SregSearchDto searchDto) {
        ArrayList<PfDto> pfList = pfDao.findByCondition(searchDto);
        for (PfDto dto : pfList) {
            dto.setGender((dto.getGender().equals("1")) ? "남" : "여");
        }
        return pfList;
    }

    public Integer findAllCount(SregSearchDto searchDto) {
        return pfDao.findAllCount(searchDto);
    }

    public PfDto detail(String pfId) {
        return pfDao.detail(pfId);
    }

    public String write(PfDto pfDto) {
        String pfId = DateTimeFormatter.ofPattern("YYMM").format(LocalDate.now());
        pfDto.setPfId(pfId.substring(0, 2));
        Integer lastNum = pfDao.findLastNum(pfDto);
        log.info("pfId : {}", pfDto.getPfId());
        String numbering = "";

        // 조회 결과가 없을 경우에 0으로 초기화
        if (lastNum == null) {
            lastNum = 0;
        }

        // 조회 결과가 9 미만일 경우
        if (lastNum < 9) {
            numbering = "0" + (++lastNum);
        } else {
            // 조회 결과가 9 이상일 경우
            numbering += ++lastNum;
        }

        pfId = "P" + pfId + pfDto.getDeptId() + numbering;
        pfDto.setPfId(pfId);

        // 주민등록번호 뒷자리를 비밀번호로 함
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String password = pfDto.getRrn();
        String[] splitPassword = password.split("-");
        pfDto.setPassword(passwordEncoder.encode(splitPassword[1]));
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

    public String makeListHtml(SregSearchDto searchDto) {
        String str = "";
        String prefix = "<td>";
        String suffix = "</td>";

        int count = findAllCount(searchDto)+1;

        for (PfDto dto : findByCondition(searchDto)) {
            str += "<tr>";
            str += prefix;
            str += count - dto.getRnum();
            str += suffix;

            str += prefix;
            str += dto.getDeptName();
            str += suffix;

            str += prefix;
            str += "<a href=\"#\" onclick=selected('" + dto.getPfId() + "','" + dto.getName() + "','" + dto.getDeptId() + "','" + dto.getDeptName() +"') "
                    + "style=\"cursor:pointer\" "
                    + "class=\"link-offset-2 link-underline link-underline-opacity-0\">";
            str += dto.getName();
            str += "</a>";
            str += suffix;
            str += "</tr>";
        }

        return str;
    }

}
