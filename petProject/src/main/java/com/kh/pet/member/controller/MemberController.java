package com.kh.pet.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.pet.member.model.service.MemberService;
import com.kh.pet.member.model.vo.Member;

@Controller
@RequestMapping("member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@PostMapping("login")
	public String login(Member member,HttpSession session) {
		
		session.setAttribute("loginUser", memberService.login(member));
		System.out.println(memberService.login(member));
		return "main";
	}
	
	@PostMapping("join")
	public String join(Member member, HttpSession session, String animalCode) {
		
		System.out.println(animalCode);
		
		if(member.getMemberId().equals("admin")) {
			member.setMemberStatus("A");
		} else {
			member.setMemberStatus("C");
		}
		memberService.join(member, animalCode);
		return "login";
	}
	
	@ResponseBody
	@GetMapping("idCheck")
	public String idCheck(String checkId) {
		return memberService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
