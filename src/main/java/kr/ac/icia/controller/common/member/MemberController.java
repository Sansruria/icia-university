package kr.ac.icia.controller.common.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.ac.icia.service.common.member.MemberService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MemberController {
	
	@Autowired
	private final MemberService memberService;

}
