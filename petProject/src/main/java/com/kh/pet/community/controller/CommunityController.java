package com.kh.pet.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.kh.pet.community.model.service.CommunityServiceImpl;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class CommunityController {
	
	@GetMapping("community")
	public String communityForwarding(){
		return "info/community/communityMain";
	}
	
	@GetMapping("insertCommunity")
	public String communityInsertForwarding(){
		return "info/community/communityInsert";
	}

}
