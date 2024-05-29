package com.kh.pet.community.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pet.community.model.service.CommunityServiceImpl;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class CommunityController {
	
	private final CommunityServiceImpl communityService;
	
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
	
	@GetMapping("community")
	public String communityForwarding(){
		return "info/community/communityMain";
	}
	
	@GetMapping("insertCommunityForm")
	public String communityInsertForwarding(){
		return "info/community/communityInsert";
	}
	
	@PostMapping("insertCommunity")
	public ModelAndView insertCommunity(
										HttpSession session, ModelAndView mv, Info info, MultipartFile[] upfile) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		info.setMemNo(loginUser.getMemberNo());
		
		for(int i = 0; i < upfile.length; i++) {
			if(upfile[i].getOriginalFilename().equals("")) {
				saveFile(upfile[i], session);
				info.setOriginName(upfile[i].getOriginalFilename());
				info.setChangeName(saveFile(upfile[i], session));
			}
		}
		
		/*
		if(!upfile.getOriginalFilename().equals("")) {
			saveFile(upfile, session);
			System.out.println(saveFile(upfile, session));
			info.setOriginName(upfile.getOriginalFilename());
			info.setChangeName(saveFile(upfile, session));
		}
		*/
		System.out.println(info);
		
		if(communityService.insertCommunity(info) > 0) {
			session.setAttribute("alertMsg", "작성 성공");
			mv.setViewName("redirect:/community");
		}
		
		return mv;
	}
	
	
	

}
