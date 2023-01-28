package com.spring.Imuseum.view.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.Imuseum.member.MemberService;
import com.spring.Imuseum.member.MemberVO;

@SessionAttributes("member")

@RestController
public class MemberAjaxController {

	@Autowired
	private MemberService memberService;	
	
	//회원 가입
	@PostMapping("/login.do")
	public String login(MemberVO vo, Model model,RedirectAttributes rttr) {
		System.out.println("post방식 login 실행");
		String result = null;
		if(memberService.getMember(vo) != null) {
			if(memberService.getMember(vo).getStatus() == 1) {
				model.addAttribute("member",memberService.getMember(vo));
				result = "true";
			} else if(memberService.getMember(vo).getStatus() == 2) {
				result = "dismiss";
			} else if(memberService.getMember(vo).getStatus() == 3) {
				result = "block";
			}
			
		} else if(memberService.getMember(vo) == null) {
			result = "false";
		}
		return result;
	}	
	@PostMapping("/sign.do")
	public int moveToSign(MemberVO vo) {
		System.out.println(">>> signUp 실행 " );
		System.out.println("vo:" + vo);
		int result = 0;
		try {
			result = memberService.joinMember(vo);
		}catch(Exception e){}
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("/idcheck.do")
	public String idcheck(MemberVO vo) {
		System.out.println(vo);
		String result = "";
		if(memberService.idCheck(vo)!= null) {
			System.out.println("조회된 값이 있음 : " + vo);
			result = "bad";
		} else {
			result = "good";
		}
		return result;
	}
	
	@RequestMapping("/findId.do")
	public String findId(MemberVO vo) {
		System.out.println("::: findId 실행");
		String result = "";
		System.out.println(vo);
		try {
			if(vo.getBirth() == null) {
				result = memberService.findIDByPhone(vo).getId();
			} else if(vo.getPhone() == null){
				result = memberService.findIDByBirth(vo).getId();
			} 
		} catch(Exception e) {
			result = "false";
		}
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("/findPwd.do")
	public String findPwd(MemberVO vo) {
		System.out.println("::: findPwd 실행");
		String result = "";
		System.out.println(vo);
		try {
			if(vo.getBirth() != null) {
				result = memberService.findPasswordByBirth(vo).getPassword();
			} else if(vo.getPhone() != null){
				result = memberService.findPasswordByPhone(vo).getPassword();
			} else if(vo.getEmail() != null) {
				result = memberService.findPasswordByEmail(vo).getPassword();
			}
		} catch(Exception e) {
			e.printStackTrace();
			result = "false";
		}
		System.out.println(result);
		return result;
	}	
}
