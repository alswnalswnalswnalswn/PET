package com.kh.pet.info.community.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public List<Info> selectCommunityList(@RequestParam(value="page", defaultValue="1") int page, 
										  @RequestParam(value="animal", defaultValue="A0")String animal, 
										  @RequestParam(value="category", defaultValue="I0")String category){
		
		HashMap<String, String> commMap = new HashMap();
		commMap.put("animal", animal);
		commMap.put("category", category);
		
		PageInfo pi = Pagination.getPageInfo(communityService.selectListCount(commMap), page, 10, 10);
		RowBounds rowBounds = new RowBounds(
				(pi.getCurrentPage() - 1) * pi.getBoardLimit(),
				pi.getBoardLimit()
				);
		List<Info> listInfo = communityService.selectCommunityList(commMap, rowBounds);
		
		for(Info i : listInfo) {
			i.setPageInfo(pi);
		}
		
		
		
		
		
		return listInfo;
	}
	
	@ResponseBody
	@RequestMapping("communityDetail")
	public Info communityDetail(int boardNo) {
		return communityService.communityDetail(boardNo);
	}
	
	
	
	
	

}
