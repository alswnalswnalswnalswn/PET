package com.kh.pet.community.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.pet.common.model.vo.PageInfo;
import com.kh.pet.common.template.Pagination;
import com.kh.pet.community.model.service.CommunityServiceImpl;
import com.kh.pet.info.model.vo.Info;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping(value="/communities", produces="application/json; charset=UTF-8")
public class CommunityRestController {
	
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

	
	@GetMapping
	public String selectCommunityList(@RequestParam("animal") String animal, 
										  @RequestParam("category") String category, 
										  @RequestParam("page") int page){
		
		HashMap<String, String> commMap = new HashMap();
		commMap.put("animal", animal);
		commMap.put("category", category);
		
		PageInfo pi = Pagination.getPageInfo(communityService.selectListCount(commMap), page, 10, 10);
		
		RowBounds rowBounds = new RowBounds(
				(pi.getCurrentPage() - 1) * pi.getBoardLimit(),
				pi.getBoardLimit()
				);
		
		List<Info> list = communityService.selectForwardCount(commMap, rowBounds);
		
		List<Info> listInfo = communityService.selectCommunityList(list);
		
		for(Info i : listInfo) {
			i.setPageInfo(pi);
		}
		return new Gson().toJson(listInfo);
	}
	
	@GetMapping("/{id}")
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
	
	@GetMapping("likeCheck")
	public int likeCheck(int boardNo, int memberNo) {

		HashMap<String, Integer> map = new HashMap();
		map.put("boardNo", boardNo);
		map.put("memberNo", memberNo);
		
		return communityService.likeCheck(map);
	}
	
	@PostMapping("insert")
	public ModelAndView insertCommunity(HttpSession session, ModelAndView mv, Info info, MultipartFile upfile) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			saveFile(upfile, session);
			
			info.setOriginName(upfile.getOriginalFilename());
			info.setChangeName(saveFile(upfile, session));
		}
		
		if(communityService.insertCommunity(info) > 0) {
			session.setAttribute("alertMsg", "작성 성공");
			mv.setViewName("redirect:/community");
		}
		
		return mv;
	}
	

}
