package com.kh.pet.member.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pet.common.model.vo.Animal;
import com.kh.pet.member.model.service.MemberService;
import com.kh.pet.member.model.vo.Member;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private JavaMailSenderImpl sender; 
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@PostMapping("login")
	public ModelAndView login(Member member,HttpSession session, ModelAndView mv) {
		
		
		if(memberService.login(member) != null && 
			bcryptPasswordEncoder.matches(member.getMemberId(), memberService.login(member).getMemberPwd())) {
			session.setAttribute("loginUser", memberService.login(member));
			// System.out.println(memberService.login(member));
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("alert", "일치하지 안흔 정보입니다. 다시 로그인 해주세요");
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	@PostMapping("join")
	public String join(Member member, HttpSession session, List<Animal> animal) {
		
		System.out.println(animal);
		
		if(member.getMemberId().equals("admin")) {
			member.setMemberStatus("A");
		} else {
			member.setMemberStatus("C");
		}
		String encPwd = bcryptPasswordEncoder.encode(member.getMemberPwd());
		System.out.println("암호문 : " + encPwd);
		member.setMemberPwd(encPwd);
		memberService.join(member, animal);
		return "login";
	}
	
	@ResponseBody
	@GetMapping("idCheck")
	public String idCheck(String checkId) {
		return memberService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@GetMapping("checkNick")
	public String checkNick(String nickname) {
		return memberService.checkNick(nickname) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@GetMapping("checkPhone")
	public String checkPhone(String phone) {
		return memberService.checkPhone(phone) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@GetMapping("checkEmail")
	public String checkEmail(String email) {
		return memberService.checkEmail(email) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@GetMapping("emailCheck.do")
	public String emailCheck(String email, HttpServletRequest request) throws MessagingException {
		/*
		SimpleMailMessage message = new SimpleMailMessage();
		message.setSubject("축축");
		message.setText("인증번호를 입력하세요~~");
		String to = "rjsgml922@naver.com";
		message.setTo(to);
		
		sender.send(message);
		return "common/header";
		 */
		
		// System.out.println(remoteAddr);
		
		Random r = new Random();
		int i = r.nextInt(10000);
		Format f = new DecimalFormat("000000");
		String code = f.format(i);
		
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		helper.setTo(email);
		helper.setSubject("냥이랑 멍이랑에서 보낸 인증번호입니다.");
		helper.setText("인증번호 : " + code);
		
		sender.send(message);
		
		return code;
		
	}
	
	
	@ResponseBody
	@GetMapping("checkCode")
	public String checkCode(String code, String email) {
		return code == email ? "NNNNN" : "NNNNY";
	}
	
	@GetMapping("kakao")
	public String kakaologin() {
		return "kakao-login";
	}
	
	@GetMapping("code")
	public String code() {
		return "redirect:kakao";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
