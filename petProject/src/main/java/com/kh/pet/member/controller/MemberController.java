package com.kh.pet.member.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
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
import com.kh.pet.member.model.service.KakaoService;
import com.kh.pet.member.model.service.MemberService;
import com.kh.pet.member.model.vo.CertVO;
import com.kh.pet.member.model.vo.Member;
import com.kh.pet.member.model.vo.SocialMember;

@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	KakaoService kakaoService;
	
	@Autowired
	private JavaMailSenderImpl sender; 
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@PostMapping("login")
	public ModelAndView login(Member member, HttpSession session, ModelAndView mv) {
		
		Member loginUser = memberService.login(member);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(member.getMemberPwd(), loginUser.getMemberPwd())) {
			System.out.println(memberService.login(member));
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
			
		} else {
			session.setAttribute("alertMsg", "일치하지 않는 정보입니다. 다시 로그인 해주세요");
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	@PostMapping("join")
	public String join(Member member, HttpSession session, String[] animalList) {
		System.out.println(animalList);
		
		if(member.getMemberId().equals("admin")) {
			member.setMemberStatus("A");
		} else {
			member.setMemberStatus("C");
		}
		String encPwd = bcryptPasswordEncoder.encode(member.getMemberPwd());
		// System.out.println("암호문 : " + encPwd);
		member.setMemberPwd(encPwd);
		int memberNo = memberService.join(member);
		if(memberNo > 0) {
			System.out.println(memberNo);
			for(int i = 0; i < animalList.length; i++) {
				String animalCode = animalList[i];
				Animal animal = new Animal();
				animal.setMemberNo(memberNo);
				animal.setAnimalCode(animalCode);
				memberService.insertAnimals(animal);
			}
		}
		return "redirect:/";
	}
	
	@RequestMapping("searchId")
	public String searchId(String memberName, String email, HttpServletRequest request) {
		String remoteAddr = request.getRemoteAddr();
		
		Random r = new Random();
		int i = r.nextInt(10000);
		Format f = new DecimalFormat("000000");
		String code = f.format(i);
		
		CertVO certVo = CertVO.builder().who(remoteAddr).secret(code).build();
		
		memberService.sendMail(certVo);
		
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		helper.setTo(email);
		helper.setSubject("냥이랑 멍이랑에서 보낸 인증번호입니다.");
		helper.setText("인증번호 : " + code);
		
		sender.send(message);
		
		
		return memberService.searchId(memberName, email) > 0 ? "NNNNN" : "NNNNY";
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
		String remoteAddr = request.getRemoteAddr();
		// System.out.println(remoteAddr);
		
		Random r = new Random();
		int i = r.nextInt(10000);
		Format f = new DecimalFormat("000000");
		String code = f.format(i);
		
		CertVO certVo = CertVO.builder().who(remoteAddr).secret(code).build();
		
		memberService.sendMail(certVo);
		
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		helper.setTo(email);
		helper.setSubject("냥이랑 멍이랑에서 보낸 인증번호입니다.");
		helper.setText("인증번호 : " + code);
		
		sender.send(message);
		
		return code;
		
	}
	
	
	@ResponseBody
	@RequestMapping("checkCode")
	public String checkCode(String code, HttpServletRequest request) {
		
		CertVO certVo = CertVO.builder().who(request.getRemoteAddr()).secret(code).build();
		
		boolean result = memberService.validate(certVo);
		
		return "result : " + result;
	}
	
	@GetMapping("kakao")
	public String kakaologin() {
		return "redirect:/";
	}
	
	@GetMapping("code")
	public String code(String code, HttpSession session) throws IOException, ParseException {
		String accessToken = kakaoService.getToken(code);
		
		SocialMember sm = kakaoService.getUserInfo(accessToken);
		
		memberService.selectMember(sm);
		
		session.setAttribute("loginUser", sm);
		
		return "redirect:kakao";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
