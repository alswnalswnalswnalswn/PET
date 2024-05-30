package com.kh.pet.community.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pet.common.model.vo.Animal;
import com.kh.pet.common.model.vo.Attachment;
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
		String changeName = "community" + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/img/info/community/");
		
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
	public ModelAndView insertCommunity(HttpSession session, ModelAndView mv, Info info, MultipartFile[] upfiles) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		info.setMemNo(loginUser.getMemberNo());
		
		List<Attachment> attachmentList = new ArrayList();
		
		if(!upfiles[0].getOriginalFilename().equals("")) {
			
			for(int i = 0; i < upfiles.length; i++) {
				
				if(!upfiles[i].getOriginalFilename().equals("")) {
					
					Attachment att = new Attachment();
					att.setOriginName(upfiles[i].getOriginalFilename());
					att.setChangeName(saveFile(upfiles[i], session));
					att.setAttPath("/resources/img/info/community/");
					if(i == 0) {
						att.setAttLevel(1);
					} else {
						att.setAttLevel(2);
					}
					attachmentList.add(att);
				}
				info.setAttachmentList(attachmentList);
			}
		}
		
		List animalCodes = info.getAnimalCode();
		if(animalCodes.get(0).equals("A0")) {
			animalCodes.clear();
			for(int i = 1; i < 7; i++) {
				animalCodes.add("A" + i);
			}
			info.setAnimalCode(animalCodes);
			System.out.println(animalCodes);
		}
		
		if(communityService.insertCommunity(info) > 0) {
			session.setAttribute("alertMsg", "작성 성공");
			mv.setViewName("redirect:/community");
		}
		
		return mv;
	}
	
	@GetMapping("communityDetail/{id}")
	public ModelAndView communityDetail(@PathVariable("id")int boardNo, ModelAndView mv) {

		if(communityService.updateBoardCount(boardNo) > 0) {
			List<Info> list = new ArrayList();
			Info info = new Info();
			
			info.setBoardNo(boardNo);
			list.add(info);
			
			mv.addObject("infoList", communityService.selectCommunityList(list)).setViewName("info/community/communityDetail");
		};
		
		return mv;
	}
	
	

}
