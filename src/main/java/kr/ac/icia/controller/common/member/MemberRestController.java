package kr.ac.icia.controller.common.member;

import kr.ac.icia.dto.common.member.MemberDto;
import kr.ac.icia.service.common.member.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
public class MemberRestController {

    @Autowired
    private final MemberService memberService;

    @PostMapping("/member/api/find/id")
    public String findId(MemberDto memberDto) {
        String result = memberService.findId(memberDto);
        if (result != null) {
            return result;
        }

        return "등록되지않은 아이디입니다.";
    }

    @PostMapping("/member/api/find/pw")
    public String findPw(MemberDto memberDto) {
        String result = memberService.findPw(memberDto);

        if (result != null) {
            return result;
        }

        return "비밀번호 초기화에 실패했습니다.";
    }

}
