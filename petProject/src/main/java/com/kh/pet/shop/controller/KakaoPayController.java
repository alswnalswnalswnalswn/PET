package com.kh.pet.shop.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.pet.shop.model.service.KakaoPayService;
import com.kh.pet.shop.model.vo.KakaoPayVo;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/kakaopay")
@RequiredArgsConstructor
public class KakaoPayController {
	
	private final KakaoPayService kakaoService;
	
	private KakaoPayVo kakaopayVo;
	
	@PostMapping
	public String kakaopay() {
		
		return kakaoService.kakaoPayReady();
	}
	

	
	@GetMapping("success")
	public String kakaopaySuccess(@RequestParam("pg_token")String pg_token){
		kakaopayVo = kakaoService.kakaopayVo(pg_token);
		return "shop/productList";
	}

}
