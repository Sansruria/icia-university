package kr.ac.icia.controller.common.member;

import jakarta.servlet.http.HttpSession;
import kr.ac.icia.dto.common.member.MemberDto;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;

import kr.ac.icia.service.common.member.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequiredArgsConstructor
@Controller
public class MemberController {
	
	@Autowired
	private final MemberService memberService;

	@GetMapping("/login")
	public String login() {
		return "common/member/login";
	}

	@PostMapping("/login")
	public String login(HttpSession session, RedirectAttributes rttr, MemberDto memberDto) {
		MemberDto memberInfo = memberService.login(memberDto);

		if (memberInfo != null) {
			session.setAttribute("memberInfo", memberInfo);

			String isPf = memberDto.getUserId().substring(0,1);
			if (isPf.equals("P")) {
				return "redirect:/sreg/pf/main";
			} else if (memberDto.getUserId().equals("admin")) {
				return "redirect:/admin/main";
			} else {
				return "redirect:/sreg/st/main";
			}

		} else {
			rttr.addFlashAttribute("msg", "로그인에 실패했습니다");
			return "redirect:/login";
		}

	}

	@PostMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		session.invalidate();
		rttr.addFlashAttribute("msg", "로그아웃 되었습니다");
		return "redirect:/login";
	}

	@GetMapping("/member/find/id")
	public String findId() {
		return "common/member/findId";
	}

	@GetMapping("/member/find/pw")
	public String findPw() {
		return "common/member/findPw";
	}

}
