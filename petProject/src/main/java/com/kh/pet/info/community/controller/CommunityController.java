package com.kh.pet.info.community.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("community")
	public String communityForwarding() {
		return "info/community/communityMain";
	}
	
	@ResponseBody
	@RequestMapping("selectCommunityList")
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
	
	@RequestMapping("communityDetail")
	public ModelAndView communityDetail(ModelAndView mv, int boardNo) {
		
		mv.addObject("community", communityService.communityDetail(boardNo)).setViewName("info/community/communityDetail");
		
		return mv;
	}
	
	
	
	
	

}
