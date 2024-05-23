package com.kh.pet.info.community.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pet.common.model.vo.PageInfo;
import com.kh.pet.common.template.Pagination;
import com.kh.pet.info.community.model.service.CommunityServiceImpl;
import com.kh.pet.info.model.vo.Info;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityServiceImpl communityService;
	
	@GetMapping("community")
	public String communityForwarding() {
		return "info/community/communityMain";
	}
	
	@ResponseBody
	@GetMapping("selectCommunityList")
	public List<Info> selectCommunityList(String animal, String category, int page){
		
		HashMap<String, String> commMap = new HashMap();
		commMap.put("animal", animal);
		commMap.put("category", category);
		
		PageInfo pi = Pagination.getPageInfo(communityService.selectListCount(commMap), page, 10, 10);
		
		RowBounds rowBounds = new RowBounds(
				(pi.getCurrentPage() - 1) * pi.getBoardLimit(),
				pi.getBoardLimit()
				);
		
		List<Info> list = communityService.selectAllList(commMap, rowBounds);
		
		List<Info> listInfo = communityService.selectCommunityList(list);
		
		for(Info i : listInfo) {
			i.setPageInfo(pi);
		}
		return listInfo;
	}
	
	@ResponseBody
	@GetMapping("communityDetail")
	public ModelAndView communityDetail(ModelAndView mv, int boardNo) {
		
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
	
	
	

}
