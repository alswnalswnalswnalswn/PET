package com.kh.pet.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.Format;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pet.common.model.vo.Animal;
import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.common.model.vo.PageInfo;
import com.kh.pet.common.template.Pagination;
import com.kh.pet.info.model.service.InfoService;
import com.kh.pet.info.model.vo.Info;
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
	private InfoService infoService;
	
	@Autowired
	private JavaMailSenderImpl sender; 
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@PostMapping("login")
	public ModelAndView login(Member member, HttpSession session, ModelAndView mv) {
		
		Member loginUser = memberService.login(member);
		if(loginUser != null && 
		bcryptPasswordEncoder.matches(member.getMemberPwd(), loginUser.getMemberPwd())) {
			
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
		
		member.setMemberPwd(encPwd);
		int memberNo = memberService.join(member);
		if(memberNo > 0) {
			
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
	
	
	@ResponseBody
	@GetMapping("update")
	public String update(HttpServletRequest request, Member member, MultipartFile upfile, HttpSession session, MultipartRequest multiRequest) {
		String encPwd = bcryptPasswordEncoder.encode(member.getMemberPwd());
		member.setMemberPwd(encPwd);
		if(!upfile.getOriginalFilename().equals("")) {
					
			member.setOriginName(upfile.getOriginalFilename());
			member.setChangeName(saveFile(upfile, session));
			member.setProfile(member.getChangeName());
			
		}
		return memberService.update(member) > 0 ? "NNNNN" : "NNNNY";
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
	@GetMapping("pwdCheck")
	public String pwdCheck(Member member) {
		String encPwd = bcryptPasswordEncoder.encode(member.getMemberPwd());
		member.setMemberPwd(encPwd);
		return memberService.pwdCheck(member) > 0 ? "NNNNN" : "NNNNY";
	}
	@ResponseBody
	@GetMapping("updatePwd")
	public String updatePwd(Member member) {
		String encPwd = bcryptPasswordEncoder.encode(member.getMemberPwd());
		member.setMemberPwd(encPwd);
		return memberService.updatePwd(member) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@GetMapping("emailCheck.do")
	public String emailCheck(String email, HttpServletRequest request) throws MessagingException {
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
		
		return code;
		
	}
	
	
	@ResponseBody
	@RequestMapping("checkCode")
	public String checkCode(String code, HttpServletRequest request) {
		
		CertVO certVo = CertVO.builder().who(request.getRemoteAddr()).secret(code).build();
		
		int result = memberService.validate(certVo);
		
		return "result : " + result;
	}
	
	
	@RequestMapping("searchId")
	public String searchId(String email, String memberName, HttpServletRequest request, HttpSession session) throws MessagingException  {
		Member member = new Member();
		member.setEmail(email);
		member.setMemberName(memberName);
		String id = memberService.searchId(member);
		if(id != null) {
			String remoteAddr = request.getRemoteAddr();
			
			CertVO certVo = CertVO.builder().who(remoteAddr).secret(id).build();
			
			memberService.sendMail(certVo);
			
			MimeMessage message = sender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			
			helper.setTo(email);
			helper.setSubject("냥이랑 멍이랑에서 보낸 아이디입니다.");
			helper.setText("아이디 : " + id);
			
			sender.send(message);
			
			session.setAttribute("alertMsg", "메일을 확인해주세요");
		} else {
			session.setAttribute("alertMsg", "가입된 정보가 없습니다. 다시 입력 해주세요");
		}
		return "redirect:/";
	}
	
	@RequestMapping("searchPwd")
	public String searchPwd(String email, String memberId, HttpServletRequest request, HttpSession session) throws MessagingException  {
		Member member = new Member();
		member.setEmail(email);
		member.setMemberId(memberId);
		int memberNo = memberService.searchPwd(member);
		if(memberNo > 0) {
			String remoteAddr = request.getRemoteAddr();
			
			Random r = new Random();
			int i = r.nextInt(10);
			Format f = new DecimalFormat("00");
			String memberPwd = "abcd" + f.format(i);
			
			String encPwd = bcryptPasswordEncoder.encode(memberPwd);
			member.setMemberNo(memberNo);
			member.setMemberPwd(encPwd);

			CertVO certVo = CertVO.builder().who(remoteAddr).secret(memberPwd).build();
				
			if(memberService.updatePwd(member) > 0) {
				
				memberService.sendMail(certVo);
				
				MimeMessage message = sender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
				
				helper.setTo(email);
				helper.setSubject("냥이랑 멍이랑에서 보낸 임시비밀번호입니다.");
				helper.setText("비밀번호 : " + memberPwd);
				
				sender.send(message);
				
				session.setAttribute("alertMsg", "메일을 확인해주세요");	
			} else {
				session.setAttribute("alertMsg", "가입된 정보가 없습니다. 다시 입력 해주세요");
			}
		} else {
			session.setAttribute("alertMsg", "가입된 정보가 없습니다. 다시 입력 해주세요");
		}
		return "redirect:/";
	}
	
	@RequestMapping("myPage")
	public String myPage() {
		return "member/myPage";
	}
	
	
	public String saveFile(MultipartFile file, HttpSession session) {
		String originName = file.getOriginalFilename();
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		int ranNum = (int)(Math.random() * 90000) + 10000;
		
		String changeName = "profile" + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/img/profile/");
		
			try {
				file.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}		
		return changeName;
	}

	@ResponseBody
	@PostMapping("upProfile")
	public ModelAndView upProfile(MultipartHttpServletRequest request, HttpSession session, ModelAndView mv) {
		
		Member member = (Member)session.getAttribute("loginUser");
		member.getMemberNo();
		int memberNo = member.getMemberNo();
		
		MultipartFile file = request.getFile("profile");
        if (!file.isEmpty()) {
        	member.setOriginName(file.getOriginalFilename());
        	member.setChangeName(saveFile(file, session));
        	member.setProfile(member.getChangeName());
        }
		if(memberService.upProfile(member) > 0) {
			
			session.setAttribute("profile", member.getProfile());
			mv.setViewName("redirect:/");
		} else {
			session.setAttribute("alertMsg", "프로필 수정에 실패하였습니다. 다시 시도 해주세요");
			mv.setViewName("redirect:/");
		}
		
		return mv;
		/*
		if(!upfile.getOriginalFilename().equals("")) {
			// 첨부파일이 존재했다 => 업로드 + Board객체에 originName + changeName
			member.setOriginName(upfile.getOriginalFilename());
			member.setChangeName(saveFile(upfile, session));
		}
		System.out.println(member);
		
		if(memberService.upProfile(member) > 0) {
			Member loginUser = memberService.selectUpMember(member.getMemberNo());
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		} else {
			session.setAttribute("alertMsg", "프로필 수정에 실패하였습니다. 다시 시도 해주세요");
			mv.setViewName("redirect:/");
		}
		
		return mv;
		*/
		
	}
	
	@RequestMapping("myBoard")
	public String myboardForwarding() {
		return "member/myboard";
	}
	
	@ResponseBody
	@RequestMapping("selectMyBoard")
	public List<Info> selectMyBoard(String animal, String category, int page, int memberNo) {
		
		HashMap<Object, Object> map = new HashMap();
		map.put("animal", animal);
		map.put("category", category);
		map.put("memberNo", memberNo);
		PageInfo pi = Pagination.getPageInfo(memberService.selectListCount(map), page, 12, 10);
		RowBounds rowBounds = new RowBounds(
				(pi.getCurrentPage() - 1) * pi.getBoardLimit(),
				pi.getBoardLimit()
				);
		List<Integer> boardList = memberService.selectBoard(map, rowBounds);
		System.out.println(boardList);
		List<Info> infoList = new ArrayList<>();
		if (boardList != null && !boardList.isEmpty()) {
			for (Integer boardNo : boardList) {
				map.put("boardNo", boardNo);
				map.put("memberNo", memberNo);
				Info info = memberService.selectMyBoard(map);
				int likeCheck = infoService.likeCheckInfo(map);
				
		        info.setLikeCheck(likeCheck);
		        // PageInfo 설정
		        info.setPageInfo(pi);
		        
		        // 최종 리스트에 추가
		        infoList.add(info);
			}
		}
		System.out.println(infoList);
		for(Info i : infoList){
			i.setPageInfo(pi);
		}
		return infoList;
	}
		
	
	@RequestMapping("selectBoardDetail")
	public ModelAndView selectBoardDetail(int boardNo, ModelAndView mv, HttpSession session) {
		Info info = memberService.selectBoardDetail(boardNo);
			System.out.println(info);
		/*	
		if(info != null) {
			session.setAttribute("info", info);
			mv.setViewName("member/infoDetail");
		} else {
			session.setAttribute("alertMsg", "조회된 게시물이 없습니다.");
			mv.setViewName("redirect:/");
		}
		*/
			if(info != null) {
				mv.addObject("info", info).setViewName("member/infoDetail");
			} else {
				session.setAttribute("alertMsg", "조회된 게시물이 없습니다.");
				mv.setViewName("redirect:/");
			}
			
			
		return mv;
	}
	
	@GetMapping("kakao")
	public String kakaologin(HttpSession session) {
		return "kakao-login";
	}
	
	@GetMapping("code")
	public String code(String code, HttpSession session) throws IOException, ParseException {
		String accessToken = kakaoService.getToken(code);
		Member member = kakaoService.getUserInfo(accessToken);
		
		if(memberService.selectMember(member.getMemberId()) == 0) {
			memberService.socialJoin(member);
			String memberId= member.getMemberId();
			member = memberService.selectSocialMember(memberId);
			session.setAttribute("loginUser", member);
			return "redirect:/";
		} else {
			member.setMemberStatus("C");
			String memberId= member.getMemberId();
			System.out.println(member.getProfile());
			member = memberService.selectSocialMember(memberId);
			session.setAttribute("loginUser", member);
			return "redirect:/";
		}
	}
	
	/*
	@PostMapping("selectSocialMember")
	public String selectSocialMember(Member member, HttpSession session) {
		member.setProfile("profile.png");
		memberService.socialJoin(member);
		String memberId= member.getMemberId();
		member = memberService.selectSocialMember(memberId);
		
		session.setAttribute("loginUser", member);
		return "header";
	}
	
	*/
	
	
	
	
	
	
	
	
	
	
}
