package com.kh.pet.info.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	
	@RequestMapping("community")
	public String communityForwarding() {
		return "info/community/communityMain";
	}
	

}
