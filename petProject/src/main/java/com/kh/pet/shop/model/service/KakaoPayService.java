package com.kh.pet.shop.model.service;

import com.kh.pet.shop.model.vo.KakaoPayVo;

public interface KakaoPayService {
	String kakaoPayReady();
	
	KakaoPayVo kakaopayVo(String pg_token);
}
